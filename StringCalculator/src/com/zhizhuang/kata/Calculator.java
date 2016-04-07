package com.zhizhuang.kata;

public class Calculator {

	public int add(String s)
	{
		int value = 0;
		
		if(s.isEmpty())
			return 0;
		else
		{
			String [] ints = s.split("[,\n]");
			for(String i:ints)
				value += Integer.parseInt(i);
			return value;
		}
	}
}
