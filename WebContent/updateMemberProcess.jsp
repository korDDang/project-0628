<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
String id=request.getParameter("id");
String password=request.getParameter("password");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String birth=request.getParameter("birth")+"/"+request.getParameter("birth1")+"/"+request.getParameter("birth2");
String mail=request.getParameter("mail1")+"@"+request.getParameter("mail2");
String phone=request.getParameter("phone");
String address=request.getParameter("address");
String timeStamp=request.getParameter("timeStamp");


try{
	String sql="update member0628 set password=?,name=?,gender=?,birth=?,mail=?,phone=?,address=?,timeStamp=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(9,id);
	pstmt.setString(1,password);
	pstmt.setString(2,name);
	pstmt.setString(3,gender);
	pstmt.setString(4,birth);
	pstmt.setString(5,mail);
	pstmt.setString(6,phone);
	pstmt.setString(7,address);
	pstmt.setString(8,timeStamp);
	pstmt.executeUpdate();
	%>
	<script>
	alert("수정성공");
	history.back(-1);
	
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("수정실패");
}

%>
</body>
</html>