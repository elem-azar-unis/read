package java1.nine.action;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;
import java1.nine.dao.*;
import java1.nine.pojo.*;

public class BookAction extends ActionSupport implements ServletRequestAware {
	private BookManager bookManager;
	private N_book infor;
	private List<N_book> endBooks = new ArrayList<N_book>();
	private List<N_book> searchBook = new ArrayList<N_book>();
	private List<N_content> sectionNum;
	private N_content content;
	private UserManager userManager;
	private int num;//  用于标记按照用户的输入是否搜索到相应信息，大于1则为搜到，否则搜不到
	private int number;// 用于记录书的总数
	private List<Integer> pageList = new ArrayList<Integer>();
	private String typeOfBook;
	
	/**
	 * @return the typeOfBook
	 */
	public String getTypeOfBook() {
		return typeOfBook;
	}

	/**
	 * @param typeOfBook the typeOfBook to set
	 */
	public void setTypeOfBook(String typeOfBook) {
		this.typeOfBook = typeOfBook;
	}

	public List<Integer> getPageList() {
		return pageList;
	}

	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	private static int pageNum = 0;// 第n页的首条数据的索引
	private final int rowNum = 5;// 

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}

	private static int sectionNumber = 0;

	public N_content getContent() {
		return content;
	}

	private String sectionContent;

	public String getSectionContent() {
		return sectionContent;
	}

	private HttpServletRequest request;

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public List<N_content> getSectionNum() {
		return sectionNum;
	}

	public List<N_book> getSearchBook() {
		return searchBook;
	}

	public List<N_book> getEndBooks() {
		return endBooks;
	}

	public N_book getInfor() {
		return infor;
	}

	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}

	public void setInfor(N_book infor) {
		this.infor = infor;
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		request = arg0;

	}

	public String infor() throws Exception {
		infor = bookManager.bookInfor((Integer.parseInt(request
				.getParameter("id"))));
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_over='已完结') book) where  rownum<=15 ");
		return "infor";
	}

	/*
	 *   
	 * 
	 * 完成小说检索的功能
	 */
	public String search() throws Exception {
		String bookName = request.getParameter("bookName");

		String bookTag = request.getParameter("bookTag");
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_over='已完结') book) where  rownum<=15 ");
		if (bookTag.equals("书名")) {
			// 根据小说的名称查询相应的小说信息
			searchBook = bookManager.books2(
					" from N_book  as book where book.b_name='" + bookName
							+ "'", 0, 1);
		} else if (bookTag.equals("作者名")) {
			// 根据小说的作者名查询对应的小说的信息
			searchBook = bookManager.books2(
					"from N_book as book where book.n_user.u_name='" + bookName
							+ "'", 0, 999);
		}
		num = searchBook.size();
		System.out.println(num);
		return "search";
	}

	public String search1() throws Exception {
		String bookName = request.getParameter("bookName");

		String bookTag;
		int tag = Integer.parseInt(request.getParameter("bookTag"));
		if (tag == 1) {
			bookTag = "书名";
		} else {
			bookTag = "作者名";
		}
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_over='已完结') book) where  rownum<=15 ");
		if (bookTag.equals("书名")) {
			// 根据小说的名称查询相应的小说信息
			searchBook = bookManager.books2(
					" from N_book  as book where book.b_name='" + bookName
							+ "'", 0, 1);
		} else if (bookTag.equals("作者名")) {
			// 根据小说的作者名查询对应的小说的信息
			searchBook = bookManager.books2(
					"from N_book as book where book.n_user.u_name='" + bookName
							+ "'", 0, 999);
		}
		num = searchBook.size();
		System.out.println(num);
		return "search";
	}

	public String sea() throws Exception {// 点击menu上的搜书按钮是触发这个空action主要是为了不让地址栏变化
		return "sea";
	}

	/*
	 *   
	 * 
	 * 点击menu上的“微小说”时的显示页面对应的action
	 */
	public String tiny() throws Exception {
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_long='短篇') book) where  rownum<=15 ");
		searchBook = bookManager.books2("from N_book where b_long='短篇'", 0, 5);
		return "tiny";
	}

	/*
	 *   
	 * 
	 * 完成分页显示微型小说时，上一页，下一页的功能
	 */
	public String tinyNext() throws Exception {
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_long='短篇') book) where  rownum<=15 ");
		// int pageNum = 0;// 第n页的首条数据的索引
		// int rowNum = 5;// 一页显示的条数
		String page = request.getParameter("page");// 得到用户点击的时“上一页”还是“下一页”

		if (page.equals("pre"))// 用户点击的是”上一页“
		{
			pageNum -= rowNum;// 减去一页显示的条数得到上一页的首条数据的索引
			if (pageNum >= 0) {// 当前页不是首页的情况，跳转至下一页
				searchBook = bookManager.books2(
						"from N_book where  b_long='短篇'", pageNum, rowNum);

			} else {// 当前页即是首页，将仍然停留在当前页
				pageNum += rowNum;
				searchBook = bookManager.books2(
						"from N_book where  b_long='短篇'", 0, rowNum);
			}
		} else if (page.equals("next")) {// 点击的是"下一页"
			pageNum += rowNum;
			int num = bookManager.books(
					"select * from N_book book where book.b_long='短篇'").size();
			if (pageNum < num) {
				searchBook = bookManager.books2(
						"from N_book where  b_long='短篇'", pageNum, rowNum);
			} else {
				pageNum -= rowNum;
				searchBook = bookManager.books2(
						"from N_book where  b_long='短篇'", pageNum, rowNum);
			}
		}
		return "tinyNext";
	}

	public String VIP() throws Exception {

		if (request.getSession().getAttribute("name") == null) 
			return "input";
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_freeScan='收费') book) where  rownum<=15 ");
		searchBook = bookManager.books2("from N_book where b_freeScan='收费'", 0,
				5);

		return "VIP";
	}

	/*
	 *   
	 * 
	 * 完成分页显示收费小说时，上一页，下一页的功能
	 */
	public String next() throws Exception {
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_freeScan='收费') book) where  rownum<=15 ");
		// int pageNum = 0;
		// int rowNum = 5;
		String page = request.getParameter("page");
		int num = bookManager.books(
				"select * from N_book book where book.b_freeScan='收费'").size();
		if (page.equals("pre")) {
			pageNum -= rowNum;
			if (pageNum >= 0) {
				searchBook = bookManager.books2(
						"from N_book where b_freeScan='收费'", pageNum, rowNum);
			} else {
				searchBook = bookManager.books2(
						"from N_book where b_freeScan='收费'", 0, rowNum);
				pageNum += 5;
			}
		} else if (page.equals("next")) {
			pageNum += 5;
			System.out.println(num);
			if (pageNum <= num) {
				searchBook = bookManager.books2(
						"from N_book where  b_freeScan='收费'", pageNum, rowNum);
			} else {
				pageNum -= 5;
				searchBook = bookManager.books2(
						"from N_book where b_freeScan='收费'", pageNum, rowNum);

			}

		}
		return "next";
	}

	public String section() throws Exception {
		sectionNum = bookManager.sectionNum((Integer.parseInt(request
				.getParameter("id"))));
		infor = bookManager.bookInfor((Integer.parseInt(request
				.getParameter("id"))));
		// 查询已完结作品，推荐给读者
		endBooks = bookManager
				.books("select * from ((select * from N_book  sample(90) where b_over='已完结') book) where  rownum<=15 ");
		return "section";
	}

	/*
	 * 砸鸡蛋
	 */
	public String egg() throws Exception {
		if (request.getSession().getAttribute("name") == null) {
			return "input";
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			N_book book = bookManager.bookInfor(id);
			book.setB_eggNum(book.getB_eggNum() + 1);
			userManager.update(book);
			return "egg";
		}
	}

	/*
	 * 送鲜花
	 */
	public String flower() throws Exception {
		if (request.getSession().getAttribute("name") == null) {
			return "input";
		} else {
			int id = Integer.parseInt(request.getParameter("id"));
			N_book book = bookManager.bookInfor(id);
			book.setB_flowerNum(book.getB_flowerNum() + 1);
			userManager.update(book);
			return "flower";
		}
	}

	/*
	 *    完成小说的在线阅读
	 */
	public String sectionContent() throws Exception {
		request.getSession()
				.setAttribute("novelID", request.getParameter("id"));// 保存用户正在看得小说的ID
		String free = bookManager.bookInfor(
				(Integer.parseInt(request.getParameter("id")))).getB_freeScan();
		String sectionName = new String(request.getParameter("sectionName"));
		if (free.equals("免费")) {// 免费小说
			N_book book = bookManager.bookInfor(Integer.parseInt(request
					.getParameter("id").toString()));
			int scanNum = book.getB_scanNum() + 1;
			book.setB_scanNum(scanNum);
			userManager.update(book);// 以上四句主要功能是当用户浏览小说时，小说的浏览量加1

			// 根据小说章节的名称和小说的ID来得到对应章节的详细信息
			sectionContent = bookManager.sectionContent((Integer
					.parseInt(request.getParameter("id"))), sectionName);
			return "sectionContent";
		} else if (free.equals("收费")) {// 收费小说
			if (request.getSession().getAttribute("name") == null) {
				return "login";// 用户未登录的情况下，跳转至登陆页面
			} else if (request.getSession().getAttribute("name") != null
					&& userManager.userInfor(
							request.getSession().getAttribute("name")
									.toString()).getU_balance() <= 0) {
				return "charge";// 用户非ＶＩＰ时跳转至充值页面
			} else {

				N_book book = bookManager.bookInfor(Integer.parseInt(request
						.getParameter("id").toString()));
				int scanNum = book.getB_scanNum() + 1;
				book.setB_scanNum(scanNum);
				userManager.update(book);// 以上四句主要功能是当用户浏览小说时，小说的浏览量加1

				N_user user = userManager.userInfor(request.getSession()
						.getAttribute("name").toString());// 得到用户信息
				int balance = user.getU_balance() - 1;// 余额减1
				int expense = user.getU_expense() + 1;// 消费加1
				user.setU_expense(expense);
				user.setU_balance(balance);
				userManager.update(user);// 上面六句的主要功能是：VIP用户没看一章节小说，余额就减1

				sectionContent = bookManager.sectionContent((Integer
						.parseInt(request.getParameter("id"))), sectionName);// 查询得到小说对应章节的信息
				return "sectionContent";
			}
		} else
			return "sectionContent";

	}

	/*
	 *
	 * 
	 * 完成用户看小说时，上一章，下一章的功能
	 */
	public String nextOrPre() throws Exception {

		int id = Integer.parseInt(request.getSession().getAttribute("novelID")
				.toString());
		int totalNum = bookManager.totalNum(id);// 查询小说的总章节数
		if (request.getParameter("page").equals("pre")) {
			sectionNumber -= 1;
			if (sectionNumber >= 0) {
				// 当前章数不是第一章，页面跳转至上一章
				sectionContent = bookManager.nextContent(id, sectionNumber);
			} else {
				// 当前章数是第一章的时候，点击上一章，页面显示的仍然是第一章
				sectionContent = bookManager.nextContent(id, 0);
				sectionNumber += 1;
			}
		} else if (request.getParameter("page").equals("next")) {
			sectionNumber += 1;
			if (sectionNumber < totalNum) {
				// 当前页面不是最后一章的时候，页面跳转至下一章?
				sectionContent = bookManager.nextContent(id, sectionNumber);
			} else {
				// 当前页面时最后一章的时候，点击下一章，仍将会跳转至最后一章
				sectionNumber -= 1;
				sectionContent = bookManager.nextContent(id, sectionNumber);
			}
		}

		return "nextOrPre";
	}

	public String add() throws Exception {
		String bookType = request.getParameter("bookType");
		String bookName = request.getParameter("bookName");
		String bookIntro =request.getParameter("bookIntro");
		String userName = request.getSession().getAttribute("name").toString();
		if(bookManager.bookID(bookName)==null || bookManager.bookInfor(bookManager.bookID(bookName))==null)
		{
			// 保存书的信息?
			N_book book = new N_book();
			book.setB_name(bookName);
			book.setB_type(bookType);
			book.setB_intro(bookIntro);
			book.setB_freeScan("免费");
			book.setB_scanPrice(0);
			book.setB_canDownload("不可下载");
			book.setB_downloadprice(0);
			book.setB_salePrice(0);
			book.setB_isSale("无书出售");
			book.setB_over("未完结");
			book.setB_recommend("不推荐");
			book.setB_scanNum(0);
			book.setB_eggNum(0);
			book.setB_flowerNum(0);
			book.setB_long("长篇");
			book.setN_user(userManager.userInfor(userName));
			userManager.save(book);
		}

		// 保存内容的信息
		N_content content = new N_content();
		content.setN_book(bookManager.bookInfor(bookManager.bookID(bookName)));
		content.setC_section(request.getParameter("bookSection") +" "+request.getParameter("sectionName"));
		content.setC_sectionContent("  "+request.getParameter("sectionContent").replace("\n","<br>  "));
		userManager.save(content);
		return "save";

	}

	/*
	 * 管理员点击小说管理时的页面
	 */
	public String ManB() throws Exception {
		int totalNum = bookManager.bookNum();
		number = totalNum / 10 + 1;
		for (int i = 0; i < number; i++) {
			pageList.add(i + 1);
		}
		searchBook = bookManager.books2("from N_book", 0, 10);
		return "manB";
	}

	/*
	 * 更新小说信息
	 */
	private N_book novel;
	
	public N_book getNovel() {
		return novel;
	}

	public void setNovel(N_book novel) {
		this.novel = novel;
	}
	
	public String update() throws Exception {
		int novelID = Integer.parseInt(request.getParameter("novelID"));
		novel = bookManager.bookInfor(novelID);
		return "update";
	}
	/*
	 * 删除小说
	 * */
	
	public String delete() throws Exception{
		int novelID=Integer.parseInt(request.getParameter("novelID"));
		N_book book=bookManager.bookInfor(novelID);
		userManager.delete(book);
		return "delete";
	}
	
	
	public String  getBookListByType(){
		Map map=new HashMap();
		String bookType=request.getParameter("bookType");
		if(bookType!=null&&!"".equals(bookType)){
			map.put("bookType", bookType);
		}
		typeOfBook=bookType;
		searchBook=bookManager.getList(map);
		return SUCCESS;
	}
	
}
