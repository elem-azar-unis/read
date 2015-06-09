package java1.nine.dao.impl;

import java.util.List;
import java.util.Map;

import java1.nine.dao.CommentManager;
import java1.nine.pojo.N_discuss;
import java1.nine.pojo.N_reply;
import java1.nine.pojo.N_user;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sun.net.httpserver.Authenticator.Success;

public class CommentManagerImpl extends HibernateDaoSupport implements CommentManager{
	//插入评论内容 到评论表    或   回复信息 到回复表
	public void insertCmt(Object object){
//		this.getHibernateTemplate().save(object);//视频上的讲解
		Session session=this.getSession();
		Transaction transaction=session.beginTransaction();
		session.save(object);
		transaction.commit();
		session.close();
	}
	
	
	
	//验证用户是否合法
	public String isAllow(String name,String pwd){
		Session session=this.getSession();
		List list=session.createQuery("from N_user u where u.u_name='"+name+"'and u.u_psw='"+pwd+"'").list();
		session.close();
		if(list.size()!=0){
			return "true";
		}else {
			return "false";
		}
				
	}
	//根据用户名查找用户id
	public int  searchUserbyName(String string){
		Session session=this.getSession();
		int i=Integer.parseInt(session.createQuery("select u.u_id from N_user u where u.u_name='"+string+"'").list().get(0).toString());
		session.close();
		return i;
		
		
	}

  //通过书的ID查找所有的评论信息
	@Override
	public List<N_discuss> searchCmtbybid(int a) {
		Session session=this.getSession();
		List<N_discuss> discusses=session.createQuery("from N_discuss as d where d.n_book.b_id='"+a+"'").list();
		session.close();
		return discusses;
	}
	
	public List<N_reply> searchRepliesby(int a){
		Session session=this.getSession();
		List<N_reply> replies=session.createQuery("from N_reply as r where r.n_discuss.d_id='"+a+"'").list();
		session.close();
		return replies;
	}



	@Override
	public List<N_discuss> getlist(Map map, int pageNum, int rowNum) {
		Session session =this.getSession();
		StringBuffer hql=new StringBuffer();
		hql.append("from N_discuss where 1=1");
		Integer bid=(Integer)map.get("bid");
		if (bid!=null) {
			hql.append(" and n_book.b_id="+bid);
		}
		Query query =session.createQuery(hql.toString());
		query.setFirstResult(pageNum);
		query.setMaxResults(rowNum);
		List<N_discuss> list =query.list();
		session.close();
		return list;
	}
}
