package site.yolowa.dto;

public class MainMessage {
	private int rn;
	private String senderImage;
	private String senderName;
	private Message message;
	
	public MainMessage() {
		// TODO Auto-generated constructor stub
	}

	public String getSenderImage() {
		return senderImage;
	}

	public void setSenderImage(String senderImage) {
		this.senderImage = senderImage;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}
	
	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}

	@Override
	public String toString() {
		return "MainMessage [senderImage=" + senderImage + ", senderName=" + senderName + ", message=" + message + "]";
	}
	
	
}
