/**
 * 
 */
package org.conan.persistence;

import java.util.List;

import org.conan.domain.BoardVO;
import org.conan.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;
	
	
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		/* log.info("register success"+board.getBno()); */
		mapper.insert(board);

	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get success"+bno);
		return mapper.read(bno);

	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("modify..."+board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("remove..."+bno);
		return mapper.delete(bno)==1;
	}

	@Override
	public List<BoardVO> getList() {
		// TODO Auto-generated method stub
		log.info("getList...");
		return mapper.getList();
	}

}
