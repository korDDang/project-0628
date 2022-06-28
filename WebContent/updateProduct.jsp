<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function check() {
 var doc=document.form;
 if(doc.productId.value==""){
	 alert("상품코드를 입력하세요");
	 doc.productId.focus()
 }else if(doc.name.value==""){
	 alert("상품명을 입력하세요");
	 doc.name.focus();
 }else if(doc.name.value.length<4||doc.name.value.length>50){
	 alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요.");
	 doc.name.focus();
 }else if(doc.unitprice.value==""){
	 alert("가격을 입력하세요"); 
	doc.unitprice.focus(); 
 }else if(doc.unitprice.value==0||isNaN(doc.unitprice.value)){
	 alert("[가격]\n숫자만 입력하세요");
	 doc.unitprice.focus();
 }else if(doc.unitprice.value<0){
	 alert("[가격]\n음수를 입력할 수 없습니다.");
	 doc.unitprice.focus();
 }else{
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
String productId=request.getParameter("productId");
try{
	String sql="select * from product0628 where productId=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String unitprice=rs.getString("unitprice");
		String description=rs.getString("description");
		String category=rs.getString("category");
		String manufacturer=rs.getString("manufacturer");
		String unitsInstock=rs.getString("unitsInstock");
		String condition=rs.getString("condition");
	

%>
<h2>상품 수정 화면</h2>
<hr>
<form name="form" method="post" action="updateProductProcess.jsp">
<table border="1" id="tab1">
<tr>
<th class="th1">상품코드</th>
<td>
<input type="text" name="productId"  class="in1" value="<%=productId %>">
</td>
</tr>
<tr>
<th class="th1">상품명</th>
<td>
<input type="text" name="name" class="in1" value="<%=name %>">
</td>
</tr>
<tr>
<th class="th1">가 격</th>
<td>
<input type="text" name="unitprice" class="in1" value="<%=unitprice %>">
</td>
</tr>
<tr>
<th class="th1">상세정보</th>
<td>
<input type="text" name="description" class="in1" value="<%=description %>">
</td>
</tr>
<tr>
<th class="th1">제조사</th>
<td>
<input type="text" name="manufacturer" class="in1" value="<%=manufacturer %>">
</td>
</tr>
<tr>
<th class="th1">분류</th>
<td>
<input type="text" name="category" class="in1" value="<%=category %>">
</td>
</tr>
<tr>
<th class="th1">재고수</th>
<td>
<input type="text" name="unitsInstock" class="in1" value="<%=unitsInstock %>">
</td>
</tr>
<tr>
<th class="th1">상태</th>
<td>
<input type="radio" name="condition" class="in1" value="신규제품" <%=condition.equals("신규제품")?"checked":"" %>>신규 제품
<input type="radio" name="condition" class="in1" value="중고제품" <%=condition.equals("중고제품")?"checked":"" %>>중고 제품
<input type="radio" name="condition" class="in1" value="재생제품" <%=condition.equals("재생제품")?"checked":"" %>>재생 제품
</td>
</tr>
<tr>
<td colspan="2" class="td1">
<input type="button" value="등록" onclick="check()" class="bt1">
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