<%@ page import="java.sql.*"%>
<%
	String name = request.getParameter("val");
	if (name == null || name.trim().equals("")) {
		out.print("<p>Please enter name!</p>");
	} else {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3310/employee", "root",
					"root");
			PreparedStatement ps = con.prepareStatement("select * from emp1 where name like '" + name + "%'");
			ResultSet rs = ps.executeQuery();

			if (!rs.isBeforeFirst()) {
				out.println("<font color:red'><p>No Record Found!</p></font>");
			} else {
				out.print("<table border='1' cellpadding='2' width='100%'>");
				out.print(
						"<tr><th>Id</th><th>Name</th><th>Salary</th> </tr>");

				while (rs.next()) {
					out.print("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td><td>"
							+ rs.getString(3) );

				}
				out.print("</table>");
			} //end of else for rs.isBeforeFirst  
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	} //end of else
%>
