package java1.nine.action;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import java1.nine.dao.BookManager;
import java1.nine.pojo.N_book;

public class BookInforAction extends ActionSupport {
	private int id;
	private BookManager bookManager;
	private N_book infor;
	private List<N_book> endBooks=new ArrayList<N_book>();
	public List<N_book> getEndBooks() {
		return endBooks;
	}

	public N_book getInfor() {
		return infor;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}
	public void setInfor(N_book infor) {
		this.infor = infor;
	}

	public String execute() throws Exception {
		infor=bookManager.bookInfor(id);
		endBooks=bookManager.books("select * from ((select * from N_book  sample(90) where b_over='已完结') book) where  rownum<=15 ");
		return SUCCESS;
	}
}
