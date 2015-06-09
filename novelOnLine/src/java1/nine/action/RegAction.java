package java1.nine.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.UserManager;
import java1.nine.pojo.N_user;

import com.opensymphony.xwork2.ActionSupport;

public class RegAction extends ActionSupport implements ServletRequestAware {
	private N_user n_user;
	private String u_psw;
	private UserManager userManager;
	private HttpServletRequest request;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setN_user(N_user nUser) {
		n_user = nUser;
	}

	public void setU_psw(String uPsw) {
		u_psw = uPsw;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}
	@Override
	public void validate() {
		
		if(n_user.getU_name().trim().equals("")||n_user.getU_name()==null){
			this.addFieldError(n_user.getU_name(), "名称不能为空");
		}else if (n_user.getU_psw().trim().equals("")||n_user.getU_psw()==null) {
			this.addFieldError(n_user.getU_psw(),"密码不能为空");
		}else if (!n_user.getU_psw().equals(u_psw)) {
			this.addFieldError(u_psw, "两次密码不一致");
		}else if (userManager.userInfor(n_user.getU_name())!=null) {
			this.addFieldError(u_psw, "此用户名已经注册，请换一个新的用户名");
		}
	}
	public N_user getN_user() {
		return n_user;
	}

	public String getU_psw() {
		return u_psw;
	}
@Override
public String execute() throws Exception {
	n_user.setU_author("看客");
	userManager.save(n_user);
	request.getSession().setAttribute("name",n_user.getU_name());
	return SUCCESS; 
}

}
