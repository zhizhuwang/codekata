import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class TransApp {

	private List<String> transformers;
	private TransView gui = null;
	private Map<String, Transformer> transMap = new HashMap<>();
	
	public TransApp(List<String> transformers)
	{
		this.transformers = new ArrayList<String>(transformers);
		transMap.put("Upper", new Upper());
		transMap.put("Lower", new Lower());
		transMap.put("TrimPrefix", new TrimPrefix());
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
		
		for(String aTransformer : transformers)
		{
			Transformer t = getTransforer(aTransformer);
			output = t.apply(output);
		}
		gui.setResultString(output);
	}


	private Transformer getTransforer(String aTransformer) {
		
		return transMap.get(aTransformer);
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
