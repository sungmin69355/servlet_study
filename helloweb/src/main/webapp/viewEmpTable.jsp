<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>

<%!
  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  
  String url = "jdbc:oracle:thin:@localhost:1521:xe";
  String user = "hr";
  String pass = "hr";
  String sql = " select e.employee_id, e.first_name, to_char(e.hire_date,'yyyy-mm-dd') hire_date, d.department_name,mng.first_name manager, e.salary"
             + " from employees e, employees mng, departments d "
             + " where e.department_id = d.department_id"
             + " and e.manager_id = mng.employee_id"
             + " ORDER BY 1";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Author Table 내용</title>
<style type="text/css" media="screen">
*           { margin:0; padding:0 }
body        { font-family: '맑은 고딕' 돋움; font-size:0.75em; color:#333 }

.tbl-ex     { margin:10px auto; border:1px solid #333; border-collapse:collapse; border-left-width:0; border-right-width:0 }

.tbl-ex th, 
.tbl-ex td  { border:1px solid #333; padding:8px; border-left-width:1; border-right-width:1  } 

.tbl-ex th  { background-color:#999; font-size:1.1em; color:#fff; border-top-width:2px; border-bottom-width:2px }
.tbl-ex td  { border-style:solid }
.tbl-ex tr.even     { background-color:#E8ECF6  }

.tbl-ex tr:hover,
.tbl-ex tr.even:hover   { background-color:#fc6; cursor:pointer }

</style>

</head>
<body>
  <table class="tbl-ex">
    <tr>
      <th>사번</th>
      <th>이름</th>
      <th>입사일</th>
      <th>부서</th>
      <th>매니저</th>
      <th>급여</th>
    </tr>
<%
try {
  Class.forName("oracle.jdbc.driver.OracleDriver");
  conn = DriverManager.getConnection(url, user, pass);
  //System.out.println("접속성공");
  pstmt = conn.prepareStatement(sql);
  rs = pstmt.executeQuery();
  int count = 0;
  while (rs.next()) {
    count++;
    
    int employee_id = rs.getInt("employee_id");
    String first_name = rs.getString("first_name");
    String hire_date = rs.getString("hire_date");
    String department_name = rs.getString("department_name");
    String manager = rs.getString("manager");
    int salary = rs.getInt("salary");
    
    if(count%2 == 0){
      out.println("<tr class='even'>");
    }else{
      out.println("<tr class='odd'>");
    }
    out.println("  <td>"+ employee_id +"</td>");
    out.println("  <td>"+ first_name +"</td>");
    out.println("  <td>"+ hire_date +"</td>");
    out.println("  <td>"+ department_name +"</td>");
    out.println("  <td>"+ manager +"</td>");
    out.println("  <td>"+ salary +"</td>");
    
    out.println("</tr>");
  }
   
} catch (ClassNotFoundException e) {
  System.out.println("error: 드라이버 로딩 실패 - " + e);
} catch (SQLException e) {
  System.out.println("error:" + e);
} finally {
  try {
    if(rs != null)    { rs.close();}
    if(pstmt != null) { pstmt.close();}
    if(conn != null)  { conn.close(); }
  } catch (SQLException e) {
    System.out.println("error:" + e);
  }
}
%>     
    
  </table>
</body>
</html>








