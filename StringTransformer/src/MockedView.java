
public class MockedView implements TransView {

	private String[] transformerList;
	@Override
	public int getTransformerCount() {
		return this.transformerList.length;
	}

	@Override
	public void initTransformers(String[] transformers) {
		transformerList = transformers;
	}

}
