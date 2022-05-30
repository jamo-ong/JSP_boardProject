package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.service.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;
import mvc.command.CommandHandler;

//회원가입 검사
public class JoinHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/joinForm.jsp";
	private JoinService joinService = new JoinService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		//index.jsp에서 옴
		if (request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);
		//joinForm.jsp에서 옴
		} else if (request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response);
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		JoinRequest joinRequest = new JoinRequest();
		joinRequest.setId(request.getParameter("id"));
		joinRequest.setName(request.getParameter("name"));
		joinRequest.setPassword(request.getParameter("password"));
		joinRequest.setConfirmPassword(request.getParameter("confirmPassword"));
		joinRequest.setEmail(request.getParameter("email"));
		joinRequest.setPhoneNo(request.getParameter("phoneNo"));

		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		joinRequest.validate(errors);
		
		//입력 폼으로 다시 보낸다.
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			//폼 입력값을 joinReq 오브젝트로 만들어서 joinService 클래스의 join 메소드로 넘겨주고 실행
			joinService.join(joinRequest);
			return "/WEB-INF/view/joinSuccess.jsp";
		} catch (DuplicateIdException e) {
			//join 메소드에서 id 중복체크에 걸리면 errors에 기록하고 가입 폼 반환
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

}
