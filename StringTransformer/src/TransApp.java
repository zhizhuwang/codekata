
public class TransApp {

	private String[] transformers = null;
	private TransView gui = null;
	
	public TransApp(String[] transformers)
	{
		this.transformers = transformers;
	}
	

	public int getTransformerCount() {
		return this.transformers.length;
	}


	public void setView(TransView view) {
		gui = view;
		gui.initTransformers(this.transformers);
	}
}
