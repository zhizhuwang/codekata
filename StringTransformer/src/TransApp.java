import java.util.List;


public class TransApp {

	private List<String> transformers = null;
	private TransView gui = null;
	
	public TransApp(List<String> transformers)
	{
		this.transformers = transformers;
	}
	

	public int getTransformerCount() {
		return this.transformers.size();
	}


	public void setView(TransView view) {
		gui = view;
		gui.initTransformers(this.transformers);
	}


	public void addTransformer(String aTransformer) {

		
	}
}
