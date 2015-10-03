import static org.junit.Assert.*;

import java.util.Arrays;

import org.junit.Ignore;
import org.junit.Test;


public class StringTransformerTest {

	@Test
	public void test_trans_app_init()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"Upper","Lower"}));
		
		assertEquals(2, app.getTransformerCount());
		
	}
	
	@Test
	public void test_trans_app_init_with_view()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"Upper","Lower"}));
		
		TransView gui = new MockedView();
		
		app.setView(gui);
		
		assertEquals(2, gui.getTransformerCount());
	}
	
	@Test
	public void test_add_a_transformer_to_trans_app()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{}));
		
		TransView gui = new MockedView();
		
		app.setView(gui);
		
		app.addTransformer("Upper");
		
		assertEquals(1, gui.getTransformerCount());
		
		app.addTransformer("Lower");
		
		assertEquals(2, gui.getTransformerCount());
	}
	
	@Test
	public void test_remove_a_transformer_from_trans_app()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"Upper","Lower","TrimPrefix"}));
		
		TransView gui = new MockedView();
		
		app.setView(gui);
		
		app.removeTransformer("Upper");
		
		assertEquals(2, gui.getTransformerCount());
		
		app.removeTransformer("Lower");
		
		assertEquals(1, gui.getTransformerCount());
	}
	
	@Test
	public void test_remove_all_transformers_from_trans_app()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"Upper","Lower","TrimPrefix"}));
		
		TransView gui = new MockedView();
		
		app.setView(gui);
		
		app.removeAllTransformer();
		
		assertEquals(0, gui.getTransformerCount());
	}
	
	@Test
	public void test_apply_a_transformer_to_input_string()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"Upper"}));
		MockedView gui = new MockedView();
		app.setView(gui);

		gui.setOriginalString("hello world");
		
		app.applyTransformers();
		
		assertEquals("HELLO WORLD", gui.getResultString());
	}
	
	@Test
	public void test_apply_multiple_transformers_to_input_string()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"Upper","TrimPrefix"}));
		MockedView gui = new MockedView();
		app.setView(gui);

		gui.setOriginalString(" hello world ");
		
		app.applyTransformers();
		
		assertEquals("HELLO WORLD ", gui.getResultString());
	}
	
	@Test
	public void test_apply_multiple_transformers_with_Lower_and_TrimPrefix()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{"TrimPrefix","Lower"}));
		MockedView gui = new MockedView();
		app.setView(gui);

		gui.setOriginalString(" heLlo woRld ");
		
		app.applyTransformers();
		
		assertEquals("hello world ", gui.getResultString());
	}
}
