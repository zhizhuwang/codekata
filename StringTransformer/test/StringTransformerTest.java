import static org.junit.Assert.*;

import org.junit.Test;


public class StringTransformerTest {

	@Test
	public void test_trans_app_init()
	{
		TransApp app = new TransApp(new String[]{"Upper","Lower"});
		
		assertEquals(2, app.getTransformerCount());
		
	}
	
	@Test
	public void test_trans_app_init_with_view()
	{
		TransApp app = new TransApp(new String[]{"Upper","Lower"});
		
		TransView gui = new MockedView();
		
		app.setView(gui);
		
		assertEquals(2, gui.getTransformerCount());
	}
	
}
