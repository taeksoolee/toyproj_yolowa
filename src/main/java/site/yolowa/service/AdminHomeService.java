package site.yolowa.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import site.yolowa.dto.Range;

public interface AdminHomeService {
	Map<String, Object> getAdminHomeCard();
	Map<String, Object> getAdminHomeTable(Range range);
	Map<String, Object> getAdminHomeChart(String type, String end, int count, HttpServletRequest req) throws IOException;

}