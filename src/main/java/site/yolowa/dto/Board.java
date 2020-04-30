package site.yolowa.dto;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int boardNo;
	private int boardWriterNo;
	private String boardTitle;
	private String boardContent;
	private String boardImage;
	private int boardState;
	private int boardCategory;
	private String boardDate;
	private int boardViewCount;
	private int boardType;
	private MultipartFile boardImageFile;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public int getBoardWriterNo() {
		return boardWriterNo;
	}
	public void setBoardWriterNo(int boardWriterNo) {
		this.boardWriterNo = boardWriterNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardImage() {
		return boardImage;
	}
	public void setBoardImage(String boardImage) {
		this.boardImage = boardImage;
	}
	public int getBoardState() {
		return boardState;
	}
	public void setBoardState(int boardState) {
		this.boardState = boardState;
	}
	public int getBoardCategory() {
		return boardCategory;
	}
	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardViewCount() {
		return boardViewCount;
	}
	public void setBoardViewCount(int boardViewCount) {
		this.boardViewCount = boardViewCount;
	}
	public int getBoardType() {
		return boardType;
	}
	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}
	
	public MultipartFile getBoardImageFile() {
		return boardImageFile;
	}
	public void setBoardImageFile(MultipartFile boardImageFile) {
		this.boardImageFile = boardImageFile;
	}
	
	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardWriterNo=" + boardWriterNo + ", boardTitle=" + boardTitle
				+ ", boardContent=" + boardContent + ", boardImage=" + boardImage + ", boardState=" + boardState
				+ ", boardCategory=" + boardCategory + ", boardDate=" + boardDate + ", boardViewCount=" + boardViewCount
				+ ", boardType=" + boardType + "]";
	}
}
