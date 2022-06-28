<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<h2>회원 목록</h2>
<%
int cnt=0;
try{
	String sql="select count(*) from member0628";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
}catch(SQLException e){
	e.printStackTrace();
}
%>
<div style="margin: 0 20%">총 <%=cnt %>명의 회원이 있습니다.</div>
<hr>
<table border="1" id="tab1">
<tr>
<th class="th1">아이디</th>
<th class="th1">성 명</th>
<th class="th1">비밀<br>번호</th>
<th class="th1">성별</th>
<th class="th1">생년월<br>일</th>
<th class="th1">이메일</th>
<th class="th1">연락처</th>
<th class="th1">주소</th>
<th class="th1">입력일</th>
<th class="th1">구분</th>
</tr>
<%

try{
	String sql="select id,password,name,gender,birth,mail,phone,address,to_char(timeStamp,'YYYY-MM-DD')from member0628";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString(1);
		String password=rs.getString(2);
		String name=rs.getString(3);
		String gender=rs.getString(4);
		String birth=rs.getString(5);
		String mail=rs.getString(6);
		String phone=rs.getString(7);
		String address=rs.getString(8);
		String timeStamp=rs.getString(9);
	
%>
<tr>
<td class="td1"><%=id %></td>
<td class="td1"><%=name %></td>
<td class="td1"><%=password %></td>
<td class="td1"><%=gender%></td>
<td class="td1"><%=birth %></td>
<td class="td1"><%=mail %></td>
<td class="td1"><%=phone %></td>
<td class="td1"><%=address %></td>
<td class="td1"><%=timeStamp %></td>
<td class="td1"><a href="updateMember.jsp?id=<%=id %>">수정</a>/<br>
<a href="deleteMember.jsp?id=<%=id %>">삭제</a>
</td>
</tr>
<%
}
}catch(Exception e){
	e.printStackTrace();
	System.out.println("조회실패");
}%>
</table>
<div style="text-align: center;"><input type="button" value="작성" onclick="location.href='addMember.jsp'" style="color: white; background: black; width: 100px;"></div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>