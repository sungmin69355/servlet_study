<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Author 정보 저장 </title>


</head>
<body>

<%
request.setCharacterEncoding("utf-8");
int author_id = Integer.parseInt(request.getParameter("author_id")); 
String author_name = request.getParameter("author_name");
String author_desc = request.getParameter("author_desc");


System.out.println("author_id = " + author_id);
System.out.println("author_name = " + author_name);
System.out.println("author_desc = " + author_desc);

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "webdb";
String pass = "aa693655";
String sql = " UPDATE AUTHOR " 
        + " SET AUTHOR_NAME = ?, "
        + "     AUTHOR_DESC = ?  "
        + " WHERE AUTHOR_ID = ?  ";
try {
  Class.forName("oracle.jdbc.driver.OracleDriver");
  conn = DriverManager.getConnection(url, user, pass);
  //System.out.println("접속성공");
  pstmt = conn.prepareStatement(sql);
  pstmt.setString(1, author_name);
  pstmt.setString(2, author_desc);
  pstmt.setInt(3, author_id);


  int count = pstmt.executeUpdate();

  // 4.결과처리
  System.out.println(count + "건 처리");
   
} catch (ClassNotFoundException e) {
  System.out.println("error: 드라이버 로딩 실패 - " + e);
} catch (SQLException e) {
  System.out.println("error:" + e);
} finally {
  try {
    if(pstmt != null) { pstmt.close();}
    if(conn != null)  { conn.close(); }
  } catch (SQLException e) {
    System.out.println("error:" + e);
  }
}

%>     

<a href="inSertAuthorForm.html" >새로운 정보 입력</a><br>
<a href="viewAuthorTable.jsp" +  >입력된 정보 조회</a><br>
</body>
</html>








