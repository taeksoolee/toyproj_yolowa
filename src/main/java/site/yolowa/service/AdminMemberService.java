package site.yolowa.service;

import java.util.List;
import java.util.Map;

import site.yolowa.dto.AdminHostingTable;
import site.yolowa.dto.AdminMemberTable;
import site.yolowa.dto.Message;

public interface AdminMemberService {
	List<AdminMemberTable> getAdminMemberTable(Map<String, Object> map);
	List<AdminHostingTable> getAdminHostingTable(Map<String, Object> map);
	List<Message> getAdminMessageTable(Map<String, Object> map);
	int addAdminMessage(Message message);
	int modifyAdminMessageState(int messageNo);
}