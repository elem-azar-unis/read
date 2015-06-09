package java1.nine.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import java1.nine.dao.BookManager;
import java1.nine.pojo.*;

public class BookManagerImpl extends HibernateDaoSupport implements BookManager {

	@Override
	// 根据小说的ID查询小说的详细信息
	public N_book bookInfor(int bookID) {
		Session session = this.getSession();
		N_book infor = (N_book) session.createQuery(
				" from N_book as b where b.b_id=" + bookID).list().get(0);
		session.close();
		return infor;
	}

	@Override
	// 根据小说的ID和章节的名称查询小说对应章节的对应内容
	public String sectionContent(int bookID, String sectionName) {
		Session session = this.getSession();
		String sectionContent = session.createQuery(
				"select c.c_sectionContent  from N_content as c where c.c_section='"
						+ sectionName + "'and c.n_book.b_id=" + bookID).list()
				.get(0).toString();
		session.close();
		return sectionContent;
	}

	@Override
	// 根据小说ID查询小说的当前章节信息
	public List<N_content> sectionNum(int bookID) {
		Session session = this.getSession();
		List<N_content> sectionNum = session.createQuery(
				" from N_content as c where c.n_book.b_id=" + bookID+" order by c.c_id").list();
		session.close();
		return sectionNum;
	}

	@Override
	// 根据一定的sql语句来查询书籍
	public List<N_book> books(String sql) {
		Session session = this.getSession();
		SQLQuery query = session.createSQLQuery(sql);
		query.addEntity("book", N_book.class);
		List<N_book> books = query.list();
		session.close();
		return books;
	}

	@Override
	// 根据一定的hql语句来分页查询小说
	public List<N_book> books2(String hql, int pageNum, int rowNum) {
		Session session = this.getSession();
		Query query = session.createQuery(hql);
		query.setFirstResult(pageNum);
		query.setMaxResults(rowNum);
		List<N_book> books = query.list();
		session.close();
		return books;
	}

	@Override
	// 实现看小说时的上一页和下一页的功能
	public String nextContent(int bookID, int sectionNum) {
		Session session = this.getSession();
		Query query = session
				.createQuery("select c.c_sectionContent  from N_content as c where c.n_book.b_id="
						+ bookID);
		query.setFirstResult(sectionNum);
		query.setMaxResults(1);
		String sectionContent = query.list().get(0).toString();
		session.close();
		return sectionContent;
	}

	@Override
	// 根据小说ID得到小说的总章节数
	public int totalNum(int bookID) {
		Session session = this.getSession();
		int totalNumber = session.createQuery(
				"from N_content as c where c.n_book.b_id=" + bookID).list()
				.size();
		return totalNumber;
	}

	@Override
	// 根据小说类型来查询小说
	public List<N_book> bookByType(String type) {
		Session session = this.getSession();
		List<N_book> books = session.createQuery(
				"from N_book where b_type='" + type + "'").list();
		session.close();
		return books;
	}

	@Override
	// 根据小说的名字查询小说的ＩＤ
	public Integer bookID(String bookName) {
		Session session = this.getSession();
		List tempList=session.createQuery(
				"select b.b_id from N_book as b where b.b_name='" + bookName
				+ "'").list();
		if(tempList.size()==0)return null;
		int id = (Integer.parseInt(tempList.get(0).toString()));
		session.close();
		return id;
	}

	@Override
	// 得到某一类型小说的总阅览量
	public int sacnNum(String bookType) {
		int totalNum=0;
		Session session = this.getSession();
		List<N_book> books= bookByType(bookType);
		for (int i = 0; i <books.size(); i++) {
			totalNum+=bookInfor(books.get(0).getB_id()).getB_scanNum();
		}
		return totalNum;
	}

	@Override
	public N_shop shopInfor(int sid) {
		Session session =this.getSession();
		N_shop shop=(N_shop) session.createQuery("from N_shop where s_orderid="+sid).list().get(0);
		session.close();
		return shop;
	}

	@Override
	/*
	 * 
	 * 查询书的总数量
	 * */
	public int bookNum() {
		Session session =this.getSession();
		int bookNum= session.createQuery("from N_book").list().size();
		session.close();
		return bookNum;
	}

	@Override
	public List<N_book> getList(Map queryMap) {
		Session session=this.getSession();
		StringBuffer hql=new StringBuffer();
		hql.append("from N_book where 1=1");
		String bookType=(String)queryMap.get("bookType");
		if (bookType!=null&&!"".equals(bookType)) {
				hql.append(" and b_type ='"+bookType+"'");
		}
		return  session.createQuery(hql.toString()).list();
	}

	@Override
	public List<N_book> getList(Map map, int pageNum, int rowNum) {
		Session session =this.getSession();
		StringBuffer hql=new StringBuffer();
		hql.append("from N_book where 1=1");
		String type=(String)map.get("type");
		if (type!=null&&!"".equals(type)) {
			hql.append(" and b_type ='"+type+"'");
		}
		Query query =session.createQuery(hql.toString());
		query.setFirstResult(pageNum);
		query.setMaxResults(rowNum);
		List<N_book> books =query.list();
		session.close();
		return books;
	}

}
