package chat.ex;

import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginAction implements Action{
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
	
		member_DAO dao = new member_DAO();
		ArrayList<member_DTO> dtos = dao.memberSelect();
		member_DTO dto = new member_DTO();
		boolean compare = false;

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		response.setCharacterEncoding("UTF-8");
		String result = (String) request.getAttribute("reslut");
		for(int i=0; i<dtos.size(); i++) {
			dto = dtos.get(i);
			String id1 = dto.getId();
			String pw1 = dto.getPw();
			if(id1.equals(id) && pw1.equals(pw)){
				result = "sucess";
				HttpSession session = request.getSession();
				String nick = dto.getNick();
				session.setAttribute("id", id1);
				session.setAttribute("nick", nick);
				session.setAttribute("pw", pw1);
				request.setAttribute("result", result);
				ServletContext context = request.getServletContext();
				RequestDispatcher dispatcher = context.getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
				compare = true;
			} else if(id == null || pw == null)
				continue;
		}
		if(!compare) {
			result = "fail";
			request.setAttribute("result", result);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
		
		
		
	}

}
