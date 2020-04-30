package site.yolowa.dto;

public class Message {
	private int messageNo;
	private int messageSenderNo;
	private int messageReceiverNo;
	private String messageContent;
	private String messageDate;
	private int messageState;
	
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public int getMessageSenderNo() {
		return messageSenderNo;
	}
	public void setMessageSenderNo(int messageSenderNo) {
		this.messageSenderNo = messageSenderNo;
	}
	public int getMessageReceiverNo() {
		return messageReceiverNo;
	}
	public void setMessageReceiverNo(int messageReceiverNo) {
		this.messageReceiverNo = messageReceiverNo;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	public int getMessageState() {
		return messageState;
	}
	public void setMessageState(int messageState) {
		this.messageState = messageState;
	}
	
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageSenderNo=" + messageSenderNo + ", messageReceiverNo="
				+ messageReceiverNo + ", messageContent=" + messageContent + ", messageDate=" + messageDate
				+ ", messageState=" + messageState + "]";
	}
	
	
	
	
}
