package java1.nine.action.comment;

import java.util.List;

import java1.nine.dao.CommentManager;
import java1.nine.pojo.N_reply;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class ReplayAction extends ActionSupport implements ServletRequestAware{

	private HttpServletRequest request;
//	private int bookid;
	private int did;
	
	private CommentManager commentManager;
	private List<N_reply> nReplies;

	
	
	public CommentManager getCommentManager() {
		return commentManager;
	}
	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}
	public List<N_reply> getnReplies() {
		return nReplies;
	}
	public void setnReplies(List<N_reply> nReplies) {
		this.nReplies = nReplies;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	

	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	@Override
	public String execute() throws Exception {
		if (request.getSession().getAttribute("name") ==null || request
				.getSession().getAttribute("name").equals(""))
			{
				return "log";
			}
		
		else{
			
			nReplies=commentManager.searchRepliesby(did);
			request.getSession().setAttribute("did", did);
			return SUCCESS;
		}
		
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
	

}
