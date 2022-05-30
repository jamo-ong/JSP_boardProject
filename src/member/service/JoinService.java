package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import jdbc.JdbcUtil;
import jdbc.connection.ConnectionProvider;
import member.dao.MemberDao;
import member.model.Member;

//id 중복 체크
public class JoinService {
	
	private MemberDao memberDao = new MemberDao();
	
	public void join(JoinRequest joinRequest) {
		Connection conn = null;
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			//id 중복 체크
			Member member = memberDao.selectById(conn, joinRequest.getId());
			if (member != null) {
				JdbcUtil.rollback(conn);
				throw new DuplicateIdException();
			}
			//db에 저장
			memberDao.insert(conn, 
					new Member(
							joinRequest.getId(), 
							joinRequest.getName(), 
							joinRequest.getPassword(),
							joinRequest.getEmail(),
							joinRequest.getPhoneNo(),
							new Date())
					);
			
			conn.commit();
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
