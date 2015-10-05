
public class Upper implements Transformer {

	@Override
	public String apply(String input) {
		return input.toUpperCase();
	}

}
