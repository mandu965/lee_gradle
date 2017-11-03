package lee.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lee.domain.BoardVO;

public interface BoardService {
	int boardCount(BoardSearchVO boardSearchVO);
	List<BoardVO> boardList(BoardSearchVO boardSearchVO);
	long boardAdd(HttpServletRequest req, BoardVO boardVO);
	BoardVO boardView(BoardSearchVO boardSearchVO);
}
