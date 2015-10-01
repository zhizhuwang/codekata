import java.util.ArrayList;
import java.util.List;


public class MockedView implements TransView {

	private List<String> transformerList;
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

}
