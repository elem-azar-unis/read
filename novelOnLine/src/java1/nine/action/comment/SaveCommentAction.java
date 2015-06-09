package java1.nine.action.comment;
/*
 * by mengshu  实现图书评论的功能2012-10-16
 */

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.BookManager;
import java1.nine.dao.CommentManager;
import java1.nine.dao.impl.BookManagerImpl;
import java1.nine.pojo.N_book;
import java1.nine.pojo.N_discuss;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class SaveCommentAction extends ActionSupport implements ServletRequestAware{
private CommentManager commentManager;
private BookManager bookManager;
private N_book nBook;
private N_discuss nDiscuss;
//private String string1;
private String uname;

public String getUname() {
	return uname;
}

public void setUname(String uname) {
	this.uname = uname;
}

public HttpServletRequest getRequest() {
	return request;
}

public void setRequest(HttpServletRequest request) {
	this.request = request;
}

private HttpServletRequest request;


public N_book getnBook() {
	return nBook;
}

public void setnBook(N_book nBook) {
	this.nBook = nBook;
}

public BookManager getBookManager() {
	return bookManager;
}

public void setBookManager(BookManager bookManager) {
	this.bookManager = bookManager;
}

public CommentManager getCommentManager() {
	return commentManager;
}

public void setCommentManager(CommentManager commentManager) {
	this.commentManager = commentManager;
}

public N_discuss getnDiscuss() {
	return nDiscuss;
}

public void setnDiscuss(N_discuss nDiscuss) {
	this.nDiscuss = nDiscuss;
}

	public String execute() throws Exception {

	System.out.println("+=+++=++="+nDiscuss.getN_book().getB_id());
	System.out.println(nDiscuss.getN_user().getU_name());
	String s=request.getSession().getAttribute("name").toString();

	int uid=commentManager.searchUserbyName(s);


	nDiscuss.getN_user().setU_id(uid);
	commentManager.insertCmt(nDiscuss);
//	N_book nBook=bookManager.bookById(nDiscuss.getN_book().getB_id());
//    nBook.setB_cmtnum(nBook.getB_cmtnum()+1);//评论的条数加1
	return SUCCESS;

	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}

}
