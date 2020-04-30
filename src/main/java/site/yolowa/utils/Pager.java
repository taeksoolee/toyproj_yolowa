package site.yolowa.utils;

//페이징 처리 관련 값들을 저장하기 위한 클래스
public class Pager {
	//생성자를 이용하여 매개변수로 값을 전달받아 초기값 저장 
	private int pageNum; //검색 페이지 번호
	private int totalBoard; //검색 게시글의 갯수
	private int pageSize; //하나의 페이지에 출력될 게시글의 갯수 
	private int blockSize; //하나의 페이지 블럭에 출력될 페이지의 갯수
	
	//생성자로 전달받은 값을 연산하여 저장
	private int totalPage; //전체 페이지 갯수
	private int startRow; //현재 페이지에 출력될 게시글의 시작 행번호
	private int endRow; //현재 페이지에 출력될 게시글의 종료 행번호
	
	private int startPage; //현재 페이지 블럭에 출력될 시작 페이지 번호
	private int endPage; //현재 페이지 블럭에 출력될 종료 페이지 번호
	private int prevPage; //이전 페이지 블럭에 출력될 시작 페이지 번호
	private int nextPage; //다음 페이지 블럭에 출력될 시작 페이지 번호
	
	public Pager(int pageNum, int totalBoard, int pageSize, int blockSize) {
		super();
		this.pageNum = pageNum;
		this.totalBoard = totalBoard;
		this.pageSize = pageSize;
		this.blockSize = blockSize;
		
		calcPager();
	}
	
	private void calcPager() {
		totalPage = (int)Math.ceil((double)totalBoard/pageSize);
		if(pageNum <= 0 || pageNum > totalPage) {
			pageNum = 1;
		}
		
		startRow = (pageNum - 1) * pageSize + 1;
		endRow = pageNum * pageSize;
		if (endRow > totalBoard) {
			endRow = totalBoard;
		}
		
		startPage = (pageNum - 1) / blockSize * blockSize + 1;
		endPage = startPage + blockSize - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		prevPage = startPage - blockSize;
		nextPage = startPage + blockSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalBoard() {
		return totalBoard;
	}

	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	@Override
	public String toString() {
		return "Pager [pageNum=" + pageNum + ", totalBoard=" + totalBoard + ", pageSize=" + pageSize + ", blockSize="
				+ blockSize + ", totalPage=" + totalPage + ", startRow=" + startRow + ", endRow=" + endRow
				+ ", startPage=" + startPage + ", endPage=" + endPage + ", prevPage=" + prevPage + ", nextPage="
				+ nextPage + "]";
	}
}
