import java.util.ArrayList;
import java.util.List;


public class TransApp {

	private List<String> transformers;
	private TransView gui = null;
	
	public TransApp(List<String> transformers)
	{
		this.transformers = new ArrayList<String>(transformers);
	}
	

	public int getTransformerCount() {
		return this.transformers.size();
	}


	public void setView(TransView view) {
		gui = view;
		gui.initTransformers(this.transformers);
	}


	public void addTransformer(String aTransformer) {

		transformers.add(aTransformer);
		
		gui.refreshTransformers(transformers);
	}


	public void removeTransformer(String string) {
		transformers.remove(string);
		gui.refreshTransformers(transformers);
	}


	public void removeAllTransformer() {
		this.transformers.clear();
		gui.refreshTransformers(transformers);
	}


	public void applyTransformers() {

		String input = gui.getOringalString();
		String output = input;
		
		for(String aTransformer : this.transformers)
		{
			
			if(aTransformer.equals("Upper"))
			{
				output = output.toUpperCase();
			}
			else if(aTransformer.equals("TrimPrefix"))
			{
				output = trimPrefix(output);
			}
		}
		gui.setResultString(output);
	}


	private String trimPrefix(String input) {
		int i = 0;
		for(; i<input.length(); i++)
		{
			if(input.charAt(i) != ' ')
				break;
		}
		return input.substring(i);
	}
}
