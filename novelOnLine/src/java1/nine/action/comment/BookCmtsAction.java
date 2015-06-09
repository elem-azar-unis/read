package java1.nine.action.comment;
/*
 * 用于显示所有的评论
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import java1.nine.dao.CommentManager;
import java1.nine.pojo.N_discuss;

import com.opensymphony.xwork2.ActionSupport;

public class BookCmtsAction extends ActionSupport implements ServletRequestAware {
private CommentManager commentManager;
private List<N_discuss> nDiscusses;
private int bid;//书ID
private HttpServletRequest request;
private int totlesize;// 总页数
private int totle;// 总条数
private boolean first;// 第一页
private boolean last;// 最后一页
private int everyPageSize=10;// 每页多少条
private int pageNo;//当前页数
private int page;//将要跳转的页数
public int getBid() {
	return bid;
}

public void setBid(int bid) {
	this.bid = bid;
}

public CommentManager getCommentManager() {
	return commentManager;
}

public void setCommentManager(CommentManager commentManager) {
	this.commentManager = commentManager;
}


@Override
	public String execute() throws Exception {
	Map map=new HashMap();
	map.put("bid", bid);
	pageNo=1;
	try {
		getList(map, pageNo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
	}
public String nextComment(){
	Map map=new HashMap();
	map.put("bid", bid);
	try {
		getList(map, pageNo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}
public String pageupComments(){
	Map map=new HashMap();
	map.put("bid", bid);
	try {
		getList(map, pageNo);
	} catch (Exception e) {
		e.printStackTrace();
	}
	return SUCCESS;
}
private void getList(Map map, Integer pageNo) throws Exception {
	nDiscusses=commentManager.getlist(map, everyPageSize*(pageNo-1), everyPageSize);
	request.setAttribute("nDiscusses", nDiscusses);
	totle=commentManager.searchCmtbybid(bid).size();
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
}
@Override
public void setServletRequest(HttpServletRequest arg0) {
	request=arg0;
	
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

}
