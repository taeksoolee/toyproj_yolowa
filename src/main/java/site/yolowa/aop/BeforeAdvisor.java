package site.yolowa.aop;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.springframework.ui.Model;

public class BeforeAdvisor {
	//메인페이지 접속했을때
	public void updateVisitedPage(JoinPoint point) throws FileNotFoundException, IOException {
		if(!point.getSignature().getName().equals("main")) return;
		
		HttpServletRequest request = null;
		Object[] args = point.getArgs();
		for(Object arg : args) {
			if(arg instanceof HttpServletRequest) {
				request = (HttpServletRequest)arg;
			}
		}
		
		if(request == null) return;
		
		
		Properties visitedsiteProp = new Properties();
		
		String realPath = request.getServletContext().getRealPath("WEB-INF/spring/visited-site.properties");
		
		visitedsiteProp.load(new FileInputStream(realPath));
		int count = 0;
		String now = new SimpleDateFormat("yy/MM").format(System.currentTimeMillis());
		
		if(visitedsiteProp.getProperty(now) == null) {
			count = 1;
		}else {
			count = Integer.parseInt(visitedsiteProp.getProperty(now));
			count++;
		}
		
		visitedsiteProp.setProperty(now, count+"");
		visitedsiteProp.save(new FileOutputStream(realPath), "date : " + now);
	}
		
	
	public void updateSns(JoinPoint point) {
		Model model = null;
		Object[] args = point.getArgs();
		for(Object arg : args) {
			if(arg instanceof Model) {
				model = (Model)arg;
			}
		}
		
		
		
	}
	
}
