package java1.nine.action;
import java1.nine.dao.BookManager;
import java1.nine.dao.UserManager;
import java1.nine.pojo.N_book;
import java1.nine.pojo.N_content;


import com.opensymphony.xwork2.ActionSupport;

public class RenewAction extends ActionSupport   {
	private UserManager userManager;
	private BookManager bookManager;

	public void setBookManager(BookManager bookManager) {
		this.bookManager = bookManager;
	}
	private int id;//书的ID
	private String content;//书的第几章
	private String sectionName;//书的章节的名称
	private String sectionContent;//书的章节的内容

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSectionName() {
		return sectionName;
	}

	public void setSectionName(String sectionName) {
		this.sectionName = sectionName;
	}

	public String getSectionContent() {
		return sectionContent;
	}

	public void setSectionContent(String sectionContent) {
		this.sectionContent = sectionContent;
	}

	public void setUserManager(UserManager userManager) {
		this.userManager = userManager;
	}
	
	@Override
	public String execute() throws Exception {
		N_book book=bookManager.bookInfor(id);
		N_content cont=new N_content();

		cont.setN_book(book);
		cont.setC_section(content+" "+sectionName);
		String text= convertToHtml(sectionContent);
		cont.setC_sectionContent(text);
		userManager.save(cont);
		return SUCCESS;
	}
	private String convertToHtml(String text){//将输入的数据转换为html格式，为了让输出时有格式
//		text=text.replace(">", "&gt;");
//		text=text.replace("<", "&lt;");
//		text=text.replace(" ", "&nbsp;");
//		text=text.replace(" ", "&nbsp;");
//		text=text.replace("/'", "&quot;");
//	    text=text.replace("/'", "&#39;");
//		text=text.replace("/n", "<br/> ");
//		text=text.replace(" ", "&nbsp");
		text=text.replace("\n", "<br>  ");
		return "  "+text;
	}
	
}
