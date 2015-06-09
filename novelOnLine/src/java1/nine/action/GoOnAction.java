package java1.nine.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.BookManager;
import java1.nine.pojo.N_book;

import com.opensymphony.xwork2.ActionSupport;

public class GoOnAction extends ActionSupport implements ServletRequestAware {
	private BookManager bookManager;
	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}

	private HttpServletRequest request;
	private  String sectionNum;//将要更新的章数
	private int num;//已经更新的总张数
	private int id;//小说的ID
	private N_book yourBook ;
	
	public N_book getYourBook() {
		return yourBook;
	}

	public void setYourBook(N_book yourBook) {
		this.yourBook = yourBook;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public String execute() throws Exception {
		
		 id=Integer.parseInt(request.getParameter("bid").toString());
		yourBook =bookManager.bookInfor(id);
		 num=bookManager.sectionNum(id).size();
		sectionNum="第"+(num+1)+"章";
		return SUCCESS;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getSectionNum() {
		return sectionNum;
	}

	public void setSectionNum(String sectionNum) {
		this.sectionNum = sectionNum;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}
}
