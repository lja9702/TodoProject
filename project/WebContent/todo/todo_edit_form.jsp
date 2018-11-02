<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage = "addrbook_error.jsp" import="todo.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "todo.css" type = "text/css" media = "screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id = "td" scope="request" class="todo.TodoList"/>

<title>todoList edit</title>
</head>
<body>
<div align = "center">
	<h2>todoList edit</h2>
	<hr>
	[<a href = "todo_control.jsp?action=list">Main으로...</a>] <p>
	<form name = form1 method = post action = todo_control.jsp>
	<input type = "hidden" name = "todo_id" value = "<%=td.getTodo_id() %>">
	<input type = "hidden" name = "action" value = "update">
		<script language = "JavaScript">
			function delcheck(){
				result = confirm("정말로 삭제하시겠습니까?");
				
				if(result){
					document.form1.action.value="delete";
					document.form1.submit();
				}
			}
		</script>
		<table border="1">
			<tr><td>title</td>
				<td><input type = "text" name = "todo_title" value = "<%=td.getTodo_title()%>"></td>
			</tr>
			<tr>
				<td>memo</td><td><input type = "text" name = "todo_memo" value = "<%=td.getTodo_memo()%>"></td>
			</tr>
			<tr>
				<td>dead line</td><td><input type = "date" name = "todo_duedate" value = "<%=td.getTodo_duedate()%>"></td>
			</tr>
			<tr>
				<td>complete</td><td><input type = "checkbox" name = "todo_complete" value = "완료" checked="checked">

			</tr>
			<tr>
				<td colspan = "2" align = "center">
				<input type = "submit" value = "저장">
				<input type = "reset" value = "취소">
				<input type = "button" value = "삭제" onClick = "delcheck()">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>