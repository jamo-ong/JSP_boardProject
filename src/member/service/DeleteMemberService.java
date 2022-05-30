package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

public class DeleteMemberService {

private MemberDao memberDao = new MemberDao();
	
	public void deleteMember(DeleteMemberRequest delMemReq) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);

			Member member = memberDao.selectById(conn, delMemReq.getId());
			if (member==null || (!member.getPassword().equals(delMemReq.getPassword()))) {
				throw new DuplicateIdException();
			}
			
			memberDao.delete(conn, member);
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
