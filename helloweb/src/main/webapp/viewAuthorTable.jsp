<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! //변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String user = "webdb";
	String pass = "aa693655";
	
	String sql = "select author_id, author_name, author_desc from author";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>저자 정보 보기</title>
</head>
<body>
<table width="800" border="1">
	<tr>
		<th>저자번</th>
		<th>저자</th>
		<th>설명</th>
	</tr>
	<%
		try{
			//Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDirverz");  //MS-sql
			//Class.forName("org.gjt.mm.msql.Driver");  //mySql
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
            	out.print("<tr>");
				out.print("<td>"+rs.getInt("author_id")+"</td>");
				out.print("<td>"+rs.getString("author_name")+"</td>");
				out.print("<td>"+rs.getString("author_desc")+"</td>");
				out.print("</tr>");
            }
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) 	 rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	%>
</table>
</body>
</html>