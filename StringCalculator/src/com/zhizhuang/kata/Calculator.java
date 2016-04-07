package com.zhizhuang.kata;

public class Calculator {

	public int add(String s)
	{
		int value = 0;
		
		if(s.isEmpty())
			return 0;
		else
		{
			String [] ints;
			if(s.startsWith("//"))
			{
				String delimiter = s.substring(2,3);
				s = s.substring(s.indexOf("\n") + 1);
				ints = s.split(delimiter);
				
			}
			else
			{
				ints = s.split("[,\n;]");
			}
			for(String i:ints)
				if(i.startsWith("-"))
					throw new IllegalArgumentException("negative number: " + i);
				else
				{
					int v = Integer.parseInt(i);
					if(v > 1000)
						continue;
				value += Integer.parseInt(i);
				}
			return value;
		}
	}
}
