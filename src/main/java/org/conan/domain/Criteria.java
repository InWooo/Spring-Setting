package org.conan.domain;

import lombok.ToString;

@ToString
public class Criteria {
	private int pageNum;//페이지번호
	private int amount;//한 페이지에 출력되는 데이터 수
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
	public int getPageStart() { //limit 구문에서 시작위치지정
		return (this.pageNum-1)*this.amount;
	}
}
