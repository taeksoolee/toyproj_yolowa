package site.yolowa.dto;

// reservation 테이블을 토대로 거래내역 테이블 출력을 위한 dto
public class AdminChart {
	private String month;
	private int count;
	private int tatalPriceSum;
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getTatalPriceSum() {
		return tatalPriceSum;
	}
	public void setTatalPriceSum(int tatalPriceSum) {
		this.tatalPriceSum = tatalPriceSum;
	}
	
	@Override
	public String toString() {
		return "AdminChart [month=" + month + ", count=" + count + ", tatalPriceSum=" + tatalPriceSum + "]";
	}
}
