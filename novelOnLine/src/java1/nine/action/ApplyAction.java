package java1.nine.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import java1.nine.dao.UserManager ;
import java1.nine.pojo.N_user;

public class ApplyAction extends ActionSupport implements ServletRequestAware{
	private UserManager userManager ;
	private HttpServletRequest request;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
	@Override
	public String execute() throws Exception {
		String name=request.getSession().getAttribute("name").toString();
		N_user user= userManager.userInfor(name);
		user.setU_author("作者");
		userManager.update(user);
		return SUCCESS;
	}
}
