/**
 * 
 */
package java1.nine.action.comment;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.CommentManager;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author ETP_2
 *
 */
public class LoginAction extends ActionSupport implements ServletRequestAware{
	
	private CommentManager commentManager;
	private String name;
	private String password;
	private HttpServletRequest request;

	public CommentManager getCommentManager() {
		return commentManager;
	}


	public void setCommentManager(CommentManager commentManager) {
		this.commentManager = commentManager;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String execute() throws Exception {
		if (commentManager.isAllow(name, password).equals("true")) {
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("password",password );
			return SUCCESS;
		}
		else if(name==null||name.equals("")){
			this.addFieldError("name", "用户名不能为空！");
		}
		else if(password==null||password.equals("")){
			this.addFieldError("password", "密码不能为空！");
		}
		else
			this.addActionMessage("用户名或密码不正确！");
		    return "fail";
		
	}


	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;		
	}
}
