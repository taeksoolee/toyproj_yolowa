package site.yolowa.dto;

public class BoardComment {
	private int boardNo;
	private Board board;
	private String memberImage;
	private String memberName;
	private int cnt;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public Board getBoard() {
		return board;
	}
	public void setBoard(Board board) {
		this.board = board;
	}
	public String getMemberImage() {
		return memberImage;
	}
	public void setMemberImage(String memberImage) {
		this.memberImage = memberImage;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	@Override
	public String toString() {
		return "BoardComment [boardNo=" + boardNo + ", board=" + board + ", memberImage=" + memberImage
				+ ", memberName=" + memberName + ", cnt=" + cnt + "]";
	}


	

}
