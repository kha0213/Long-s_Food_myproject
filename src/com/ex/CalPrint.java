package com.ex;

import java.util.Scanner;

public class CalPrint {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("원하는 년도 : ");
		int year = sc.nextInt();
		System.out.print("원하는 월 : ");
		int month = sc.nextInt();
		Calen c = new Calen(year, month);
		c.print();
		sc.close();
	}
}
