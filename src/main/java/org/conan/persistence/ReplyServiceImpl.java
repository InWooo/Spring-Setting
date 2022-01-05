package org.conan.persistence;

import org.conan.domain.Criteria;
import org.conan.domain.ReplyPageDTO;
import org.conan.domain.ReplyVO;
import org.conan.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
@Service
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_= @Autowired)
	private ReplyMapper remapper;
	@Setter(onMethod_= @Autowired)
	private BoardMapper mapper;

	@Transactional
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("register : "+vo);
		mapper.updateReplyCnt(vo.getBno(),1);
		return remapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		// TODO Auto-generated method stub
		log.info("get : "+rno);
		return remapper.read(rno);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		log.info("remove : "+rno);
		ReplyVO vo = remapper.read(rno);
		mapper.updateReplyCnt(vo.getBno(),-1);
		return remapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		log.info("modify : "+vo);
		return remapper.update(vo);
	}

	@Override
	public ReplyPageDTO getListPage(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		log.info(bno+"의 댓글 갯수 : "+remapper.getCountByBno(bno));
		return new ReplyPageDTO( remapper.getCountByBno(bno),remapper.getListWithPaging(cri,bno));
	}

}
