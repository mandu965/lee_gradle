package lee.board.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.board.dao.BoardMapper;
import lee.board.service.BoardSearchVO;
import lee.board.service.BoardService;
import lee.domain.BoardVO;
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
		
		System.out.println("@@@" + boardVO.getBbs_title());
		System.out.println("@@@" + boardVO.getBbs_contents());
		
		HttpSession session  = req.getSession(false);  
		UsrVO usrVO = null;
		try {
			usrVO = (UsrVO)session.getAttribute("usrSession");
			boardVO.setReg_usr_no(usrVO.getUsr_no());
		}catch (NullPointerException e) {
			boardVO.setReg_usr_no(0);
		}
		
		long inertRowCnt =boardMapper.boardAdd(boardVO); 
		return inertRowCnt == 0 ? 0 : boardVO.getBlt_rsrc_sno();
		
		//return boardMapper.boardAdd(boardVO);
	}
	
	public BoardVO boardView(BoardSearchVO boardSearchVO) {
		return boardMapper.boardView(boardSearchVO);
	}
}
