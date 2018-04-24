package homework;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Homework
 */
@WebServlet("/Homework")
public class Homework extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Homework() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		Connection conn = null;
		Statement stat = null;
		ResultSet rs = null;
		
		out.println("<html><head><style>"
				+ "table,td,th { border:1px solid black; border-collapse: collapse; }"
				+ "td,th { padding:5px;text-align:left; }"
				+ "tr:nth-child(even) { background-color:#eee; }"
				+ "tr:nth-child(odd) { background-color:#fff; }"
				+ "th { background-color:black; color:white; }"
				+ "</style></head><body><center><h1>My Table</h1>");
		
		String table ="<table><tr><th>ID</th><th>Name</th><th>Nick Name</th></tr>";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		try {
			String url = "jdbc:mysql://localhost/deneme?useSSL=false";
			conn = DriverManager.getConnection(url,"panda1","1234");
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		try {
			stat = conn.createStatement();
			rs = stat.executeQuery("select*from deneme.people");
			while(rs.next()) {
			table += "<tr><td>"+rs.getInt("id")+"</td>"
        		+ "<td>"+rs.getString("name")+"</td>"
        		+"<td>"+rs.getString("surname")+"</td></tr>";
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}table += "</table></body></html>";
		out.print(table);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
