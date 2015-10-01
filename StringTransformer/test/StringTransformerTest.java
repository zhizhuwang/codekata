import static org.junit.Assert.*;

import org.junit.Test;


public class StringTransformerTest {

	@Test
	public void test_trans_app_init()
	{
		TransApp app = new TransApp(new String[]{"Upper","Lower"});
		
		assertEquals(2, app.getTransformerCount());
		
//		TransView gui = new TransView();
		
//		app.setView(gui);
		
//		gui.setOriginalString("hello world");
		
//		assertEquals("HELLO WORLD", gui.getResultString());
	}
	
}
