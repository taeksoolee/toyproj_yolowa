package site.yolowa.dto;

public class AdminCard {
	private String seperator;
	private int value;
	
	public String getSeperator() {
		return seperator;
	}
	public void setSeperator(String seperator) {
		this.seperator = seperator;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return "AdminCard [seperator=" + seperator + ", value=" + value + "]";
	}
}
