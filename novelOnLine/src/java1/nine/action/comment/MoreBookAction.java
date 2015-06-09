package java1.nine.action.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java1.nine.dao.BookManager;
import java1.nine.pojo.N_book;

import com.opensymphony.xwork2.ActionSupport;

public class MoreBookAction extends ActionSupport {
	private  BookManager bookManager;
	private List<N_book>  nBook;
	private  List<N_book> dianjiBooks=new ArrayList<N_book>();
    private String type;
    private HttpServletRequest request;
    private int totlesize;// 总页数
    private int totle;// 总条数
    private boolean first;// 第一页
    private boolean last;// 最后一页
    private int everyPageSize=15;// 每页多少条
    private int pageNo;//当前页数
    private int page;//将要跳转的页数
    private int  flag;
    
	@Override
	public String execute() throws Exception {
		Map map=new HashMap();
		map.put("type", type);
		pageNo=1;
		try {
			getList(map, pageNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag==1) {
			return "type";
		}
		return SUCCESS;
	}
	public String nextMoreBook(){
		Map map=new HashMap();
		map.put("type", type);
		try {
			getList(map, pageNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag==1) {
			return "type";
		}
		return SUCCESS;
	}

	
	public String  pageupMoreBook(){
		Map map=new HashMap();
		map.put("type", type);
		pageNo=page;
		try {
			getList(map, page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (flag==1) {
			return "type";
		}
		return SUCCESS;
	}
	private void getList(Map map, Integer pageNo) throws Exception {
		nBook=bookManager.getList(map, everyPageSize*(pageNo-1), everyPageSize);
		totle=bookManager.books("select * from N_book  where b_type='"+type+"'").size();
		totlesize=totle%everyPageSize==0?totle/everyPageSize:totle/everyPageSize+1;
		if (pageNo<=1) {
			first=true;
		}else
			first=false;
		if (pageNo<totlesize) {
			last=false;
		}else {
			last=true;
		}
		dianjiBooks=bookManager.books("select* from ( select * from N_book order by b_scanNum desc ) book where rownum<=15");
	}
	/**
	 * @return the totlesize
	 */
	public int getTotlesize() {
		return totlesize;
	}

	/**
	 * @param totlesize the totlesize to set
	 */
	public void setTotlesize(int totlesize) {
		this.totlesize = totlesize;
	}

	/**
	 * @return the totle
	 */
	public int getTotle() {
		return totle;
	}

	/**
	 * @param totle the totle to set
	 */
	public void setTotle(int totle) {
		this.totle = totle;
	}

	/**
	 * @return the first
	 */
	public boolean isFirst() {
		return first;
	}

	/**
	 * @param first the first to set
	 */
	public void setFirst(boolean first) {
		this.first = first;
	}

	/**
	 * @return the last
	 */
	public boolean isLast() {
		return last;
	}

	/**
	 * @param last the last to set
	 */
	public void setLast(boolean last) {
		this.last = last;
	}

	/**
	 * @return the everyPageSize
	 */
	public int getEveryPageSize() {
		return everyPageSize;
	}

	/**
	 * @param everyPageSize the everyPageSize to set
	 */
	public void setEveryPageSize(int everyPageSize) {
		this.everyPageSize = everyPageSize;
	}

	/**
	 * @return the pageNo
	 */
	public int getPageNo() {
		return pageNo;
	}

	/**
	 * @param pageNo the pageNo to set
	 */
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}

	public List<N_book> getDianjiBooks() {
		return dianjiBooks;
	}

	public void setDianjiBooks(List<N_book> dianjiBooks) {
		this.dianjiBooks = dianjiBooks;
	}

	public BookManager getBookManager() {
		return bookManager;
	}

	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}

	public List<N_book> getnBook() {
		return nBook;
	}
	
	public void setnBook(List<N_book> nBook) {
		this.nBook = nBook;
	}

	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}

}
