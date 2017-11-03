package lee.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.board.dao.BoardMapper;
import lee.board.service.BoardSearchVO;
import lee.board.service.BoardService;
import lee.domain.BoardVO;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;
	
	public int boardCount(BoardSearchVO boardSearchVO) {
		return boardMapper.boardCount(boardSearchVO);
	}
	public List<BoardVO> boardList(BoardSearchVO boardSearchVO){
		return boardMapper.boardList(boardSearchVO);
	}
}
