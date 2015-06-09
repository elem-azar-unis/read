package java1.nine.pojo;

public class N_content {
	private int c_id;
	//private int  b_id;该字段是N_book的外键，用下面的对象代替
	private N_book n_book;
	
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int cId) {
		c_id = cId;
	}
	public N_book getN_book() {
		return n_book;
	}
	public void setN_book(N_book nBook) {
		n_book = nBook;
	}
	public String getC_section() {
		return c_section;
	}
	public void setC_section(String cSection) {
		c_section = cSection;
	}
	
	
	public String getC_sectionContent() {
		return c_sectionContent;
	}
	public void setC_sectionContent(String cSectionContent) {
		c_sectionContent = cSectionContent;
	}


	private String c_section;
	private String c_sectionContent;
	
}
