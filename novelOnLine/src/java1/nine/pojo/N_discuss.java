package java1.nine.pojo;

import java.util.HashSet;
import java.util.Set;

public class N_discuss {
	private int d_id;
	private N_book n_book;
	private String d_content;
	private N_user n_user;
	private Set<N_reply> n_replys=new HashSet<N_reply>();
	public Set<N_reply> getN_replys() {
		return n_replys;
	}
	public void setN_replys(Set<N_reply> nReplys) {
		n_replys = nReplys;
	}
	public int getD_id() {
		return d_id;
	}
	public void setD_id(int dId) {
		d_id = dId;
	}
	public N_book getN_book() {
		return n_book;
	}
	public void setN_book(N_book nBook) {
		n_book = nBook;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String dContent) {
		d_content = dContent;
	}
	public N_user getN_user() {
		return n_user;
	}
	public void setN_user(N_user nUser) {
		n_user = nUser;
	}
}
