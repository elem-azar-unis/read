package java1.nine.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;

import java1.nine.dao.BookManager;
import java1.nine.pojo.N_book;

public class NextBookAction extends ActionSupport implements ServletRequestAware {
	private BookManager bookManager;
	private static int  pageNum1 = 0;//当前页的首条记录的索引
	private final  int rowNum = 10;//一页显示的总条数
	private int number;//总页数
	private int pNum;//获取用户选择的页数
	private List<Integer> pageList=new ArrayList<Integer>();
	private HttpServletRequest request;
	private List<N_book> searchBook=new ArrayList<N_book>();
	public List<N_book> getSearchBook() {
		return searchBook;
	}
	public void setSearchBook(List<N_book> searchBook) {
		this.searchBook = searchBook;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	
	
	public static int getPageNum1() {
		return pageNum1;
	}
	public static void setPageNum1(int pageNum1) {
		NextBookAction.pageNum1 = pageNum1;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
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
	public int getRowNum() {
		return rowNum;
	}
	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}
	@Override
	/*
	 * 上一页下一页的实现（小说）
	 * */
	public String execute() throws Exception {
		int  totalNum=bookManager.bookNum();
		number=totalNum/10+1;
		for (int i = 0; i < number; i++) {
			pageList.add(i+1);
		}
		String page = request.getParameter("page");
		
		if (page.equals("pre")) {
			pageNum1 -= rowNum;
			if (pageNum1 >=0) {
				searchBook=bookManager.books2("from N_book", pageNum1, rowNum);
			} else {
				searchBook = bookManager.books2("from N_book", 0, rowNum);
				pageNum1 += rowNum;
			}
		} else if (page.equals("next")) {
			pageNum1 += rowNum;
			if (pageNum1<totalNum) {
				searchBook = bookManager.books2("from N_book", pageNum1, rowNum);
			}
			else {
				pageNum1-=rowNum;
				searchBook = bookManager.books2("from N_book", pageNum1, rowNum);
			}
		}else  
		  {
			int n=pNum;//得到用户选择的页数（即第几页）
			searchBook = bookManager.books2("from N_book", 10*(n-1), rowNum);//显示对应页数的信息
			pageNum1=10*(n-1);//修改pageNum值，该为当前页数的正确值，使其在下一次点击上一页下一页的时候正确显示
		}
		
		return SUCCESS;
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request=arg0;
		
	}
}
