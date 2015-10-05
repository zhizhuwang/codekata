
public class TrimPrefix implements Transformer{

	@Override
	public String apply(String input)
	{
		int i = 0;
		for(; i<input.length(); i++)
		{
			if(input.charAt(i) != ' ')
				break;
		}
		return input.substring(i);
	}
}
