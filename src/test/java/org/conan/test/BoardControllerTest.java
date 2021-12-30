package org.conan.test;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BoardControllerTest {
	@Setter(onMethod_= {@Autowired})
	private WebApplicationContext ctx;
	private MockMvc mMvc;
	@Before
	public void setup() {this.mMvc = MockMvcBuilders.webAppContextSetup(ctx).build();}
	@Test
	public void testList() throws Exception{
		log.info(mMvc.perform(MockMvcRequestBuilders.get("/board/list")).andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testResister()throws Exception{
		String resultPage = mMvc.perform(MockMvcRequestBuilders.post("/board/register").param("title","test from controller").param("content","test from controller").param("writer","user0000")).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test
	public void testGet()throws Exception{
		log.info(mMvc.perform(MockMvcRequestBuilders.get("/board/get").param("bno", "2")).andReturn().getModelAndView().getModelMap());
	}
	
	@Test
	public void testModify() throws Exception{
		String resultPage = mMvc.perform(MockMvcRequestBuilders.post("/board/modify").param("bno", "3").param("title", "3번3번").param("content", "3번 3번").param("writer", "3번 유저")).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test 
	public void testRemove()throws Exception{
		String resultPage=mMvc.perform(MockMvcRequestBuilders.post("/board/remove").param("bno","10")).andReturn().getModelAndView().getViewName();
		log.info(resultPage);
	}
	
	@Test 
	public void testListPaging()throws Exception{
		log.info(mMvc.perform(MockMvcRequestBuilders.get("/board/list").param("pageNum","2").param("amount","3")).andReturn().getModelAndView().getModelMap());
	}
	
}
