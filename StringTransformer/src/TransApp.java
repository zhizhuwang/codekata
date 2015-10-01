
public class TransApp {

	private String[] transformers = null;
	
	public TransApp(String[] transformers)
	{
		this.transformers = transformers;
	}

	public int getTransformerCount() {
		return this.transformers.length;
	}
}
