import java.util.ArrayList;
import java.util.List;


public class MockedView implements TransView {

	private List<String> transformerList;
	private String originalString ;
	private String resultString;
	
	@Override
	public int getTransformerCount() {
		return this.transformerList.size();
	}

	@Override
	public void initTransformers(List<String> transformers) {
		transformerList = new ArrayList<String>(transformers);
	}

	@Override
	public void refreshTransformers(List<String> transformers) {
		transformerList = new ArrayList<String>(transformers);
	}
	
	public void setOriginalString(String input)
	{
		originalString = input;
	}

	@Override
	public String getOringalString() {
		return originalString;
	}

	@Override
	public void setResultString(String output) {
		resultString = output ;
	}

	public String getResultString() {
		return resultString;
	}

}
