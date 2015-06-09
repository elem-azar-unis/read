package java1.nine.dao;

import java.util.List;
import java.util.Map;

import java1.nine.pojo.N_discuss;
import java1.nine.pojo.N_reply;

public interface CommentManager {
	public void insertCmt(Object object);
	public String isAllow(String name,String pwd);
	public int  searchUserbyName(String string);
	public List<N_discuss> searchCmtbybid(int a);
	public List<N_reply> searchRepliesby(int a);
	public List<N_discuss> getlist(Map map,int pageNum, int rowNum);
}
