package java1.nine.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import java1.nine.dao.BookManager;
import java1.nine.dao.UserManager;
import java1.nine.pojo.N_book;

public class NovelUpdateAction extends ActionSupport implements ServletRequestAware {
	private BookManager bookManager;
	private UserManager userManager;
	private HttpServletRequest request;
	public HttpServletRequest getRequest() {
		return request;
	}
	
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}

	private N_book novel;
	
	public N_book getNovel() {
		return novel;
	}
	public void setNovel(N_book novel) {
		this.novel = novel;
	}
	private N_book novel1;
	public N_book getNovel1() {
		return novel1;
	}
	public void setNovel1(N_book novel1) {
		this.novel1 = novel1;
	}
	
	@Override
	public String execute() throws Exception {
		int id=novel.getB_id();
		novel1=bookManager.bookInfor(id);
		novel1.setB_type(novel.getB_type());
		novel1.setB_intro(novel.getB_intro());
		novel1.setB_over(novel.getB_over());
		novel1.setB_freeScan(novel.getB_freeScan());
		novel1.setB_recommend(novel.getB_recommend());
		novel1.setB_salePrice(novel.getB_salePrice());
		userManager.update(novel);
		return SUCCESS;
		
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
}
