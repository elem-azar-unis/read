package java1.nine.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.BookManager;
import java1.nine.dao.UserManager;
import java1.nine.pojo.N_book;
import java1.nine.pojo.N_user;

import com.opensymphony.xwork2.ActionSupport;

public class UserAction extends ActionSupport implements ServletRequestAware {
	private N_user n_user;
	private UserManager userManager;
	private HttpServletRequest request;
	private N_user user;
	private BookManager bookManager;
	private List<N_book> books =new ArrayList<N_book>();
	private List<Integer> pageList= new ArrayList<Integer>();//在comobox中显示页数
	private int pNum;//获取用户选择的页数
	

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}


	public List<N_book> getBooks() {
		return books;
	}

	public void setBooks(List<N_book> books) {
		this.books = books;
	}

	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}
	private static  int  pageNum = 0;//当前页的首条记录的索引
	
	

	public static int getPageNum() {
		return pageNum;
	}

	public static void setPageNum(int pageNum) {
		UserAction.pageNum = pageNum;
	}

	public int getRowNum() {
		return rowNum;
	}
	private final  int rowNum = 10;//一页显示的总条数
	private int number;//总页数
	
	

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	private List<N_user> users =new ArrayList<N_user>();
	public List<N_user> getUsers() {
		return users;
	}

	public N_user getUser() {
		return user;
	}

	public N_user getN_user() {
		return n_user;
	}
	
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	public HttpServletRequest getRequest() {
		return request;
	}
	public void setN_user(N_user nUser) {
		n_user = nUser;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}
	public String extrance() throws Exception {
		return "extrance";
	}

	
	public String login() throws Exception {
		if (userManager.isAllow(n_user.getU_name(), n_user.getU_psw())) {
			request.getSession().setAttribute("name", n_user.getU_name());
			if (n_user.getU_name().equals("admin")) {
				return "manager";
			}else {
				user=userManager.userInfor(n_user.getU_name());
				if (user.getU_author().equals("作者")) {
					books=bookManager.books("select * from N_book book where book.u_id="+user.getU_id());
				}
				return "login";
			}
			
		} else
			return INPUT;
	}

	public String getInto()throws Exception{
		
		if (request.getSession().getAttribute("name")==null) {
			
			return "input";
		}else {
			String name=request.getSession().getAttribute("name").toString();
			if(name.equals("admin")){
				return "manager";
			}else {
				user=userManager.userInfor(name);
				if (user.getU_author().equals("作者")) {
					books=bookManager.books("select * from N_book book where book.u_id="+user.getU_id());
				}
			}
			
			return "getinto";
		}
		
	}
	/*查询前十条普通用户信息
	 * 
	 * */
	public String usually()throws Exception{
		int  totalNum=userManager.userNum();
		number=totalNum/10+1;
		for (int i = 0; i < number; i++) {
			pageList.add(i+1);
		}
		users=userManager.users("from N_user", 0, 10);
		return "usually";
	}
	/*
	 * 上一页下一页的实现（用户）
	 * */
	public String next() throws Exception {
		

		int  totalNum=userManager.userNum();
		number=totalNum/10+1;
		for (int i = 0; i < number; i++) {
			pageList.add(i+1);
		}
		String page = request.getParameter("page");
		System.out.println(page);
		
		if (page.equals("pre")) {
			pageNum -= rowNum;
			if (pageNum >=0) {
			 users=userManager.users("from N_user", pageNum, rowNum);
			} else {
				users = userManager.users("from N_user", 0, rowNum);
				pageNum += rowNum;
			}
		} else if (page.equals("next")) {
			pageNum += rowNum;
			if (pageNum<totalNum) {
				users = userManager.users("from N_user", pageNum, rowNum);
			}
			else {
				pageNum-=rowNum;
				users = userManager.users("from N_user", pageNum, rowNum);
			}
		}else  
		  {
			int n=pNum;//得到用户选择的页数（即第几页）
			users = userManager.users("from N_user", 10*(n-1), rowNum);//显示对应页数的信息
			pageNum=10*(n-1);//修改pageNum值，该为当前页数的正确值，使其在下一次点击上一页下一页的时候正确显示
		}
		return "next";
	}
	
	/*根据用户名称查询用户的详细信息
	 * 
	 * */
	public String infor() throws Exception{
		String name=request.getParameter("name");
		n_user=userManager.userInfor(name);
		return "infor";
	}
	/*
	 * 更新用户信息
	 * */
	public String update()throws Exception{
		userManager.update(n_user);
		return "update";
		
	}
	/*
	 * 删除用户信息
	 * */
	public String delete() throws Exception{
		
		N_user user=userManager.userInfor(request.getParameter("name"));
		userManager.delete(user);
		return "delete";
	}
	/*
	 * 用户充值
	 * */
	public String addCharge() throws Exception{
		int  chargeNum=Integer.parseInt(request.getParameter("chargeNum"));
		String name=request.getSession().getAttribute("name").toString();
		N_user user=userManager.userInfor(name);
		user.setU_balance(user.getU_balance()+chargeNum);
		userManager.update(user);
		return "addCharge";
	}
	/*作者将自己的书设为已完结状态
	 * */
	public String over()throws Exception{
		int id=Integer.parseInt(request.getParameter("id"));
		N_book book=bookManager.bookInfor(id);
		book.setB_over("已完结");
		userManager.update(book);
		return "over";
		
	}
	/*
	*用户退出
	*/
	public String logout() throws Exception{
		request.getSession().setAttribute("name", null);
		return "logout";
		
	}
}
