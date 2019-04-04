package chat.ex;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class board_modifyAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("UTF-8");
		board_DTO dto = new board_DTO();
		board_DAO dao = new board_DAO();
		
		int result = 0;
		String index = request.getParameter("index");
		dto.setTitle(request.getParameter("board_title"));
		dto.setContent("put_content");
		result = dao.boardUpdate(dto, index);
        String pages = (String) request.getAttribute("pages");
		
		if(result==1) {
			pages = "sucess";
			request.setAttribute("pages", pages);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/board_modify.jsp");
			dispatcher.forward(request, response);
			
		}else {
			pages = "fail";
			request.setAttribute("pages", pages);
			ServletContext context = request.getServletContext();
			RequestDispatcher dispatcher = context.getRequestDispatcher("/board_modify.jsp");
			dispatcher.forward(request, response);
		}
	}

}
