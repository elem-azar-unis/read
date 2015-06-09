package java1.nine.pojo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class N_book {
private int b_id;
private String b_name;
private String b_type;
private String b_picture;
private String b_intro;
private String b_long;
private String b_over;
private Date b_startTime;
private Date b_lastTime;
private int b_flowerNum;
private int b_eggNum;
//private int u_id;  该字段是表N_user的外键，用下面的N_user的对象代替
private int b_scanNum;
private String b_recommend;
private String b_freeScan;
private int  b_scanPrice;
private String b_canDownload;
private int b_downloadprice;
private String b_isSale;
private int b_salePrice;
private N_user n_user;
private Set<N_content> n_contents=new HashSet<N_content>();
private Set<N_discuss> n_discuss=new HashSet<N_discuss>();
private Set<N_shop> n_shop =new HashSet<N_shop>();

public N_book()
{
	b_startTime=new Date();
	b_lastTime=new Date();
}
public Set<N_shop> getN_shop() {
	return n_shop;
}
public void setN_shop(Set<N_shop> nShop) {
	n_shop = nShop;
}
public Set<N_discuss> getN_discuss() {
	return n_discuss;
}
public void setN_discuss(Set<N_discuss> nDiscuss) {
	n_discuss = nDiscuss;
}
public Set<N_content> getN_contents() {
	return n_contents;
}
public void setN_contents(Set<N_content> nContents) {
	n_contents = nContents;
}
public int getB_id() {
	return b_id;
}
public void setB_id(int bId) {
	b_id = bId;
}
public String getB_name() {
	return b_name;
}
public void setB_name(String bName) {
	b_name = bName;
}
public String getB_type() {
	return b_type;
}
public void setB_type(String bType) {
	b_type = bType;
}
public String getB_picture() {
	return b_picture;
}
public void setB_picture(String bPicture) {
	b_picture = bPicture;
}
public String getB_intro() {
	return b_intro;
}
public void setB_intro(String bIntro) {
	b_intro = bIntro;
}
public String getB_long() {
	return b_long;
}
public void setB_long(String bLong) {
	b_long = bLong;
}
public String getB_over() {
	return b_over;
}
public void setB_over(String bOver) {
	b_over = bOver;
}
public Date getB_startTime() {
	return b_startTime;
}
public void setB_startTime(Date bStartTime) {
	b_startTime = bStartTime;
}
public Date getB_lastTime() {
	return b_lastTime;
}
public void setB_lastTime(Date bLastTime) {
	b_lastTime = bLastTime;
}
public int getB_flowerNum() {
	return b_flowerNum;
}
public void setB_flowerNum(int bFlowerNum) {
	b_flowerNum = bFlowerNum;
}
public int getB_eggNum() {
	return b_eggNum;
}
public void setB_eggNum(int bEggNum) {
	b_eggNum = bEggNum;
}
public int getB_scanNum() {
	return b_scanNum;
}
public void setB_scanNum(int bScanNum) {
	b_scanNum = bScanNum;
}
public String getB_recommend() {
	return b_recommend;
}
public void setB_recommend(String bRecommend) {
	b_recommend = bRecommend;
}
public int getB_salePrice() {
	return b_salePrice;
}
public void setB_salePrice(int bSalePrice) {
	b_salePrice = bSalePrice;
}
public String getB_freeScan() {
	return b_freeScan;
}
public void setB_freeScan(String bFreeScan) {
	b_freeScan = bFreeScan;
}
public int getB_scanPrice() {
	return b_scanPrice;
}
public void setB_scanPrice(int bScanPrice) {
	b_scanPrice = bScanPrice;
}
public String getB_canDownload() {
	return b_canDownload;
}
public void setB_canDownload(String bCanDownload) {
	b_canDownload = bCanDownload;
}
public int getB_downloadprice() {
	return b_downloadprice;
}
public void setB_downloadprice(int bDownloadprice) {
	b_downloadprice = bDownloadprice;
}
public String getB_isSale() {
	return b_isSale;
}
public void setB_isSale(String bIsSale) {
	b_isSale = bIsSale;
}

public N_user getN_user() {
	return n_user;
}
public void setN_user(N_user nUser) {
	n_user = nUser;
}
}
