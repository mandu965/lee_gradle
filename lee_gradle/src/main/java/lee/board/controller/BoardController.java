package lee.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) {
		String jspPath =req.getRequestURI();
		   
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
		
		
		if(boardList!=null && boardList.size()>0){
			//노랑, 주황, 핑크, 연두, 하늘, 남색
			String mark_color[]={"#fcff00","#ffa700", "#ffa2b4", "#7bffb1", "#85fff8", "#937eff"};
			int mark_color_index=0;
			String kwd = boardSearchVO.getTitle();
			boolean kwd_exist= false;
			String[] sh_kwdList;
			if(kwd!=null && kwd.length()>0){
				kwd_exist = true;	
			}
			for(int i=0; i<boardList.size(); i++){
				if(boardList.get(i).getBbs_title()!=null){
					if(kwd_exist){
						sh_kwdList = kwd.split(" ");
						if(sh_kwdList.length>0){
							for(int j=0; j<sh_kwdList.length;j++){
								mark_color_index = j%6;
								boardList.get(i).setBbs_title(boardList.get(i).getBbs_title().replaceAll(sh_kwdList[j], "<mark style='background:"+mark_color[mark_color_index]+"'>"+sh_kwdList[j]+"</mark>"));
							}
						}
							
					}
				}
			}
			
		}
		
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
    public String boardAdd(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) {
		String jspPath =req.getRequestURI();
		modelMap.put("boardSearchVO", boardSearchVO);
		return jspPath;
	}
	
	@RequestMapping(value = "/board/**/boardAddPro", method = RequestMethod.POST)
    public @ResponseBody Map<String, String> boardAddPro(HttpServletRequest req, @ModelAttribute("boardForm") BoardVO boardVO) {
		System.out.println("#############################");
		Map<String, String> params = new HashMap<String, String>();
		long result = 0;
		result=boardService.boardAdd(req, boardVO);
		params.put("result", result+"");
		return params;
    }
	
	@RequestMapping(value = "/board/**/boardView")
    public String boardView(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) {
		String jspPath =req.getRequestURI();
		BoardVO boardVO= boardService.boardView(boardSearchVO);
		modelMap.put("boardSearchVO", boardSearchVO);
		modelMap.put("boardVO", boardVO);
		return jspPath;
	}
}
