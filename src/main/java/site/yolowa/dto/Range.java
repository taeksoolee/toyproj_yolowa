package site.yolowa.dto;

// admin: 테이블 범위검색의 조건에 사용하는 클래스
public class Range {
	private String start;
	private String end;
	
	private int startI;
	private int endI;
	
	public Range() {
		// TODO Auto-generated constructor stub
	}
	
	public Range(String start, String end) {
		super();
		this.start = start;
		this.end = end;
	}
	
	public Range(int startI, int endI) {
		super();
		this.startI = startI;
		this.endI = endI;
	}
	
	
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}

	public int getStartI() {
		return startI;
	}

	public void setStartI(int startI) {
		this.startI = startI;
	}

	public int getEndI() {
		return endI;
	}

	public void setEndI(int endI) {
		this.endI = endI;
	}
	
	
}
