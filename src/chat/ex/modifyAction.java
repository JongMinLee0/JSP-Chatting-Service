package chat.ex;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class modifyAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		member_DTO dto = new member_DTO();
		member_DAO dao = new member_DAO();
		HttpSession session = request.getSession();
		int result = 0;
		
		String sessionId = session.getAttribute("id").toString();
		dto.setId(sessionId);
		dto.setPw(request.getParameter("pw"));
		dto.setPhone1(request.getParameter("phone1"));
		dto.setPhone2(request.getParameter("phone2"));
		dto.setPhone3(request.getParameter("phone3"));
		dto.setNick(request.getParameter("nick"));
		result = dao.memberUpdate(dto);
		String pages = (String) request.getAttribute("pages");
		
		if(result==1) {
			session.invalidate();
			session.setAttribute("id", dto.getId());
			session.setAttribute("pw", dto.getPw());
			session.setAttribute("nick", dto.getNick());
			pages = "sucess";
			request.setAttribute("pages", pages);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/modify_2.jsp");
			dispatcher.forward(request, response);
			
		}else {
			pages = "fail";
			request.setAttribute("pages", pages);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/modify_2.jsp");
			dispatcher.forward(request, response);
		}
		
	}
}
