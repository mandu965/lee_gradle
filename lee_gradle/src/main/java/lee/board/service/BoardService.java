package lee.board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lee.domain.BoardVO;
import lee.domain.CmntVO;

public interface BoardService {
	int boardCount(BoardSearchVO boardSearchVO);
	List<BoardVO> boardList(BoardSearchVO boardSearchVO);
	long boardAdd(HttpServletRequest req, BoardVO boardVO);
	BoardVO boardView(BoardSearchVO boardSearchVO);
	long cmntAdd(CmntVO cmntVO);
	List<CmntVO> cmntList(CmntVO cmntVO);
	CmntVO cmntView(long cmnt_sno);
	boolean cmntMod(CmntVO cmntVO);
	boolean cmntDel(long cmnt_sno);
	
}
