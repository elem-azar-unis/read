package java1.nine.dao.impl;
import java.util.ArrayList;
import java.util.List;

import java1.nine.dao.UserManager;
import java1.nine.pojo.*;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.sun.org.apache.xpath.internal.operations.And;

import sun.rmi.runtime.NewThreadAction;


public class UserManagerImpl  extends HibernateDaoSupport implements UserManager{

	@Override
	//根据用户的名称查询用户的详细信息
	public N_user userInfor(String name) {
		Session session =this.getSession();
		List<N_user> listUsers=session.createQuery("from N_user where u_name='"+name+"'").list();
		N_user userInfor=null;
		if (listUsers!=null&&listUsers.size()>0) {
			userInfor=listUsers.get(0);
		}
		session.close();
		return userInfor;
	}
	
	@Override
	//根据用户名和密码查询用户是否存在
	public boolean isAllow(String username, String password) {
		Session session =this.getSession();
		List<N_user> users=session.createQuery("from N_user where u_name='"+username+"' and u_psw='"+password+"'").list();
		if (users.size()!=0) {
			return true;
		}
		return false;
	}

	@Override
	//更新用户信息
	public void update(Object object) {
		Session session = this.getSession();
		session.beginTransaction();
		session.saveOrUpdate(object);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	public List<N_user> users(String hql, int pageNum, int rowNum) {
		Session session =this.getSession();
		Query query =session.createQuery(hql);
		query.setFirstResult(pageNum);
		query.setMaxResults(rowNum);
		List<N_user> users =query.list();
		session.close();
		return users;
	}

	@Override
	//删除用户信息
	public void delete(Object object) {
		Session session = this.getSession();
		session.beginTransaction();
		session.delete(object);
		session.getTransaction().commit();
		session.close();
	}
	@Override
	//保存刚插入的信息
	public  void save(Object object){
		Session session = this.getSession();
		session.beginTransaction();
		session.save(object);
		session.getTransaction().commit();
		session.close();
	}

	@Override
	//查询购物车信息
	public List<N_shop> searchCar(int userID) {
		Session session =this.getSession();
		List<N_shop> shopCar= session.createQuery("from N_shop where s_state='未付款' and n_user.u_id="+userID ).list();
		session.close();
		return shopCar;
	}

	@Override
	public int userNum() {
		Session session =this.getSession();
		 int totalNum=session.createQuery("from N_user").list().size();
		 session.close();
		return totalNum;
	}

	

}
