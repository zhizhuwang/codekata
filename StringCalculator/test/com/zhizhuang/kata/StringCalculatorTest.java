package com.zhizhuang.kata;

import org.junit.Test;
import static org.hamcrest.core.Is.is;
import static org.junit.Assert.*;

public class StringCalculatorTest {
	Calculator c = new Calculator();

	@Test
	public void test_calculate_of_empty_string()
	{
		assertThat(c.add(""), is(0));
	}
	
	@Test
	public void test_calculate_single_number()
	{
		assertThat(c.add("1"), is(1));
	}
	
	@Test
	public void test_calculate_two_numbers()
	{
		assertThat(c.add("1,2"), is(3));
	}
}
