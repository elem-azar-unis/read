package java1.nine.action;

import java.util.*;
import java1.nine.dao.BookManager;
import java1.nine.pojo.N_book;
import com.opensymphony.xwork2.ActionSupport;
public class HomePageAction extends ActionSupport {
	private BookManager bookManager;
	
	private  List<N_book> dianjiBooks=new ArrayList<N_book>();
	private List<N_book> tuijianBooks=new ArrayList<N_book>();
	private List<N_book> suijiBooks =new ArrayList<N_book>();
	private List<N_book> flowerBooks =new ArrayList<N_book>();
	private List<N_book> eggBooks =new ArrayList<N_book>();
	private List<N_book> xuanhuanBooks=new ArrayList<N_book>();
	private List<N_book> dushiBooks =new ArrayList<N_book>();
	private List<N_book> lishiBooks=new ArrayList<N_book>();
	private List<N_book> youxiBooks=new ArrayList<N_book>();

	public List<N_book> getEggBooks() {
		return eggBooks;
	}
	
	public List<N_book> getXuanhuanBooks() {
		return xuanhuanBooks;
	}

	public List<N_book> getDushiBooks() {
		return dushiBooks;
	}

	public List<N_book> getLishiBooks() {
		return lishiBooks;
	}

	public List<N_book> getFlowerBooks() {
		return flowerBooks;
	}
	
	public List<N_book> getSuijiBooks() {
		return suijiBooks;
	}
	
	public List<N_book> getDianjiBooks() {
		return dianjiBooks;
	}
	
	public List<N_book> getTuijianBooks() {
		return tuijianBooks;
	}
	
	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}
	public String DianJi() throws Exception{
		dianjiBooks=bookManager.books("select* from ( select * from N_book order by b_scanNum desc ) book where rownum<=10");
		tuijianBooks=bookManager.books("select * from (select * from N_book where b_recommend='推荐') book where rownum<=10");
		suijiBooks =bookManager.books(" select * from (select * from N_book where b_recommend='推荐') book where rownum<=6");
		flowerBooks =bookManager.books(" select * from (select * from N_book order by b_flowerNum desc) where rownum<=15");
		eggBooks=bookManager.books(" select * from (select * from N_book order by b_eggNum desc) where rownum<=15");
		xuanhuanBooks=bookManager.books("select * from (select * from N_book where b_type='玄幻' or b_type='科幻' order by b_flowerNum) where rownum<=6");
		dushiBooks=bookManager.books("select * from (select * from N_book where b_type='都市' or b_type='历史' order by b_flowerNum) where rownum<=6");
		lishiBooks=bookManager.books("select * from (select * from N_book where b_type='仙侠' or b_type='武侠' order by b_flowerNum) where rownum<=6");
		youxiBooks=bookManager.books("select * from (select * from N_book where b_type='游戏' or b_type='竞技' order by b_flowerNum) where rownum<=6");
		
		
		return SUCCESS;
	}

	public List<N_book> getYouxiBooks() {
		return youxiBooks;
	}

	

}
