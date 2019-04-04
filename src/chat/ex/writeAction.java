package chat.ex;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class writeAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		board_DTO dto = new board_DTO();
		board_DAO dao = new board_DAO();
		int result = 0;
		HttpSession session = request.getSession();
		
		dto.setNick(session.getAttribute("nick").toString());
		dto.setTitle(request.getParameter("board_title"));
		dto.setContent(request.getParameter("put_content"));
		dto.setNum("0");
		
		result = dao.boardInsert(dto);
		String pages = (String) request.getAttribute("pages");
		
		if(result==1) {
			pages = "sucess";
			request.setAttribute("pages", pages);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/board_write.jsp");
			dispatcher.forward(request, response);
			
		}else {
			pages = "fail";
			request.setAttribute("pages", pages);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/board_write.jsp");
			dispatcher.forward(request, response);
		}

	}

}
