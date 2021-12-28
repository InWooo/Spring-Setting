package org.conan.test;

import static org.junit.Assert.assertNotNull;

import org.conan.domain.BoardVO;
import org.conan.service.BoardService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTest {
@Setter(onMethod_= {@Autowired})
private BoardService service;

@Test
public void testExist() {
	log.info(service);
	assertNotNull(service);
}
@Test
public void testRegister() {
	BoardVO board = new BoardVO();
	board.setTitle("새 글이 솔솔 Service");
	board.setContent("새 내용이 솔솔 Service");
	board.setWriter("newbie");
	service.register(board);
	log.info("생성된 게시물의 번호 : ");
}

@Test
public void testGet() {
	log.info(service.get(7L).getTitle());
}

@Test
public void testDelete() {
	log.info("REMOVE RESULT : "+service.remove(9L));
}

@Test
public void testUpdate() {
	BoardVO board = service.get(7L);
	if(board == null) {return;}
	board.setTitle("제목 수정 Service");
	log.info("MODIFY RESULT : "+service.modify(board));
}


}