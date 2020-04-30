package site.yolowa.dto;

public class Wishlist {
	private int wishlistMemberNo;
	private int wishlistHostingNo;
	private String wishlistDate;
	
	public int getWishlistMemberNo() {
		return wishlistMemberNo;
	}
	public void setWishlistMemberNo(int wishlistMemberNo) {
		this.wishlistMemberNo = wishlistMemberNo;
	}
	public int getWishlistHostingNo() {
		return wishlistHostingNo;
	}
	public void setWishlistHostingNo(int wishlistHostingNo) {
		this.wishlistHostingNo = wishlistHostingNo;
	}
	public String getWishlistDate() {
		return wishlistDate;
	}
	public void setWishlistDate(String wishlistDate) {
		this.wishlistDate = wishlistDate;
	}
	
	@Override
	public String toString() {
		return "Wishlist [wishlistMemberNo=" + wishlistMemberNo + ", wishlistHostingNo=" + wishlistHostingNo
				+ ", wishlistDate=" + wishlistDate + "]";
	}
}
