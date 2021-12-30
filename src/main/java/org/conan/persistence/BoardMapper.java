package org.conan.persistence;

import java.util.List;

import org.conan.domain.BoardVO;
import org.conan.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> getList();
	public void insert(BoardVO board);
	public BoardVO read(Long bno);
	public int delete(Long l);
	public int update(BoardVO board);
	public void insertSelectKey(BoardVO board);
	public List<BoardVO> getListWithPaging(Criteria cri);
}
