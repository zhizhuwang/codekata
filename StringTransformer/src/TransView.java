import java.util.List;


public interface TransView {

	int getTransformerCount();

	void initTransformers(List<String> transformers);

	void refreshTransformers(List<String> transformers);

	String getOringalString();

	void setResultString(String output);

	
}
