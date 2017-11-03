package lee.board.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lee.board.service.BoardSearchVO;
import lee.board.service.BoardService;
import lee.domain.BoardVO;

@Controller
public class BoardController {
	
	@Resource(name="boardServiceImpl")
	BoardService boardService;
	
	//게시판 에즈윅 에디터
	//https://summernote.org/
	
	//부트스트랩 참고
	//https://bootsnipp.com/?page=11
	@RequestMapping(value = "/board/**/boardList")
    public String boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearch") BoardSearchVO boardSearchVO) {
		String jspPath =req.getRequestURI();
		   
		//String jsp_path =uri.substring(0, uri.lastIndexOf("/")+1);
		///////paging : S//////////////////////////////
		
		int pageSize = boardSearchVO.getPageSize();// 한페이지에 나오는 게시물 개수
		int pageIndex = boardSearchVO.getPageIndex(); //현재 선택한 페이지 number
		int pageGroupSize = boardSearchVO.getPageGroupSize(); // 페이지 번호가 몇개 나오느냐 개수
		int startRow = (pageIndex - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = pageIndex * pageSize;// 한 페이지의 마지막 글번호

		boardSearchVO.setStartRow(startRow);
		boardSearchVO.setEndRow(endRow);
		int count = boardService.boardCount(boardSearchVO); //게시물 총 개수

		int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
		int nowPageGroup = (int) Math.ceil((double) pageIndex / pageGroupSize);
		
		List<BoardVO> boardList = boardService.boardList(boardSearchVO);
		
		modelMap.put("pageIndex", pageIndex);
		modelMap.put("pageSize", pageSize);
		modelMap.put("count", count);
		modelMap.put("pageGroupSize", pageGroupSize);
		modelMap.put("nowPageGroup", nowPageGroup);
		modelMap.put("pageGroupCount", pageGroupCount);
		modelMap.put("articleList", boardList);
		modelMap.put("boardSearchVO", boardSearchVO);
		
        return jspPath;
    }
	
	@RequestMapping(value = "/board/**/boardAdd")
    public String boardAdd(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearch") BoardSearchVO boardSearchVO) {
		String jspPath =req.getRequestURI();
		
		return jspPath;
	}
	
	@RequestMapping(value = "/test/test")
    public String test(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearch") BoardSearchVO boardSearchVO) {
		System.out.println("@@@@");
		
		return "test/test";
	}
}
