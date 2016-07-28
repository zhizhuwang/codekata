import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

public class QueryTest {

	@Test
	public void qurry_one_student_in_array()
	{
		Student[] sdudents = new Student[]{new Student("adam", 23), new Student("john", 18)};
		assertThat(QueryWorker.findByAge(sdudents), notNullValue());
		assertThat(QueryWorker.findByAge(sdudents).getName(), is("john"));
	}
	
	@Test
	public void qurry_one_student_by_name_in_array()
	{
		Student[] sdudents = new Student[]{new Student("adam", 23), new Student("john", 18)};
		assertThat(QueryWorker.findByName(sdudents), notNullValue());
	}
	
	@Test
	public void query_one_student_by_name_in_array()
	{
		Student[] sdudents = new Student[]{new Student("adam", 23), new Student("john", 18)};
		assertThat(QueryWorker.find(sdudents, new NamePredictor("john")), notNullValue());
	}
	
	@Test
	public void query_one_student_by_age_in_array_with_predictor()
	{
		Student[] students = new Student[]{new Student("adam", 23), new Student("john", 18)};
		assertThat(QueryWorker.find(students, new AgePredictor(18)), notNullValue());
	}
	
	@Test
	public void query_one_student_by_name_in_array_with_lambda()
	{
		Student[] sdudents = new Student[]{new Student("adam", 23), new Student("john", 18)};
		assertThat(QueryWorker.find(sdudents, s -> s.getName().equals("john")), notNullValue());
	}
	
	@Test
	public void query_one_student_by_age_in_array_with_lambda()
	{
		Student[] students = new Student[]{new Student("adam", 23), new Student("john", 18)};
		assertThat(QueryWorker.find(students, stu -> stu.getAge() == 18), notNullValue());
	}
	
	@Test
	public void query_one_student_by_age_in_List()
	{
		List<Student> students = Arrays.asList(new Student[]{new Student("adam", 23), new Student("john", 18)});
		assertThat(QueryWorker.find(students, stu -> stu.getAge() == 18), notNullValue());
	}
}
