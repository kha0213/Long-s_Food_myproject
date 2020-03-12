package com.yl.dto;

public class NextGrade_dto {
	private int nextMoney;
	private String nextGname;
	public NextGrade_dto(int nextMoney, String nextGname) {
		super();
		this.nextMoney = nextMoney;
		this.nextGname = nextGname;
	}
	public NextGrade_dto() {
		super();
	}
	public int getNextMoney() {
		return nextMoney;
	}
	public void setNextMoney(int nextMoney) {
		this.nextMoney = nextMoney;
	}
	public String getNextGname() {
		return nextGname;
	}
	public void setNextGname(String nextGname) {
		this.nextGname = nextGname;
	}
	
}
