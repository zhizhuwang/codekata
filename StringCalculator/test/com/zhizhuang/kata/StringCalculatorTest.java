package com.zhizhuang.kata;

import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;

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
	
	@Test
	public void test_calculate_multiple_numbers()
	{
		assertThat(c.add("1,2,3"), is(6));
	}
	
	@Test
	public void test_calculate_multiple_numbers_with_newline()
	{
		assertThat(c.add("1,2\n3"), is(6));
	}
	
	@Test
	public void test_calculate_multiple_numbers_with_other_delimiters()
	{
		assertThat(c.add("1;2\n3"), is(6));
	}
	
	@Test
	public void test_calculate_multiple_numbers_containing_seperate_line_of_delimiters()
	{
		assertThat(c.add("//;\n1;2;3"), is(6));
	}
	
	
	@Rule
	public ExpectedException expectedException = ExpectedException.none();

	@Test
	public void throws_exception_on_negative_number() {
		expectedException.expect(IllegalArgumentException.class);
		expectedException.expectMessage("negative number: -3");

		c.add("-3");
	}
	
	@Test
	public void test_numbers_bigger_then_1000_are_ignored()
	{
		assertThat(c.add("//;\n1;2;1003"), is(3));
	}
}
