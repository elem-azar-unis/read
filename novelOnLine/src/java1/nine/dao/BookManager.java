package java1.nine.dao;

import java.util.List;
import java.util.Map;

import java1.nine.pojo.N_book;
import java1.nine.pojo.N_content;
import java1.nine.pojo.N_shop;

public interface BookManager {
	public N_book bookInfor(int bookID);//根据小说的ID查询小说的详细信息
	public List<N_content> sectionNum(int bookID);//根据小说ID查询小说的当前章节的信息
	public String sectionContent(int bookID,String sectionName);//根据小说的ID和章节的名称查询小说对应章节的对应内容
	public List<N_book> books (String sql);//根据一定的sql语句来查询书籍
	public List<N_book> books2(String hql,int pageNum, int rowNum);//根据一定的sql语句来分页查询小说
	public String nextContent(int bookID,int sectionNum);//根据小说ID和当前章节数查询小说章节内容（用于上一章和下一章的查询）
	public int totalNum(int bookID);//根据小说的ID查询小说的章节总数
	public List<N_book> bookByType(String type);//按照小说类型来查询小说
	public Integer bookID(String bookName);//根据小说的名字查询小说的ID
	public int sacnNum(String bookType);//得到某一类型小说得总阅览量
	public N_shop shopInfor(int sid);//根据购物车的ID查询对应的信息
	public int bookNum();//查询小说的总数量
	public List<N_book> getList(Map queryMap);
	public List<N_book> getList(Map map,int pageNum, int rowNum);
	
}
