package chat.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class board_DAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String uid = "jongmin";
	private String upw = "tnthd2351";
	
	
	public board_DAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<board_DTO> boardSelect(){
		
		ArrayList<board_DTO> dtos = new ArrayList<board_DTO>();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from chat_board");

			while (rs.next()) {
				board_DTO dto = new board_DTO();
				dto.setNick(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setNum(rs.getString("click"));
				dto.setSeq(rs.getString("seq2"));
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dtos;
		
	}
	public int boardInsert(board_DTO dto) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			result = stmt.executeUpdate("insert into chat_board values('"+ dto.getSeq() + "','" + dto.getNick() + "','" + dto.getTitle() + "','" + dto.getContent() + "','"
					+ dto.getNum() + "')");
			if (result == 1) {
				System.out.println("Insert Complete");
				con.commit();
			} else {
				System.out.println("Insert fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;

	}
	public int boardUpdate(board_DTO dto, String index) {
		Connection con = null;
		Statement  stmt = null;
		int index2 = Integer.parseInt(index)+1;
		String index3 = index2 + "";
		int result = 0;
		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			result = stmt.executeUpdate("update chat_board set title = '"+ dto.getTitle() + "', content = '" + dto.getContent() +"'where seq2 = '" + index3 + "'");
			if (result == 1) {
				System.out.println("Update Complete");
				con.commit();
			} else {
				System.out.println("Update fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return result;
	}
	public void indexUpdate(board_DTO dto, int index) {
		Connection con = null;
		Statement  stmt = null;
		index += 1;
		String index3 = index + "";
		int result = 0;
		try {
			con = DriverManager.getConnection(url, uid, upw);
			stmt = con.createStatement();
			result = stmt.executeUpdate("update chat_board set click = '"+ dto.getNum() + "'where seq2 = '" + index3 + "'");
			if (result == 1) {
				System.out.println("Update Complete");
				con.commit();
			} else {
				System.out.println("Update fail");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
