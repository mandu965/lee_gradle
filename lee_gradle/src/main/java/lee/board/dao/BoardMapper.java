package lee.board.dao;

import java.util.List;

import lee.board.service.BoardSearchVO;
import lee.domain.BoardVO;
import lee.domain.CmntVO;

public interface BoardMapper {
	int boardCount(BoardSearchVO boardSearchVO);
	List<BoardVO> boardList(BoardSearchVO boardSearchVO);
	long boardAdd(BoardVO boardVO);
	BoardVO boardView(BoardSearchVO boardSearchVO);
	long cmntAdd(CmntVO cmntVO);
	List<CmntVO> cmntList(CmntVO cmntVO);
	CmntVO cmntView(long cmnt_sno);
	boolean cmntMod(CmntVO cmntVO);
	boolean cmntDel(long cmnt_sno);
}
