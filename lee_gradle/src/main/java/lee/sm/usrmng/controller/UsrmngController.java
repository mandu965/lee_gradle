package lee.sm.usrmng.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lee.domain.UsrVO;
import lee.sm.usrmng.service.UsermngService;
import lee.sm.usrmng.service.UsrmngSearchVO;

@Controller
public class UsrmngController {
	
	@Autowired
	UsermngService usermngService;
	
	@RequestMapping(value = "/sm/usrmng/usrmngList", method = RequestMethod.GET)
    public String usrmngList(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("usrmngSearchVO") UsrmngSearchVO usrmngSearchVO) {
		String uri =req.getRequestURI();
	///////paging : S//////////////////////////////
		
		int pageSize = usrmngSearchVO.getPageSize();// 한페이지에 나오는 게시물 개수
		int pageIndex = usrmngSearchVO.getPageIndex(); //현재 선택한 페이지 number
		int pageGroupSize = usrmngSearchVO.getPageGroupSize(); // 페이지 번호가 몇개 나오느냐 개수
		

		int startRow = (pageIndex - 1) * pageSize + 1;// 한 페이지의 시작글 번호
		int endRow = pageIndex * pageSize;// 한 페이지의 마지막 글번호
		
		
		System.out.println("pageIndex====" + pageIndex);
		System.out.println("pageSize====" + pageSize);
		System.out.println("pageGroupSize====" + pageGroupSize);
		
		System.out.println("startRow====" + startRow);
		System.out.println("endRow====" + endRow);
		System.out.println("usrmngSearchVO====" + usrmngSearchVO);
		
		usrmngSearchVO.setStartRow(startRow);
		usrmngSearchVO.setEndRow(endRow);
		int count = usermngService.usrmngCount(usrmngSearchVO); //게시물 총 개수
		System.out.println("count====" + count);
		// 페이지그룹의 갯수
		// ex) pageGroupSize가 3일 경우 '[1][2][3]'가 pageGroupCount 개 만큼 있다.
		//총 개시물 개수 /    한페이지당 나올 게시물 개수 * 페이지그룹 size + (게시물 /pageSize * pageGroupSize 에 나머지가 있다면 +1해준다)
		int pageGroupCount = count / (pageSize * pageGroupSize) + (count % (pageSize * pageGroupSize) == 0 ? 0 : 1);
		//                 = 1    /         10*3               +   12   % (10*3) = 0 ? 0: 1     
		
		System.out.println("pageGroupCount====" + pageGroupCount);

		// 페이지 그룹 번호
		// ex) pageGroupSize가 3일 경우 '[1][2][3]'의 페이지그룹번호는 1 이고 '[2][3][4]'의
		// 페이지그룹번호는 2 이다.
		int nowPageGroup = (int) Math.ceil((double) pageIndex / pageGroupSize);
		System.out.println("nowPageGroup====" + nowPageGroup);
		
		
		List<UsrVO> usrmngList = usermngService.usrmngList(usrmngSearchVO);
		
		modelMap.put("pageIndex", pageIndex);
		modelMap.put("pageSize", pageSize);
		modelMap.put("count", count);
		modelMap.put("pageGroupSize", pageGroupSize);
		modelMap.put("nowPageGroup", nowPageGroup);
		modelMap.put("pageGroupCount", pageGroupCount);
		modelMap.put("articleList", usrmngList);
			
        return "/sm/usrmng/usrmngList";
    }
	
	@RequestMapping(value = "/sm/usrmng/modal/usrForm", method = RequestMethod.GET)
    public String usrFrom(HttpServletRequest req, ModelMap modelMap, @ModelAttribute("usrmngSearchVO") UsrmngSearchVO usrmngSearchVO) {
		return "/sm/usrmng/modal/usrForm";
	}
}
