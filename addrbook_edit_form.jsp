<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.ch08.*"%>
<jsp:useBean id="ab" scope="request" class="jspbook.ch08.AddrBook"/>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function delcheck(){
		result=confirm("정말로 삭제하시겠습니까?");
		if(result==true){
			document.form1.action.value="delete";
			document.form1.submit();
		}else return;
		
	}
</script>
<link rel="stylesheet" href="addrbook.css" type="text/css" media="screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록 : 수정화면</title>
</head>
<body>
<div align="center">
<h2>주소록 : 수정화면</h2>
<hr>
[<a href=addrbook_control.jsp?action=list>주소록 목록으로</a>]<p>
<form name=form1 method=post action=addrbook_control.jsp>
<input type=hidden name="ab_id" value="<%=ab.getAb_id() %>">
<input type=hidden name="action" value="update">

<table border="1">
<tr>
<th>이름</th>
<td><input type="text" name="ab_name" value="<%=ab.getAb_name() %>"></td></tr>
<tr>
<th>email</th>
<td><input type="text" name="ab_email" value="<%=ab.getAb_email() %>"></td></tr>
<tr>
<th>전화번호</th>
<td><input type="text" name="ab_tel" value="<%=ab.getAb_tel() %>"></td></tr>
<tr>
<th>생일</th>
<td><input type="date" name="ab_birth" value="<%=ab.getAb_birth() %>"></td></tr>
<tr>
<th>회사</th>
<td><input type="text" name="ab_comdept" value="<%=ab.getAb_comdept() %>"></td></tr>
<tr>
<th>메모</th>
<td><input type="text" name="ab_memo" value="<%=ab.getAb_memo() %>"></td></tr>
<tr>
<td colspan=2 align=center><input type=submit value="저장">
<input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
</form>
</div>
</body>
</html>