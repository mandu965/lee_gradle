package lee.board.controller;

import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import lee.atchfile.service.AtchFileService;
import lee.board.service.BoardSearchVO;
import lee.board.service.BoardService;
import lee.comm.util.LoginManager;
import lee.comm.util.ReflectTest;
import lee.comm.util.XMLParserHandler;
import lee.comm.util.XmlExtraction_builder;
import lee.domain.BoardVO;
import lee.domain.CmntVO;
import lee.domain.FileVO;

@Controller
public class BoardController {
	
	@Resource(name="boardServiceImpl")
	BoardService boardService;
	
	@Resource(name="atchService")
	AtchFileService atchFileService;
	
	//게시판 에즈윅 에디터
	//https://summernote.org/
	
	//부트스트랩 참고
	//https://bootsnipp.com/?page=11
	@RequestMapping(value = "/board/**/boardList")
    public String boardList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) throws Exception {
		String jspPath =req.getRequestURI();
		/*
		 * 자바리플렉션
		ReflectTest test = new ReflectTest();
		try {
			test.objectAccessTest();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		/*
		 * 엑셀 데이터 추출  Builder 방식
		XmlExtraction test = new XmlExtraction();
		try {
			//test.getXmlData(new File("src/main/webapp/resources/sample/xmlTest.xml"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		
		//엑셀데이터 추출 Handler 방식
		/*
		File file = new File("src/main/webapp/resources/sample/xmlTest.xml");
		SAXParserFactory spf = SAXParserFactory.newInstance();
		spf.setFeature("http://xml.org/sax/features/external-general-entities", false);
        spf.setFeature("http://xml.org/sax/features/external-parameter-entities", false);
        spf.setFeature("http://apache.org/xml/features/nonvalidating/load-external-dtd", false);
        SAXParser sp = spf.newSAXParser();
        XMLParserHandler parserHandler = new XMLParserHandler();
        sp.parse(file, parserHandler);        // Start Parsi
        ArrayList<String> tagList = parserHandler.getTagList();
        */
		
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
		
		
		List<FileVO> atchFileList = atchFileService.fileList(boardVO.getAtch_file_sno());
		
		modelMap.put("atchFileList", atchFileList);
		modelMap.put("boardSearchVO", boardSearchVO);
		modelMap.put("boardVO", boardVO);
		
		return jspPath;
	}
	
	@RequestMapping(value = "/board/**/boardModPro", method = RequestMethod.POST)
    public @ResponseBody Map<String, String> boardModPro(HttpServletRequest req, @ModelAttribute("boardForm") BoardVO boardVO) {
		System.out.println("수정");
		Map<String, String> params = new HashMap<String, String>();
		boolean result = false;
		result=boardService.boardMod(req, boardVO);
		
		params.put("result", result+"");
		return params;
    }	
	
	@RequestMapping(value = "/board/**/boardMod")
    public String boardMod(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("boardSearchVO") BoardSearchVO boardSearchVO) {
		
		String jspPath =req.getRequestURI();
		BoardVO boardVO= boardService.boardView(boardSearchVO);
		List<FileVO> atchFileList = atchFileService.fileList(boardVO.getAtch_file_sno());
		modelMap.put("atchFileList", atchFileList);
		modelMap.put("boardSearchVO", boardSearchVO);
		modelMap.put("boardVO", boardVO);
		
		return jspPath;
	}	
	

	/** 코멘트 목록 */
	@RequestMapping(value="/comm/cmnt/cmntList", method= RequestMethod.POST) 
	public String cmntList(HttpServletRequest req,@ModelAttribute("cmntVO")CmntVO cmntVO ,ModelMap modelMap) throws Exception{
		String blt_rsrc_sno = req.getParameter("blt_rsrc_sno");
		String cmnt_contents = req.getParameter("cmnt_cntn");
		String gubun = req.getParameter("gubun");
		boolean addResult = false;
		cmntVO.setBlt_rsrc_sno(Long.parseLong(blt_rsrc_sno));
		
		if(cmnt_contents!=null && cmnt_contents.length()!=0 && gubun.equals("Add")){
			cmntVO.setCmnt_contents(cmnt_contents);
			cmntVO.setReg_usr_no(LoginManager.getUsrNo(req));
			long cmnt_sno=boardService.cmntAdd(cmntVO);
			if(cmnt_sno!=0)addResult=true;
		}

		List<CmntVO> cmntList=boardService.cmntList(cmntVO);
		
		modelMap.put("cmntList", cmntList);
		modelMap.put("loginUsrNo", LoginManager.getUsrNo(req));
		modelMap.put("addResult", addResult);
		
		return "comm/cmnt/cmntList";
	}
	
	/** 코멘트 수정화면 */
	@RequestMapping(value="/comm/cmnt/cmntMod", method= RequestMethod.POST) 
	public String cmntMod(HttpServletRequest req,@ModelAttribute("cmntVO")CmntVO cmntVO ,ModelMap modelMap) throws Exception{
		String cmnt_sno = req.getParameter("cmnt_sno");
		cmntVO = boardService.cmntView(Long.parseLong(cmnt_sno));
		modelMap.put("cmntVO", cmntVO);
		
		return "comm/cmnt/cmntMod";
	}
	
	/** 코멘트 수정 프로세스 */
	@RequestMapping(value="/comm/cmnt/cmntModPro", method= RequestMethod.POST) 
	public @ResponseBody Map<String, String> cmntModPro(HttpServletRequest req,@ModelAttribute("cmntVO")CmntVO cmntVO ,ModelMap modelMap) throws Exception{
		Map<String, String> params = new HashMap<String, String>();
		boolean result= boardService.cmntMod(cmntVO);
		params.put("result", result+"");
		return params;
	}
	
	/** 코멘트 삭제화면 */
	@RequestMapping(value="/comm/cmnt/cmntDel", method= RequestMethod.POST) 
	public String cmntDel(HttpServletRequest req,@ModelAttribute("cmntVO")CmntVO cmntVO ,ModelMap modelMap) throws Exception{
		String cmnt_sno = req.getParameter("cmnt_sno");
		
		modelMap.put("cmnt_sno", cmnt_sno);
		
		return "comm/cmnt/cmntDel";
	}
	
	/** 코멘트 삭제 */
	@RequestMapping(value="/comm/cmnt/cmntDelPro", method= RequestMethod.POST) 
	public @ResponseBody Map<String, String> cmntDelPro(HttpServletRequest req,@ModelAttribute("cmntVO")CmntVO cmntVO ,ModelMap modelMap) throws Exception{
		
		Map<String, String> params = new HashMap<String, String>();
		boolean result = boardService.cmntDel(cmntVO.getCmnt_sno());
		params.put("result", result+"");
		return params;
	}
	
}
