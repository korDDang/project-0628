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
	String sql="insert into member0628 values(?,?,?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,password);
	pstmt.setString(3,name);
	pstmt.setString(4,gender);
	pstmt.setString(5,birth);
	pstmt.setString(6,mail);
	pstmt.setString(7,phone);
	pstmt.setString(8,address);
	pstmt.setString(9,timeStamp);
	pstmt.executeUpdate();
	%>
	<script>
	alert("등록성공");
	history.back(-1);
	
	</script>
	<% 
}catch(SQLException e){
	e.printStackTrace();
	System.out.println("등록실패");
}

%>
</body>
</html>