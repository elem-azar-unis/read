package java1.nine.pojo;

import java.util.HashSet;
import java.util.Set;

public class N_user {
private int u_id;
private String u_name;
private String u_psw;
private String u_author;
private int u_level;
private int u_balance;
private int u_expense;
private Set<N_book> n_books=new HashSet<N_book>();
private Set<N_discuss> n_discuss=new HashSet<N_discuss>();
private Set<N_reply> n_replys=new HashSet<N_reply>();
private Set<N_shop> n_shop = new HashSet<N_shop>();
public Set<N_shop> getN_shop() {
	return n_shop;
}
public void setN_shop(Set<N_shop> nShop) {
	n_shop = nShop;
}
public Set<N_reply> getN_replys() {
	return n_replys;
}
public void setN_replys(Set<N_reply> nReplys) {
	n_replys = nReplys;
}
public Set<N_discuss> getN_discuss() {
	return n_discuss;
}
public void setN_discuss(Set<N_discuss> nDiscuss) {
	n_discuss = nDiscuss;
}
public Set<N_book> getN_books() {
	return n_books;
}
public void setN_books(Set<N_book> nBooks) {
	n_books = nBooks;
}

public int getU_id() {
	return u_id;
}
public void setU_id(int uId) {
	u_id = uId;
}
public String getU_name() {
	return u_name;
}
public void setU_name(String uName) {
	u_name = uName;
}
public String getU_psw() {
	return u_psw;
}
public void setU_psw(String uPsw) {
	u_psw = uPsw;
}
public String getU_author() {
	return u_author;
}
public void setU_author(String uAuthor) {
	u_author = uAuthor;
}
public int getU_level() {
	return u_level;
}
public void setU_level(int uLevel) {
	u_level = uLevel;
}
public int getU_balance() {
	return u_balance;
}
public void setU_balance(int uBalance) {
	u_balance = uBalance;
}
public int getU_expense() {
	return u_expense;
}
public void setU_expense(int uExpense) {
	u_expense = uExpense;
}
}
