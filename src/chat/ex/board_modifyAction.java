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
		String answer = request.getParameter("index");
		dto.setTitle(request.getParameter("board_title"));
		dto.setContent(request.getParameter("put_content"));
		System.out.println(dto.getContent());
		System.out.println(dto.getTitle());
		result = dao.boardUpdate(dto, answer);
        String pages = (String) request.getAttribute("pages");
		
		if(result==1) {
			response.sendRedirect("board_List.jsp");
		}else {
			response.sendRedirect("board_modify.jsp");
		}
	}

}
