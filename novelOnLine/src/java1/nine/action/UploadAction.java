package java1.nine.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class UploadAction extends ActionSupport implements ServletRequestAware{
	private File fName;
	public File getfName() {
		return fName;
	}

	public void setfName(File fName) {
		this.fName = fName;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	private HttpServletRequest request;

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
	@Override
	public String execute() throws Exception {
		
	
		return SUCCESS;
	}
}
