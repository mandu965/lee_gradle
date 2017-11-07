package lee.board.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.board.dao.BoardMapper;
import lee.board.service.BoardSearchVO;
import lee.board.service.BoardService;
import lee.comm.util.LoginManager;
import lee.domain.BoardVO;
import lee.domain.CmntVO;
import lee.domain.UsrVO;

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
	
	public long boardAdd(HttpServletRequest req, BoardVO boardVO) {
		boardVO.setReg_usr_no(LoginManager.getUsrNo(req));
		long inertRowCnt =boardMapper.boardAdd(boardVO); 
		return inertRowCnt == 0 ? 0 : boardVO.getBlt_rsrc_sno();
	}
	
	public BoardVO boardView(BoardSearchVO boardSearchVO) {
		return boardMapper.boardView(boardSearchVO);
	}
	
	public long cmntAdd(CmntVO cmntVO) {
		return boardMapper.cmntAdd(cmntVO);
	}
	
	public List<CmntVO> cmntList(CmntVO cmntVO){
		return boardMapper.cmntList(cmntVO);
	}
	
	public CmntVO cmntView(long cmnt_sno) {
		return boardMapper.cmntView(cmnt_sno);
	}
	
	public boolean cmntMod(CmntVO cmntVO) {
		return boardMapper.cmntMod(cmntVO);
	}
	
	public boolean cmntDel(long cmnt_sno) {
		return boardMapper.cmntDel(cmnt_sno);
	}
}
