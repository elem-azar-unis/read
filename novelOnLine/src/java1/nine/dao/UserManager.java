package java1.nine.dao;

import java.util.List;

import java1.nine.pojo.N_shop;
import java1.nine.pojo.N_user;

public interface UserManager {
	public N_user userInfor(String  name);//根据用户名字查询用户的信息
	public boolean isAllow(String username,String password);//根据用户名和密码查询用户是否存在
	public void  update(Object object);//修改用户信息后保存，即更新信息
	public List<N_user> users(String hql,int pageNum, int rowNum);//分页查询用户信息
	public void delete(Object object);//删除用户信息
	public void save(Object object);//保存刚插入的信息
	public List<N_shop> searchCar(int userID);//通过用户的ID查询用户购物车中的信息
	public int userNum();//查询用户的总人数；
}
