package todo;

import java.sql.*;
import java.util.*;

public class TodoBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//mySQL 연결정보
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/todoDB?characterEncoding=UTF-8&serverTimezone=UTC";
	
	//db 연결 메서드
	void connect() {
		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url, "todo", "1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//내용 갱신을 위한 메서드
	public boolean updateDB(TodoList todolist) {
		connect();
		
		String sql = "update todolist set todo_title = ?, todo_memo = ?, todo_duedate = ?, todo_complete = ?, todo_priority = ? where todo_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todolist.getTodo_title());
			pstmt.setString(2, todolist.getTodo_memo());
			pstmt.setString(3, todolist.getTodo_duedate());
			pstmt.setBoolean(4, todolist.isTodo_complete());
			pstmt.setInt(5, todolist.getTodo_priority());
			pstmt.setInt(6, todolist.getTodo_id());
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	//삭제 메서드
	public boolean deleteDB(int id) {
		connect();
		
		String sql = "delete from todolist where todo_id=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	//추가 메서드
	public boolean insertDB(TodoList todolist) {
		connect();
		//sql 문자열, id는 자동 등록되므로 입력하지 않는다.
		String sql = "insert into todolist(todo_title, todo_memo, todo_duedate, todo_complete, todo_priority) "
				+ "values (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, todolist.getTodo_title());
			pstmt.setString(2, todolist.getTodo_memo());
			pstmt.setString(3, todolist.getTodo_duedate());
			pstmt.setBoolean(4, todolist.isTodo_complete());
			pstmt.setInt(5, todolist.getTodo_priority());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			disconnect();
		}
		return true;
	}
	
	//특정 todo목록글 가져오는 메서드
	public TodoList getDB(int id) {
		connect();
		String sql = "select * from todolist where todo_id=?";
		TodoList todolist = new TodoList();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			//데이터가 하나만 있으므로 rs.next()를 한번만 실행
			rs.next();
			todolist.setTodo_id(rs.getInt("todo_id"));
			todolist.setTodo_title(rs.getString("todo_title"));
			todolist.setTodo_memo(rs.getString("todo_memo"));
			todolist.setTodo_duedate(rs.getString("todo_duedate"));
			todolist.setTodo_complete(rs.getBoolean("todo_complete"));
			todolist.setTodo_priority(rs.getInt("todo_priority"));
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return todolist;
	}
	
	//목록을 가져오는 메서드
	public ArrayList<TodoList> getDBList(){
		connect();
		ArrayList<TodoList> arraylist = new ArrayList<TodoList>();
		
		String sql = "select * from todolist order by todo_priority,todo_id";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				TodoList todolist = new TodoList();
				
				todolist.setTodo_id(rs.getInt("todo_id"));
				todolist.setTodo_title(rs.getString("todo_title"));
				todolist.setTodo_memo(rs.getString("todo_memo"));
				todolist.setTodo_duedate(rs.getString("todo_duedate"));
				todolist.setTodo_complete(rs.getBoolean("todo_complete"));
				todolist.setTodo_priority(rs.getInt("todo_priority"));
				arraylist.add(todolist);
			}
			rs.close();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		
		return arraylist;
	}
}
