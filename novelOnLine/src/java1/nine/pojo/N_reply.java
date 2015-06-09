package java1.nine.pojo;

public class N_reply {
private int r_id;
private String r_content;
private N_discuss n_discuss;
private N_user n_user;
public int getR_id() {
	return r_id;
}
public void setR_id(int rId) {
	r_id = rId;
}
public String getR_content() {
	return r_content;
}
public void setR_content(String rContent) {
	r_content = rContent;
}

public N_discuss getN_discuss() {
	return n_discuss;
}
public void setN_discuss(N_discuss nDiscuss) {
	n_discuss = nDiscuss;
}
public N_user getN_user() {
	return n_user;
}
public void setN_user(N_user nUser) {
	n_user = nUser;
}
}
