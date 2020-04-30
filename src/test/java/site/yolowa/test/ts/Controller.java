package site.yolowa.test.ts;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class Controller {
	private static final Logger logger=LoggerFactory.getLogger(Controller.class);
	
	@Autowired
	private WebApplicationContext wac;
	private MockMvc mvc;
	
	@Before
	public void setup() {
		mvc=MockMvcBuilders.webAppContextSetup(wac).build();
		logger.info("MockMvc °´Ã¼ »ý¼º");
	}
	
	/*
	@Test
	public void test() throws Exception {
		MvcResult result=mvc.perform(MockMvcRequestBuilders.post("/admin/member/hosting").param("receiver", "1").param("message", "aaa").param("", "")).andReturn();
		//MvcResult result=mvc.perform(MockMvcRequestBuilders.post("/admin/member/member")).andReturn();
		logger.info("hello");
		logger.info(result.getModelAndView().getViewName());
		logger.info(result.getModelAndView().getModel().toString());
	}
	*/
	
	@Test
	public void test() throws Exception {
		MvcResult result=mvc.perform(MockMvcRequestBuilders.get("/admin/reservation/reservation")).andReturn();
		logger.info(result.getModelAndView().getViewName());
		logger.info(result.getModelAndView().getModel().toString());
		
	}
}
