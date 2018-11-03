<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, todo.*"%>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="td" scope="page" class="todo.TodoBean" />
<jsp:useBean id="todolist" class="todo.TodoList"/>
<jsp:setProperty name="todolist" property="*"/>

<%
	String action = request.getParameter("action");
	if(action.equals("list")){
		// db list
		request.setAttribute("datas", td.getDBList()); 
		pageContext.forward("todoMain.jsp");
	}
	else if(action.equals("insert")){
		if(td.insertDB(todolist)){
			response.sendRedirect("todo_control.jsp?action=list");
		}
		else{
			throw new Exception("DB 입력 오류");
		}
	}
	else if(action.equals("edit")){
		String td_id = request.getParameter("todo_id");
		TodoList todo = td.getDB(Integer.parseInt(td_id));
		request.setAttribute("td", todo);
		pageContext.forward("todo_edit_form.jsp");
	}
	else if(action.equals("update")){
		if(td.updateDB(todolist)){
			response.sendRedirect("todo_control.jsp?action=list");
		}
		else
			throw new Exception("DB 갱신 오류");
	}
	else if(action.equals("delete")){
		if(td.deleteDB(Integer.parseInt(request.getParameter("todo_id")))){
			response.sendRedirect("todo_control.jsp?action=list");
		}
		else
			throw new Exception("DB 삭제 오류");
	}
%>