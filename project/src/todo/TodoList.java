package todo;

public class TodoList {
	private int todo_id;
	private String todo_title;
	private String todo_memo;
	private String todo_duedate;
	private boolean todo_complete;
	public int getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
	}
	public String getTodo_title() {
		return todo_title;
	}
	public void setTodo_title(String todo_title) {
		this.todo_title = todo_title;
	}
	public String getTodo_memo() {
		return todo_memo;
	}
	public void setTodo_memo(String todo_memo) {
		this.todo_memo = todo_memo;
	}
	public String getTodo_duedate() {
		return todo_duedate;
	}
	public void setTodo_duedate(String todo_duedate) {
		this.todo_duedate = todo_duedate;
	}
	public boolean isTodo_complete() {
		return todo_complete;
	}
	public void setTodo_complete(boolean todo_complete) {
		this.todo_complete = todo_complete;
	}
}
