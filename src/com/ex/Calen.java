package com.ex;

import java.util.Calendar;

public class Calen {
	private Calendar calendar;
	private String[][] calDate = new String[6][7];
		//calDate[0][0] ~ calDate[5][6] 모두 null;
	private String[] title = {"일","월","화","수","목","금","토"};
	private int width = title.length; //7
	private int startday; // 시작하는 요일 (1:일, 2:월, ..)
	private int lastday;  // 월의 마지막 날짜
	private int day=1;      // 날짜를 뿌리기 위한 변수
	public Calen(int year, int month){ //생성자
		if(month<1 || month>12){
			System.out.println("월은 1~12사이만");
			System.exit(1);
		}
		calendar = Calendar.getInstance(); // 날짜시간 객체 c
		//calendar.set(Calendar.YEAR, year); //year로 년도 변경
		//calendar.set(Calendar.MONTH, month-1); //month월로 월변경
		//calendar.set(Calendar.DATE, 1);
		calendar.set(year, month-1, 1);
		startday = calendar.get(Calendar.DAY_OF_WEEK); // 월의 시작하는 요일(1:일)
		System.out.println("시작 요일"+startday);
		lastday = calendar.getActualMaximum(Calendar.DATE);//월의 끝나는 날
		int row = 0 ; //0행부터 시작
		for(int i=1 ; day<=lastday ; i++){
			if(i<startday){ //뿌리면 안되는 것
				calDate[row][i-1] = "";
			}else{	// 뿌려야 되는 것
				calDate[row][(i-1)%width]=String.valueOf(day++);
				if(i%width==0) row++;
			}
		}
	}
	public void print(){ // 콘솔 출력
		for(String t : title)
			System.out.print(t+"\t");// 일~토 title 출력
		System.out.println(); //개행
		for(int i=0 ; i<calDate.length ; i++){
			for(int j=0 ; j<calDate[i].length ; j++){
				if(calDate[i][j]!=null)
					System.out.print(calDate[i][j]+"\t");
			}
			System.out.println();//개행
		}
	}
}
