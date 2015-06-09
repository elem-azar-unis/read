package java1.nine.action.comment;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.CommentManager;
import java1.nine.pojo.N_reply;

import com.opensymphony.xwork2.ActionSupport;

public class SaveReplayAction extends ActionSupport implements ServletRequestAware{
private CommentManager commentManager;
private N_reply nRepalay;
private HttpServletRequest request;



public CommentManager getCommentManager() {
	return commentManager;
}

public void setCommentManager(CommentManager commentManager) {
	this.commentManager = commentManager;
}

public N_reply getnRepalay() {
	return nRepalay;
}

public void setnRepalay(N_reply nRepalay) {
	this.nRepalay = nRepalay;
}

public HttpServletRequest getRequest() {
	return request;
}

public void setRequest(HttpServletRequest request) {
	this.request = request;
}

@Override
	public String execute() throws Exception {
		
	String s=request.getSession().getAttribute("name").toString();
	int uid=commentManager.searchUserbyName(s);
	nRepalay.getN_user().setU_id(uid);
	commentManager.insertCmt(nRepalay);
	
	
	
		return SUCCESS;
	}

@Override
public void setServletRequest(HttpServletRequest arg0) {
	request=arg0;
	
}
}
