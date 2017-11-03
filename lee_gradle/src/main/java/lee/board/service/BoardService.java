package lee.board.service;

import java.util.List;

import lee.domain.BoardVO;

public interface BoardService {
	int boardCount(BoardSearchVO boardSearchVO);
	List<BoardVO> boardList(BoardSearchVO boardSearchVO);
}
