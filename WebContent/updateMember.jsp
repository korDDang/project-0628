<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function ch(){
	var doc=document.form;
	if(doc.mail.options[doc.mail.selectedIndex].value=="0"){
		doc.mail2.disabled=true;
		doc.mail2.value="";
	}else if(doc.mail.options[doc.mail.selectedIndex].value=="9"){
		doc.mail2.disabled=false;
		doc.mail2.value="";
		doc.mail2.focus();
	}else{
		doc.mail2.disabled=true;
		doc.mail2.value=doc.mail.options[doc.mail.selectedIndex].value;
	}
	
}



function check() {
	var doc=document.form;
	if(doc.name.value==""){
		alert("이름을 입력하세요.");
		doc.name.focus();
	}else if(doc.password.value==""){
		alert("비밀번호를 입력하세요.");
		doc.password.focus();
	}else if(doc.pass2.value==""){
		alert("확인비밀번호를 입력하세요.");
		doc.pass2.focus();
	}else if(doc.password.value!=doc.pass2.value){
		alert("비밀번호를 동일하게 입력하세요.");
		doc.password.focus();
	}else{
		doc.mail2.disabled=false;
		doc.submit();
	}
}

</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<%
int ma=0;
try{
	String sql="select max(id) from member0628";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	if(rs.next()){
		ma=rs.getInt(1)+1;
	}else{
		System.out.println("실패");
	}
}catch(SQLException e){
	e.printStackTrace();
}


String id=request.getParameter("id");

