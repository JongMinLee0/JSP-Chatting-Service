package chat.ex;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doAction(request, response);
		
	}
	
	public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path = request.getParameter("what");
		System.out.println("컨트롤러 : " + path);
		request.setCharacterEncoding("UTF-8");
		try {
			if(path.equals("register")) {
				registerAction act = new registerAction();
				act.execute(request, response);
			} else if(path.equals("login")) {
				loginAction act = new loginAction();
				act.execute(request, response);
			} else if(path.equals("modify")) {
				modifyAction act = new modifyAction();
				act.execute(request, response);
			} else if(path.equals("board_write")) {
				writeAction act = new writeAction();
				act.execute(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
