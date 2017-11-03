package lee.board.dao;

import java.util.List;

import lee.board.service.BoardSearchVO;
import lee.domain.BoardVO;

public interface BoardMapper {
	int boardCount(BoardSearchVO boardSearchVO);
	List<BoardVO> boardList(BoardSearchVO boardSearchVO);
}
