package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.DeleteMemberRequest;
import member.service.DeleteMemberService;
import member.service.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;
import mvc.command.CommandHandler;

//회원탈퇴 핸들러
public class DeleteMemberHandler implements CommandHandler{

	private static final String DELETE_VIEW = "/WEB-INF/view/deleteForm.jsp";
	private DeleteMemberService delMemService = new DeleteMemberService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (request.getMethod().equalsIgnoreCase("GET")) { 
			return processForm(request, response);
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
		
	}

	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return DELETE_VIEW;
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		//객체 생성
		DeleteMemberRequest delMemRequest = new DeleteMemberRequest();
			delMemRequest.setId(request.getParameter("id"));
			delMemRequest.setPassword(request.getParameter("password"));
				
				Map<String, Boolean> errors = new HashMap<>();
				request.setAttribute("errors", errors);
				delMemRequest.validate(errors);
				
				if (!errors.isEmpty()) {
					return DELETE_VIEW;
				}
				
				try {
					delMemService.deleteMember(delMemRequest);
					return "/WEB-INF/view/deleteSuccess.jsp";
				} catch (DuplicateIdException e) {
					//id 중복체크
					errors.put("duplicateId", Boolean.TRUE);
					return DELETE_VIEW;
				}
	}
	
}
