package site.yolowa.dto;

// sns 관련 내용을 처리하기 위한 dto 객체
public class Sns {
	private String blog;
	private String twitter;
	private String facebook;
	private String instagram;
	
	public String getBlog() {
		return blog;
	}
	public void setBlog(String blog) {
		this.blog = blog;
	}
	public String getTwitter() {
		return twitter;
	}
	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}
	public String getFacebook() {
		return facebook;
	}
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	public String getInstagram() {
		return instagram;
	}
	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}

	@Override
	public String toString() {
		return "Sns [blog=" + blog + ", twitter=" + twitter + ", facebook=" + facebook + ", instagram=" + instagram
				+ "]";
	}
}
