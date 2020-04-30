package site.yolowa.dto;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Hosting {
	private int hostingNo;
	private int hostingMemberNo;
	private String hostingAddress;
	private String hostingName;
	private String hostingDate;
	private String hostingDesc;
	private String hostingImage;
	private int hostingCategory;
	private int hostingState;
	private int hostingPrice;
	private int hostingPrivate;
	private int hostingRoom;
	private int hostingPerson;
	private int hostingBathroom; 
	private int hostingBed;
	private String hostingAmenities;
	private String hostingSafety;
	private String hostingFacilities;
	private String hostingRule;
	private String hostingRuleDetail;
	private float hostingLatitude;
	private float hostingLongitude;
	private int hostingViewCount;
	private String hostingCardNum;
	
	private List<MultipartFile> file;
	
	public int getHostingNo() {
		return hostingNo;
	}
	public void setHostingNo(int hostingNo) {
		this.hostingNo = hostingNo;
	}
	public int getHostingMemberNo() {
		return hostingMemberNo;
	}
	public void setHostingMemberNo(int hostingMemberNo) {
		this.hostingMemberNo = hostingMemberNo;
	}
	public String getHostingAddress() {
		return hostingAddress;
	}
	public void setHostingAddress(String hostingAddress) {
		this.hostingAddress = hostingAddress;
	}
	public String getHostingName() {
		return hostingName;
	}
	public void setHostingName(String hostingName) {
		this.hostingName = hostingName;
	}
	public String getHostingDate() {
		return hostingDate;
	}
	public void setHostingDate(String hostingDate) {
		this.hostingDate = hostingDate;
	}
	public String getHostingDesc() {
		return hostingDesc;
	}
	public void setHostingDesc(String hostingDesc) {
		this.hostingDesc = hostingDesc;
	}
	public String getHostingImage() {
		return hostingImage;
	}
	public void setHostingImage(String hostingImage) {
		this.hostingImage = hostingImage;
	}
	public int getHostingCategory() {
		return hostingCategory;
	}
	public void setHostingCategory(int hostingCategory) {
		this.hostingCategory = hostingCategory;
	}
	public int getHostingState() {
		return hostingState;
	}
	public void setHostingState(int hostingState) {
		this.hostingState = hostingState;
	}
	public int getHostingPrice() {
		return hostingPrice;
	}
	public void setHostingPrice(int hostingPrice) {
		this.hostingPrice = hostingPrice;
	}
	public int getHostingPrivate() {
		return hostingPrivate;
	}
	public void setHostingPrivate(int hostingPrivate) {
		this.hostingPrivate = hostingPrivate;
	}
	public int getHostingRoom() {
		return hostingRoom;
	}
	public void setHostingRoom(int hostingRoom) {
		this.hostingRoom = hostingRoom;
	}
	public int getHostingPerson() {
		return hostingPerson;
	}
	public void setHostingPerson(int hostingPerson) {
		this.hostingPerson = hostingPerson;
	}
	public int getHostingBathroom() {
		return hostingBathroom;
	}
	public void setHostingBathroom(int hostingBathroom) {
		this.hostingBathroom = hostingBathroom;
	}
	public int getHostingBed() {
		return hostingBed;
	}
	public void setHostingBed(int hostingBed) {
		this.hostingBed = hostingBed;
	}
	public String getHostingAmenities() {
		return hostingAmenities;
	}
	public void setHostingAmenities(String hostingAmenities) {
		this.hostingAmenities = hostingAmenities;
	}
	public String getHostingSafety() {
		return hostingSafety;
	}
	public void setHostingSafety(String hostingSafety) {
		this.hostingSafety = hostingSafety;
	}
	public String getHostingFacilities() {
		return hostingFacilities;
	}
	public void setHostingFacilities(String hostingFacilities) {
		this.hostingFacilities = hostingFacilities;
	}
	public String getHostingRule() {
		return hostingRule;
	}
	public void setHostingRule(String hostingRule) {
		this.hostingRule = hostingRule;
	}
	public String getHostingRuleDetail() {
		return hostingRuleDetail;
	}
	public void setHostingRuleDetail(String hostingRuleDetail) {
		this.hostingRuleDetail = hostingRuleDetail;
	}
	public float getHostingLatitude() {
		return hostingLatitude;
	}
	public void setHostingLatitude(float hostingLatitude) {
		this.hostingLatitude = hostingLatitude;
	}
	public float getHostingLongitude() {
		return hostingLongitude;
	}
	public void setHostingLongitude(float hostingLongitude) {
		this.hostingLongitude = hostingLongitude;
	}
	public int getHostingViewCount() {
		return hostingViewCount;
	}
	public void setHostingViewCount(int hostingViewCount) {
		this.hostingViewCount = hostingViewCount;
	}
	public String getHostingCardNum() {
		return hostingCardNum;
	}
	public void setHostingCardNum(String hostingCardNum) {
		this.hostingCardNum = hostingCardNum;
	}
	public List<MultipartFile> getFile() {
		return file;
	}
	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}
	
	@Override
	public String toString() {
		return "Hosting [hostingNo=" + hostingNo + ", hostingMemberNo=" + hostingMemberNo + ", hostingAddress="
				+ hostingAddress + ", hostingName=" + hostingName + ", hostingDate=" + hostingDate + ", hostingDesc="
				+ hostingDesc + ", hostingImage=" + hostingImage + ", hostingCategory=" + hostingCategory
				+ ", hostingState=" + hostingState + ", hostingPrice=" + hostingPrice + ", hostingPrivate="
				+ hostingPrivate + ", hostingRoom=" + hostingRoom + ", hostingPerson=" + hostingPerson
				+ ", hostingBathroom=" + hostingBathroom + ", hostingBed=" + hostingBed + ", hostingAmenities="
				+ hostingAmenities + ", hostingSafety=" + hostingSafety + ", hostingFacilities=" + hostingFacilities
				+ ", hostingRule=" + hostingRule + ", hostingRuleDetail=" + hostingRuleDetail + ", hostingLatitude="
				+ hostingLatitude + ", hostingLongitude=" + hostingLongitude + ", hostingViewCount=" + hostingViewCount
				+ ", hostingCardNum=" + hostingCardNum + "]";
	}
	
	
}
