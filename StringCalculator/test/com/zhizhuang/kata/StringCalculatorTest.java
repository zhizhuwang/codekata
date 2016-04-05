package com.zhizhuang.kata;

import org.junit.Test;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

public class StringCalculatorTest {

	@Test
	public void test_calculate_of_empty_string()
	{
		Calculator c = new Calculator();
		assertThat(c.calculate(""), is(0));
	}
	
}
