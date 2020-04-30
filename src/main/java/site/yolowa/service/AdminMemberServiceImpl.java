package site.yolowa.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import site.yolowa.dao.HostingDAO;
import site.yolowa.dao.MemberDAO;
import site.yolowa.dao.MessageDAO;
import site.yolowa.dto.AdminHostingTable;
import site.yolowa.dto.AdminMemberTable;
import site.yolowa.dto.Member;
import site.yolowa.dto.Message;
import site.yolowa.utils.AdminUtil;

@Service
public class AdminMemberServiceImpl implements AdminMemberService {
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private HostingDAO hostingDao;
	@Autowired
	private MessageDAO messageDao;

	@Override
	public List<AdminMemberTable> getAdminMemberTable(Map<String, Object> map) {
		return memberDao.selectAdminMemberTable(map);
	}
	
	@Override
	public List<AdminHostingTable> getAdminHostingTable(Map<String, Object> map) {
		return hostingDao.selectAdminHostingTable(map);
	}
	
	@Override
	public List<Message> getAdminMessageTable(Map<String, Object> map) {
		return messageDao.selectAdminMessageTable(map);
	}
	
	@Override
	public int addAdminMessage(Message message) {
		return messageDao.insertAdminMessage(message);
	}
	
	@Override
	public int modifyAdminMessageState(int messageNo) {
		return messageDao.updateMessageState(messageNo);
	}
}
