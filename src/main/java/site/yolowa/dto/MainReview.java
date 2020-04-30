package site.yolowa.dto;

public class MainReview {
	private int rn;
	private String writerNo;
	private String writerName;
	private String writerImage;
	private Review review;
	
	public MainReview() {
		// TODO Auto-generated constructor stub
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	public String getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(String writerNo) {
		this.writerNo = writerNo;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public String getWriterImage() {
		return writerImage;
	}

	public void setWriterImage(String writerImage) {
		this.writerImage = writerImage;
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}
	
	
}
