<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, todo.*"%> 
<!DOCTYPE html>
<html>
<head>
<title>my todo list main</title>
<link rel = "stylesheet" href = "todo.css" type = "text/css" media = "screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id = "td" scope="request" class="todo.TodoList"/>
</head>

<body>
<div name = "head" align = "center">
	<h2>My Todo List</h2>
	<hr>
</div>
<div name = "todoList" align = "left">
	<table border = "1">
		<tr bgcolor = "#99CCFF" >
		<th>해야할 일</th>
		<%
			for(TodoList tdlist : (ArrayList<TodoList>) datas){
				if(!tdlist.isTodo_complete()){
		%>
		<tr>
			<td><%=tdlist.getTodo_id() %></td>
			<tr>
			<td><a href="todoList_control.jsp?action=edit"><%= tdlist.getTodo_title()%></a></td>
			<td>dead line: <%= tdlist.getTodo_duedate() %></td>
			</tr>
			<tr><%= tdlist.getTodo_memo()%></tr>
		</tr>
		<%
				}
			}
		%>
	</table>
</div>

<div name = "sidebar" align = "right">
	<%--새로운 todolist 추가 --%>
	<form name = "sidebar" method = post action = "create_todo.jsp">
	<input type = hidden name = "action" value = "insert">
	<div name = "newTodo">
		<h2>new Todo</h2>
		<div>
			<div>
			<table border="1">
			<tr>
				<td><label>title</label></td>
				<td><input type = "text" name = "todo_title" maxlength = "50"></td>
			</tr>
			<tr>
				<td><label>memo</label></td>
				<td><input type = "text" name = "todo_memo" maxlength = "200"></td>
			</tr>
			<tr>
				<td><label>dead line</label></td>
				<td><input type = "date" name = "todo_duedate" maxlength = "15"></td>
			</tr>
			</div>
			<td colspan = "2" align = "center">
			<input type = "submit" value = "add new todo">
			<input type = "reset" value = "reset">
			</td>
			</table>
		</div>
	</div>
	</form>
	
	<br>
	<div name = "complete list">
		<table border = "1">
		<tr bgcolor = "#99CCFF" >
		<th>완료된 일</th>
		<%
			for(TodoList tdlist : (ArrayList<TodoList>) datas){
				if(!tdlist.isTodo_complete()){
		%>
		<tr>
			<td><%=tdlist.getTodo_id() %></td>
			<tr>
			<td><a href="todoList_control.jsp?action=edit"><%= tdlist.getTodo_title()%></a></td>
			<td>dead line: <%= tdlist.getTodo_duedate() %></td>
			</tr>
			<tr><%= tdlist.getTodo_memo()%></tr>
		</tr>
		<%
				}
			}
		%>
	</table>
	</div>	
</div>
</body>
</html>