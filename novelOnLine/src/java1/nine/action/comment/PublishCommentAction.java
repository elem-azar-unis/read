package java1.nine.action.comment;
/*
 * 用户保存书的ID即b_id没有与数据库的操作 ，因此在applicationcontext.xml中不用配置bean
 */


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.CommentManager;
import java1.nine.pojo.N_book;
import java1.nine.pojo.N_discuss;
import java1.nine.pojo.N_user;

import com.opensymphony.xwork2.ActionSupport;

public class PublishCommentAction extends ActionSupport implements ServletRequestAware {

	private int bid;//记录book的id
	private HttpServletRequest request;
	//回复信息时传递的参数
//	private int did;	
//	public int getDid() {
//		return did;
//	}
//	public void setDid(int did) {
//		this.did = did;
//	}
	
	
	
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}

	public String execute() throws Exception {
		if (request.getSession().getAttribute("name") ==null || request
				.getSession().getAttribute("name").equals(""))
	     return "log";
		//
//		else if (bid!=0&did!=0) {
//			request.setAttribute("bid", bid);
//			request.setAttribute("did", did);
//			return "replay";
//		}
//		else {
//			return SUCCESS;
//		}
		//
		else {
		request.getSession().setAttribute("bid", bid);
		return SUCCESS;

		}
		
					
	}
	

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
	}
}
