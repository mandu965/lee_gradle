package lee.board.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.atchfile.service.AtchFileService;
import lee.board.dao.BoardMapper;
import lee.board.service.BoardSearchVO;
import lee.board.service.BoardService;
import lee.comm.util.LoginManager;
import lee.domain.BoardVO;
import lee.domain.CmntVO;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;
	
	@Resource(name="atchService")
	AtchFileService atchFileService;
	
	public int boardCount(BoardSearchVO boardSearchVO) {
		return boardMapper.boardCount(boardSearchVO);
	}
	public List<BoardVO> boardList(BoardSearchVO boardSearchVO){
		return boardMapper.boardList(boardSearchVO);
	}
	
	public long boardAdd(HttpServletRequest req, BoardVO boardVO) {
		boardVO.setReg_usr_no(LoginManager.getUsrNo(req));
		long atch_file_sno = 0;
		
		atch_file_sno = atchFileService.atchFileAdd(req, atch_file_sno);
		boardVO.setAtch_file_sno(atch_file_sno);
		
		long inertRowCnt =boardMapper.boardAdd(boardVO); 
		return inertRowCnt == 0 ? 0 : boardVO.getBlt_rsrc_sno();
	}
	
	public BoardVO boardView(BoardSearchVO boardSearchVO) {
		return boardMapper.boardView(boardSearchVO);
	}
	
	public boolean boardMod(HttpServletRequest req, BoardVO boardVO) {
		long atch_file_sno = boardVO.getAtch_file_sno();
		
		
		if(boardVO.getDel_file_no()!=null) {
			atchFileService.delFile(atch_file_sno, boardVO.getDel_file_no());
		}
		atch_file_sno = atchFileService.atchFileAdd(req, atch_file_sno);
		boardVO.setAtch_file_sno(atch_file_sno);
		
		return boardMapper.boardMod(boardVO);
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
