package java1.nine.action;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.BookManager;
import java1.nine.dao.UserManager;
import java1.nine.pojo.N_book;
import java1.nine.pojo.N_shop;
import java1.nine.pojo.N_user;

import com.opensymphony.xwork2.ActionSupport;

public class ShopAction extends ActionSupport implements ServletRequestAware{
	private BookManager bookManager;
	private UserManager userManager;
	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}
	private List<N_book> renqiBooks=new ArrayList<N_book>();
	private List<N_book> suijiBooks=new ArrayList<N_book>();
	private List<N_book> xuanhuanBooks=new ArrayList<N_book>();
	private List<N_book> xianxiaBooks=new ArrayList<N_book>();
	private List<N_shop> shopcars=new ArrayList<N_shop>();

	private int goodsNum;//购物车中的商品总数
	private int totalPrice;//购物车中商品的总价格
	private String tag;//由于多个页面需跳转至同一个success.jsp页面，所以设置一个标示符来判断是从哪里跳过去的

	
	public String getTag() {
		return tag;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public int getGoodsNum() {
		return goodsNum;
	}
	public List<N_shop> getShopcars() {
		return shopcars;
	}
	private HttpServletRequest request;
	private N_book bookInfor;
	public N_book getBookInfor() {
		return bookInfor;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public List<N_book> getRenqiBooks() {
		return renqiBooks;
	}
	public List<N_book> getSuijiBooks() {
		return suijiBooks;
	}
	public List<N_book> getXuanhuanBooks() {
		return xuanhuanBooks;
	}
	public List<N_book> getXianxiaBooks() {
		return xianxiaBooks;
	}
	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}
	/*
	 * 跳转商城首页
	 * */
	public String home() throws Exception{
		renqiBooks=bookManager.books("select * from (select * from N_book where b_isSale='有书出售' order by b_scanNum desc) book where rownum<=11");
		suijiBooks=bookManager.books(" select * from (select * from N_book where b_recommend='推荐' and  b_isSale='有书出售') book where rownum<=6");
		xuanhuanBooks=bookManager.books(" select * from (select * from N_book where b_type='玄幻' and  b_isSale='有书出售') book where rownum<=6");
		xianxiaBooks=bookManager.books(" select * from (select * from N_book where b_type='仙侠' and  b_isSale='有书出售') book where rownum<=6");
		return "home";
	}
	/*
	 * 查看书的详细信息
	 * */
	public String infor() throws Exception{
		int id=(Integer.parseInt(request.getParameter("id")));
		bookInfor=	bookManager.bookInfor(id);
		return "infor";
	}
	/*
	 * 将商品放入购物车
	 * */
	public String car() throws Exception{
		if (request.getSession().getAttribute("name")==null) {
			return "login";
		}else {
			String bookName=request.getSession().getAttribute("name").toString();
			N_user user= userManager.userInfor(bookName);
		    int bookID=(Integer.parseInt(request.getParameter("bookID")));
		    N_book book= bookManager.bookInfor(bookID);
		    N_shop shop =new N_shop();
		    shop.setN_book(book);
		    shop.setN_user(user);
		    shop.setS_num(Integer.parseInt(request.getParameter("num").toString()));
		    shop.setS_state("未付款");
		    userManager.save(shop);
		    tag="添加到购物车";
		    return "car";
		    
		}
	}
	/*
	 * 查看购物车中的信息
	 * */
	public String  searchCar() throws Exception{
		
		if(request.getSession().getAttribute("name")==null){
			return "login";
		}else {
			String Name=request.getSession().getAttribute("name").toString();
			int id=userManager.userInfor(Name).getU_id();
			shopcars=userManager.searchCar(id);
			goodsNum=shopcars.size();
			for (int i = 0; i < goodsNum;i ++) {
				totalPrice+=shopcars.get(i).getS_num()*shopcars.get(i).getN_book().getB_salePrice();
			}
			return "searchCar";
		}
		
	}
	/*
	 * 付款
	 * 
	 * */
	public String pay() throws Exception{
		int payNum=(Integer.parseInt( request.getParameter("payNum")));
		N_user user1=userManager.userInfor(request.getSession().getAttribute("name").toString());
		int balance=user1.getU_balance();
		if (balance-payNum<0) {
			tag="余额不足";
		}else {
			
			user1.setU_balance(balance-payNum);
			user1.setU_expense(user1.getU_expense()+payNum);
			userManager.update(user1);
			String Name=request.getSession().getAttribute("name").toString();
			int id=userManager.userInfor(Name).getU_id();
			shopcars=userManager.searchCar(id);
			for (int i = 0; i < shopcars.size(); i++) {
				shopcars.get(i).setS_state("已付款");
				userManager.update(shopcars.get(i));
			}
			tag="付款成功";
		}
		return "pay";
		
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
	public String  delete()throws Exception{
		N_shop shop=bookManager.shopInfor(Integer.parseInt(request.getParameter("sid")));
		userManager.delete(shop);
		return "del";
		
		
	}
}


