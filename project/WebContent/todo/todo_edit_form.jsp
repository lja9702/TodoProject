<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="todo.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" href = "../css/bootstrap.css" type = "text/css" media = "screen"/>
<link rel = "stylesheet" href = "todo.css?q=<%= System.currentTimeMillis() %>" type = "text/css" media = "screen"/>
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
		<table border="1" style="width: 400px">
			<div class="form-group">
			<tbody>
				<tr>
					<td>title</td>
					<td><input class="form-control" type = "text" name = "todo_title" value = "<%=td.getTodo_title()%>"></td>
				</tr>
				<tr>
					<td>memo</td><td><textarea class="form-control" name = "todo_memo"><%=td.getTodo_memo()%></textarea></td>
				</tr>
				<tr>
					<td>dead line</td><td><input class="form-control" type = "date" name = "todo_duedate" value = "<%=td.getTodo_duedate()%>"></td>
				</tr>
				<tr>
					<tr>
						<td><label>우선 순위</label></td>
						<td><select class="custom-select" name = "todo_priority">
							<option value = 5 ${td.getTodo_priority() == 5 ? 'selected' : '' }>우선순위 설정 안함</option>
							<option value = 1 ${td.getTodo_priority() == 1 ? 'selected' : '' }>우선순위 1</option>
							<option value = 2 ${td.getTodo_priority() == 2 ? 'selected' : '' }>우선순위 2</option>
							<option value = 3 ${td.getTodo_priority() == 3 ? 'selected' : '' }>우선순위 3</option>
							<option value = 4 ${td.getTodo_priority() == 4 ? 'selected' : '' }>우선순위 4</option>
							</select>
						</td>
					</tr>
					<td>complete</td>
					<td><input type = "checkbox" name = "todo_complete" ${td.isTodo_complete() ? "checked='checked'" : ""}></td>					
				</tr>
				<tr>
					<td colspan = "2" align = "center">
					<input class="btn btn-info" type = "submit" value = "저장">
					<input class="btn btn-dark" type = "button" value = "삭제" onClick = "delcheck()">
					</td>
				</tr>
			</tbody>
			</div>
		</table>
	</form>
</div>
</body>
</html>