try{
	String sql="select password,name,gender,birth,mail,phone,address,to_char(timeStamp,'YYYY-MM-DD')from member0628 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String password=rs.getString("password");
		String name=rs.getString("name");
		String gender=rs.getString("gender");
		String birth=rs.getString("birth");
		String br[]=birth.split("/");
		String mail=rs.getString("mail");
		String mi[]=mail.split("@");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		String timeStamp=rs.getString(8);
	
	
		

%>
<h2>회원 가입 수정 화면</h2>
<hr>
<form name="form" method="post" action="updateMemberProcess.jsp">
<table border="1" id="tab1">
<tr>
<th class="th1">아이디</th>
<td>
<input type="text" name="id" value="<%=id %>" class="in1">
</td>
</tr>
<tr>
<th class="th1">성 명</th>
<td>
<input type="text" name="name" class="in1" value="<%=name%>">
</td>
</tr>
<tr>
<th class="th1">비밀번호</th>
<td>
<input type="password" name="password" class="in1"  value="<%=password%>">
</td>
</tr>
<tr>
<th class="th1">비밀번호 확인</th>
<td>
<input type="password" name="pass2" class="in1" value="<%=password%>">
</td>
</tr>
<tr>
<th class="th1">성 별</th>
<td>
<input type="radio" name="gender" value="남성" <%=gender.equals("남성")?"checked":"" %>>남성
<input type="radio" name="gender" value="여성" <%=gender.equals("여성")?"checked":"" %>>여성
</td>
</tr>
<tr>
<th class="th1">생 일</th>
<td>
<input type="number" name="birth" class="in1" value="<%=br[0]%>">년
<select name="birth1" class="in1">
<option value="01" <%=br[1].equals("01")?"selected":""%>>1월</option>
<option value="02"  <%=br[1].equals("02")?"selected":""%>>2월</option>
<option value="03"  <%=br[1].equals("03")?"selected":""%>>3월</option>
<option value="04"  <%=br[1].equals("04")?"selected":""%>>4월</option>
<option value="05"  <%=br[1].equals("05")?"selected":""%>>5월</option>
<option value="06"  <%=br[1].equals("06")?"selected":""%>>6월</option>
<option value="07"  <%=br[1].equals("07")?"selected":""%>>7월</option>
<option value="08"  <%=br[1].equals("08")?"selected":""%>>8월</option>
<option value="09"  <%=br[1].equals("09")?"selected":""%>>9월</option>
<option value="10"  <%=br[1].equals("10")?"selected":""%>>10월</option>
<option value="11"  <%=br[1].equals("11")?"selected":""%>>11월</option>
<option value="12"  <%=br[1].equals("11")?"selected":""%>>12월</option>
</select>월
<select name="birth2" class="in1">
<option value="01" <%=br[2].equals("01")?"selected":""%>>1일</option>
<option value="02" <%=br[2].equals("02")?"selected":""%>>2일</option>
<option value="03" <%=br[2].equals("03")?"selected":""%>>3일</option>
<option value="04" <%=br[2].equals("04")?"selected":""%>>4일</option>
<option value="05" <%=br[2].equals("05")?"selected":""%>>5일</option>
<option value="06" <%=br[2].equals("06")?"selected":""%>>6일</option>
<option value="07" <%=br[2].equals("07")?"selected":""%>>7일</option>
<option value="08" <%=br[2].equals("08")?"selected":""%>>8일</option>
<option value="09" <%=br[2].equals("09")?"selected":""%>>9일</option>
<option value="10" <%=br[2].equals("10")?"selected":""%>>10일</option>
<option value="11" <%=br[2].equals("11")?"selected":""%>>11일</option>
<option value="12" <%=br[2].equals("12")?"selected":""%>>12일</option>
<option value="13" <%=br[2].equals("13")?"selected":""%>>13일</option>
<option value="14" <%=br[2].equals("14")?"selected":""%>>14일</option>
<option value="15" <%=br[2].equals("15")?"selected":""%>>15일</option>
<option value="16" <%=br[2].equals("16")?"selected":""%>>16일</option>
<option value="17" <%=br[2].equals("17")?"selected":""%>>17일</option>
<option value="18" <%=br[2].equals("18")?"selected":""%>>18일</option>
<option value="19" <%=br[2].equals("19")?"selected":""%>>19일</option>
<option value="20" <%=br[2].equals("20")?"selected":""%>>20일</option>
<option value="21" <%=br[2].equals("21")?"selected":""%>>21일</option>
<option value="22" <%=br[2].equals("22")?"selected":""%>>22일</option>
<option value="23" <%=br[2].equals("23")?"selected":""%>>23일</option>
<option value="24" <%=br[2].equals("24")?"selected":""%>>24일</option>
<option value="25" <%=br[2].equals("25")?"selected":""%>>25일</option>
<option value="26" <%=br[2].equals("26")?"selected":""%>>26일</option>
<option value="27" <%=br[2].equals("27")?"selected":""%>>27일</option>
<option value="28" <%=br[2].equals("28")?"selected":""%>>28일</option>
<option value="29" <%=br[2].equals("29")?"selected":""%>>29일</option>
<option value="30" <%=br[2].equals("30")?"selected":""%>>30일</option>
<option value="31" <%=br[2].equals("31")?"selected":""%>>31일</option>
</select>일
</td>
</tr>
<tr>
<th class="th1">이메일</th>
<td>
<input type="text" name="mail1" class="in1" value="<%=mi[0]%>">@
<input type="text" name="mail2" class="in1" value="<%=mi[1]%>">
<select name="mail" class="in1" onchange="ch()">
<option value="0" <%=mi[1].equals("0")?"selected":"" %>>선택하세요</option>
<option value="9" <%=mi[1].equals("9")?"selected":"" %>>직접입력</option>
<option value="naver.com" <%=mi[1].equals("naver.com")?"selected":"" %>>naver.com</option>
<option value="hanmail.net" <%=mi[1].equals("hanmail.net")?"selected":"" %>>hanmail.net</option>
<option value="daum.net" <%=mi[1].equals("daum.net")?"selected":"" %>>daum.net</option>
<option value="nate.com" <%=mi[1].equals("nate.com")?"selected":"" %>>nate.com</option>
</select>
</td>
</tr>
<tr>
<th class="th1">연락처</th>
<td>
<input type="text" name="phone" class="in1" value="<%=phone%>"> 
</td>
</tr>
<tr>
<th class="th1">주소</th>
<td>
<input type="text" name="address" class="in1" value="<%=address%>">
</td>
</tr>
<tr>
<th class="th1">일자</th>
<td>
<input type="text" name="timeStamp" class="in1" value="<%=timeStamp%>"> 
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="submit" value="등록" onclick="check()" class="bt1">
<input type="button" value="취소" onclick="history.back(-1)"class="bt1">
</td>
</tr>
<%

}

}catch(SQLException e){
e.printStackTrace();
}

%>
</table>
</form>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>