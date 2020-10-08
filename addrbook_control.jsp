<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="addrbook_error.jsp" import="jspbook.ch08.*,java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="ab" scope="page" class="jspbook.ch08.AddrBean"></jsp:useBean>
<jsp:useBean id="addrbook" class="jspbook.ch08.AddrBook"></jsp:useBean>
<jsp:setProperty name="addrbook" property="*"/>
<%
String action = request.getParameter("action");
if(action.equals("list")){
	ArrayList<AddrBook> datas = ab.getDBList();
	request.setAttribute("datas", datas);
	pageContext.forward("addrbook_list.jsp");
}
else if(action.equals("insert")){
	if(ab.insertDB(addrbook)){
		response.sendRedirect("addrbook_control.jsp?action=list");
	}else throw new Exception("DB 입력 오류");
}
else if(action.equals("edit")){
	AddrBook abook=ab.getDB(addrbook.getAb_id());
	if(!request.getParameter("upasswd").equals("1234")){
		out.println("<script>alert('비밀번호가 틀렸습니다.'); history.go(-1);</script>)");
	}else{
		request.setAttribute("ab", abook);
		pageContext.forward("addrbook_edit_form.jsp");
	}
}
else if(action.equals("update")){
	if(ab.updateDB(addrbook)){
		response.sendRedirect("addrbook_control.jsp?action=list");
	}else throw new Exception("DB 갱신 오류");
}
else if(action.equals("delete")){
	if(ab.deleteDB(addrbook.getAb_id())){
		response.sendRedirect("addrbook_control.jsp?action=list");
	}else throw new Exception("DB 삭제 오류");
}else{
	out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
}
%>
