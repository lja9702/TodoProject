<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, todo.*"%> 
<!DOCTYPE html>
<html>
<head>
<title>my todo list main</title>
<link rel = "stylesheet" href = "../css/bootstrap.css" type = "text/css" media = "screen"/>
<link rel = "stylesheet" href = "todo.css?q=<%= System.currentTimeMillis() %>" type = "text/css" media = "screen"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList"/>
<jsp:useBean id = "td" scope="request" class="todo.TodoList"/>
</head>

<body>
<div name = "head" align = "center">
	<h2>My Todo List</h2>
	<hr>
</div>
<div>
	<div class="main inlinediv">
		<div name = "todoList">
		<h3 align = "center">해야할 일</h3>
			<table class="table" border = "1">
				<tbody>
				<%
					for(TodoList tdlist : (ArrayList<TodoList>) datas){
						if(!tdlist.isTodo_complete()){
				%>
				<tr class = "p_tit_<%= tdlist.getTodo_priority()%>">
					<td>
						<%
							Date date = tdlist.getDate_duedate();
							if (date != null && date.compareTo(new Date()) < 0) {
						%>
							<span><img src="../image/alert.png" style="width:30px;height:30px;"></span>
						<%		
							}
						%>
						<span style="margin:0 10px">[<%= tdlist.getString_priority()%>]</span>
						<span style="margin:0 5px">
							<span style="margin:0 1px">[title]</span>
							<span style="margin:0 5px"><a href="todo_control.jsp?action=edit&todo_id=<%= tdlist.getTodo_id()%>"><%= tdlist.getTodo_title()%></a></span>
						</span>
						<%	if(tdlist.getTodo_duedate() != null){
						%>
							<span style="margin:30px">[dead line]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= tdlist.getTodo_duedate() %></span></td>
							
						<%
							} 
						%>
					</td>
				</tr>
				<tr class = "p_mem_<%= tdlist.getTodo_priority()%>">
					<td><%= tdlist.getTodo_memo()%></td>
				</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
		</div>
		<div name = "complete list">
		<h3 align = "center">완료된 일</h3>
			<table class="table" border = "1">
				<tbody>
				<%
					for(TodoList tdlist : (ArrayList<TodoList>) datas){
						if(tdlist.isTodo_complete()){
				%>
				<tr class = "p_tit_<%= tdlist.getTodo_priority()%>">
					<td>
						<%
							Date date = tdlist.getDate_duedate();
							if (date != null && date.compareTo(new Date()) < 0) {
						%>
							<span><img src="../image/alert.png" style="width:30px;height:30px;"></span>
						<%		
							}
						%>
						<span style="margin:0 10px">[<%= tdlist.getString_priority()%>]</span>
						<span style="margin:0 5px">
							<span style="margin:0 1px">[title]</span>
							<span style="margin:0 5px"><a href="todo_control.jsp?action=edit&todo_id=<%= tdlist.getTodo_id()%>"><%= tdlist.getTodo_title()%></a></span>
						</span>
						<%	if(tdlist.getTodo_duedate() != null){
						%>
							<span style="margin:30px">[dead line]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= tdlist.getTodo_duedate() %></span></td>
							
						<%
							} 
						%>
					</td>
				</tr>
				<tr class = "p_mem_<%= tdlist.getTodo_priority()%>">
					<td><%= tdlist.getTodo_memo()%></td>
				</tr>
				<%
						}
					}
				%>
				</tbody>
			</table>
		</div>	
	</div>
	<div name = "sidebar" class="sidebar inlinediv">
		<%--새로운 todolist 추가 --%>
		<form name = "sidebar" method = post action = "todo_control.jsp">
		<input type = hidden name = "action" value = "insert">
		<div name = "newTodo">
			<h3 align="center">new todo</h3>
			<div class="form-group">
				<div>
				<table class="table" border="1">
				<tbody>
				<tr>
					<td><label>title</label></td>
					<td><input class="form-control" type = "text" name = "todo_title" maxlength = "50"></td>
				</tr>
				<tr>
					<td><label>memo</label></td>
					<td><textarea class="form-control" name = "todo_memo" maxlength = "200"></textarea></td>
				</tr>
				<tr>
					<td><label>우선 순위</label></td>
					<td><select class="custom-select" name = "todo_priority">
						<option selected value = 5>우선순위 설정 안함</option>
						<option value = 1>우선순위 1</option>
						<option value = 2>우선순위 2</option>
						<option value = 3>우선순위 3</option>
						<option value = 4>우선순위 4</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><label>dead line</label></td>
					<td><input class="form-control" type = "date" name = "todo_duedate" maxlength = "15"></td>
				</tr>
				</div>
				<td colspan = "2" align = "center">
					<input class="btn btn-info" type = "submit" value = "add new todo">
					<input class="btn btn-dark" type = "reset" value = "reset">
				</td>
				</tbody>
				</table>
			</div>
		</div>
		</form>
	</div>
</div>
</body>
</html>