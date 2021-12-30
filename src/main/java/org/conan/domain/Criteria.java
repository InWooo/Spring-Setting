package org.conan.domain;

import lombok.ToString;

@ToString
public class Criteria {
	private int pageNum;//페이지번호
	private int amount;//한 페이지에 출력되는 데이터 수
	private String type;
	private String keyword;
	public Criteria() {this(1,10);}
	public Criteria(int pageNum,int amount) {
		this.pageNum = pageNum; //mysql에서 limit고려
		this.amount = amount;
	}
	
	public void setPageNum(int pageNum) {
		if(pageNum<=0) {
			this.pageNum=1;
			return;
		}
		this.pageNum = pageNum;
	}
	
	public int getPageNum() {return this.pageNum;}
	public int getAmount() {return this.amount;}
	public void setAmount(int amount) {this.amount = amount;}
	public String getType() {return this.type;}
	public void setType(String type) {this.type=type;}
	public String getKeyword() {return this.keyword;}
	public void setKeyword(String keyword) {this.keyword=keyword;}
	public int getPageStart() { //limit 구문에서 시작위치지정
		return (this.pageNum-1)*this.amount;
	}
	public String[]getTypeArr(){
		return type==null?new String[] {}:type.split("");
		//검색조건을 배열로 처리
	}
}
