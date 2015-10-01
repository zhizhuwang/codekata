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
	@Ignore
	public void test_add_a_transformer_to_trans_app()
	{
		TransApp app = new TransApp(Arrays.asList(new String[]{}));
		
		TransView gui = new MockedView();
		
		app.setView(gui);
		
		app.addTransformer("Upper");
		
		assertEquals(1, gui.getTransformerCount());
	}
	
}
