package java1.nine.action.comment;
/*
 * *论坛首页的action 
 */

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.hql.classic.WhereParser;
import org.lxh.smart.Request;

import java1.nine.dao.BookManager;
import java1.nine.dao.CommentManager;
import java1.nine.pojo.N_book;
import java1.nine.pojo.N_user;

import com.opensymphony.xwork2.ActionSupport;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class MainCommentAction extends ActionSupport implements ServletRequestAware{
private BookManager bookManager;
private List<N_book>nBooks1=new ArrayList<N_book>();
private List<N_book>nBooks2=new ArrayList<N_book>();
private List<N_book>nBooks3=new ArrayList<N_book>();
private List<N_book>nBooks4=new ArrayList<N_book>();
private List<N_book>nBooks5=new ArrayList<N_book>();
private List<N_book>nBooks6=new ArrayList<N_book>();
private List<N_book>nBooks7=new ArrayList<N_book>();
private List<N_book>nBooks8=new ArrayList<N_book>();
private List<N_book>nBooks9=new ArrayList<N_book>();
private List<N_book>nBooks10=new ArrayList<N_book>();

private  List<N_book> dianjiBooks=new ArrayList<N_book>();

private HttpServletRequest request;

//private String name;
//private String password;


public HttpServletRequest getRequest() {
	return request;
}
public void setRequest(HttpServletRequest request) {
	this.request = request;
}
//public String getName() {
//	return name;
//}
//public void setName(String name) {
//	this.name = name;
//}
//public String getPassword() {
//	return password;
//}
//public void setPassword(String password) {
//	this.password = password;
//}
public BookManager getBookManager() {
	return bookManager;
}
public void setBookManager(BookManager bookManager) {
	this.bookManager = bookManager;
}
public List<N_book> getnBooks1() {
	return nBooks1;
}
public void setnBooks1(List<N_book> nBooks1) {
	this.nBooks1 = nBooks1;
};


public List<N_book> getnBooks2() {
	return nBooks2;
}
public void setnBooks2(List<N_book> nBooks2) {
	this.nBooks2 = nBooks2;
}
public List<N_book> getnBooks3() {
	return nBooks3;
}
public void setnBooks3(List<N_book> nBooks3) {
	this.nBooks3 = nBooks3;
}
public List<N_book> getnBooks4() {
	return nBooks4;
}
public void setnBooks4(List<N_book> nBooks4) {
	this.nBooks4 = nBooks4;
}
public List<N_book> getnBooks5() {
	return nBooks5;
}
public void setnBooks5(List<N_book> nBooks5) {
	this.nBooks5 = nBooks5;
}


public List<N_book> getDianjiBooks() {
	return dianjiBooks;
}
public void setDianjiBooks(List<N_book> dianjiBooks) {
	this.dianjiBooks = dianjiBooks;
}
@Override
	public String execute() throws Exception {
	nBooks1=bookManager.books("select * from ((select * from N_book  b where b.b_type='同人' ) nbook) where  rownum<7  ");
	nBooks2=bookManager.books("select * from ((select * from N_book  b where b.b_type='漫画') nbook) where  rownum<7  ");
	nBooks3=bookManager.books("select * from ((select * from N_book  b where b.b_type='玄幻') nbook) where  rownum<7  ");
	nBooks4=bookManager.books("select * from ((select * from N_book  b where b.b_type='科幻') nbook) where  rownum<7  ");
	nBooks5=bookManager.books("select * from ((select * from N_book  b where b.b_type='游戏') nbook) where  rownum<7  ");
	nBooks6=bookManager.books("select * from ((select * from N_book  b where b.b_type='竞技' ) nbook) where  rownum<7  ");
	nBooks7=bookManager.books("select * from ((select * from N_book  b where b.b_type='历史') nbook) where  rownum<7  ");
	nBooks8=bookManager.books("select * from ((select * from N_book  b where b.b_type='都市') nbook) where  rownum<7  ");
	nBooks9=bookManager.books("select * from ((select * from N_book  b where b.b_type='仙侠') nbook) where  rownum<7  ");
	nBooks10=bookManager.books("select * from ((select * from N_book  b where b.b_type='武侠') nbook) where  rownum<7  ");


	dianjiBooks=bookManager.books("select* from ( select * from N_book order by b_scanNum desc ) book where rownum<=15");

//	request.getSession().setAttribute("name", name);
//	request.getSession().setAttribute("password",password );
	String s=(String) request.getSession().getAttribute("name");
	request.getSession().setAttribute("name", s);
	System.out.println("++++"+request.getSession().getAttribute("name"));
	
//	nUsers1=bookManager.userById("select u.u_name from N_user as u where u.u_id='"+nBooks1.get(0).getB_id()+"and u.u_author='"+"作者'");
	return SUCCESS;
	}
@Override
public void setServletRequest(HttpServletRequest arg0) {
	request=arg0;
	
}
public List<N_book> getnBooks7()
{
	return nBooks7;
}
public void setnBooks7(List<N_book> nBooks7)
{
	this.nBooks7 = nBooks7;
}
public List<N_book> getnBooks6()
{
	return nBooks6;
}
public void setnBooks6(List<N_book> nBooks6)
{
	this.nBooks6 = nBooks6;
}
public List<N_book> getnBooks8()
{
	return nBooks8;
}
public void setnBooks8(List<N_book> nBooks8)
{
	this.nBooks8 = nBooks8;
}
public List<N_book> getnBooks9()
{
	return nBooks9;
}
public void setnBooks9(List<N_book> nBooks9)
{
	this.nBooks9 = nBooks9;
}
public List<N_book> getnBooks10()
{
	return nBooks10;
}
public void setnBooks10(List<N_book> nBooks10)
{
	this.nBooks10 = nBooks10;
}
}
