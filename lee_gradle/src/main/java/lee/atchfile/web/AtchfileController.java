package lee.atchfile.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lee.atchfile.service.AtchFileService;
import lee.comm.util.LeeUtil;
import lee.domain.FileVO;

//@RestController
@Controller
public class AtchfileController {
	 private static String UPLOADED_FOLDER = "C:/Users/leejh/Desktop/file/";
	 
	 @Resource(name="atchService")
	AtchFileService atchFileService;
	 
	@RequestMapping(value = "/test")
    public String test(Model model) {
         
        return "test";
         
    }
	private JSONObject getSuccessMessage() {
	    JSONObject jsonObject = null;
	    try {
	      jsonObject = new JSONObject("{\"success\":true}");
	      //jsonObject.append(arg0, arg1);
	      System.out.println("json="+ jsonObject);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return jsonObject;
	  }
	
	private JSONObject getSuccessMessage(Map<String, String> params) {
	    JSONObject jsonObject = null;
	    try {
	      jsonObject = new JSONObject("{\"success\":true}");
	      jsonObject.put("fileVO", params);
	      System.out.println("json="+ jsonObject);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    return jsonObject;
	  }
	
	// implemented only for Fine Uploader
	@RequestMapping(value = "/upload/{qquuid}", method = { RequestMethod.DELETE })
	public @ResponseBody Object uploadDelete(HttpServletRequest request, @PathVariable("qquuid") String qquuid) {
		System.out.println("uploadDelete() called");
		String fileName = (String) request.getSession().getAttribute(qquuid);
		File file = new File(fileName);
		
		if(file.exists())file.delete();
		
		/*try {
			if (fileName != null) {
				Path path = Paths.get(UPLOADED_FOLDER + fileName);
				Files.delete(path);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		return getSuccessMessage().toString();
	}
	

	
	@RequestMapping(value = "/upload", method = { RequestMethod.POST })
	public @ResponseBody Object upload(@RequestParam("file") MultipartFile file, HttpServletRequest request) {
		System.out.println("upload() called");
		Map <String, String> params = new HashMap<String, String>();
		if (file.isEmpty()) {
			request.setAttribute("message", "Please select a file to upload");
			return "uploadStatus";
		}

		try {
			// for Fine Uploader delete functionality
			
			String qquuid = request.getParameter("qquuid");
			System.out.println("qquuid=" + qquuid);
			
			String file_kpn_nm= "";
			String kpn_url ="";

			if (qquuid != null) {
				
				
				file_kpn_nm= LeeUtil.getNumericName(UPLOADED_FOLDER, file.getOriginalFilename());
				kpn_url =LeeUtil.getTodayData() + "/";
				File dir = new File(UPLOADED_FOLDER+"/"+kpn_url);
				if(!dir.isDirectory())dir.mkdirs();
				File tmpFile = new File(UPLOADED_FOLDER + "/" + kpn_url + "/" +file_kpn_nm);
				
				file.transferTo(tmpFile);
				
				params.put("qquuid", qquuid);
				params.put("file_dsp_nm", file.getOriginalFilename());
				params.put("file_kpn_nm", file_kpn_nm);
				params.put("kpn_url", kpn_url);
				params.put("file_sz_byte", file.getSize()+"");
						
				request.getSession().setAttribute(qquuid, UPLOADED_FOLDER + "/" + kpn_url + "/" +file_kpn_nm);
			}
			// for Fine Uploader delete functionality ends
			//byte[] bytes = file.getBytes();
			
			//Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
			
			//System.out.println(UPLOADED_FOLDER + file.getOriginalFilename());
			//Files.write(path, bytes);

			//request.setAttribute("message", "You have successfully uploaded '" + file.getOriginalFilename() + "'");

		} catch (IOException e) {
			e.printStackTrace();
		}
		return getSuccessMessage(params).toString();
	}
	  
	
	/*
	@RequestMapping(value = "/test/file")
	@ResponseBody
    public String testIfle(MultipartHttpServletRequest multipartRequest) {
         System.out.println("@@@@@@");
         Iterator<String> itr =  multipartRequest.getFileNames();
         
         String filePath = "C:/Users/leejh/Desktop/file"; //설정파일로 뺀다.
          
         while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
              
              기존 주석처리
             MultipartFile mpf = multipartRequest.getFile(itr.next());
             String originFileName = mpf.getOriginalFilename();
             System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
             
              
             MultipartFile mpf = multipartRequest.getFile(itr.next());
       
             String originalFilename = mpf.getOriginalFilename(); //파일명
       
             String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
       
             try {
                 //파일 저장
                 mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                  
                 System.out.println("originalFilename => "+originalFilename);
                 System.out.println("fileFullPath => "+fileFullPath);
       
             } catch (Exception e) {
                 System.out.println("postTempFile_ERROR======>"+fileFullPath);
                 e.printStackTrace();
             }
                           
        }
        return "test";
         
    }*/
	/*
	@RequestMapping(value = "/fileUpload", method = RequestMethod.GET)
    public String dragAndDrop(Model model) {
         
        return "fileUpload";
         
    }
     
    @RequestMapping(value = "/fileUpload/post") //ajax에서 호출하는 부분
    @ResponseBody
    public String upload(MultipartHttpServletRequest multipartRequest) { //Multipart로 받는다.
          
        Iterator<String> itr =  multipartRequest.getFileNames();
         
        String filePath = "C:/Users/leejh/Desktop/file"; //설정파일로 뺀다.
         
        while (itr.hasNext()) { //받은 파일들을 모두 돌린다.
             
             기존 주석처리
            MultipartFile mpf = multipartRequest.getFile(itr.next());
            String originFileName = mpf.getOriginalFilename();
            System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
            
             
            MultipartFile mpf = multipartRequest.getFile(itr.next());
      
            String originalFilename = mpf.getOriginalFilename(); //파일명
      
            String fileFullPath = filePath+"/"+originalFilename; //파일 전체 경로
      
            try {
                //파일 저장
                mpf.transferTo(new File(fileFullPath)); //파일저장 실제로는 service에서 처리
                 
                System.out.println("originalFilename => "+originalFilename);
                System.out.println("fileFullPath => "+fileFullPath);
      
            } catch (Exception e) {
                System.out.println("postTempFile_ERROR======>"+fileFullPath);
                e.printStackTrace();
            }
                          
       }
          
        return "success";
    }*/
	
	/** 게시판 파일 다운로드 */
	@RequestMapping(value="/comm/attach/attachDown.do")
	public String attachBbsDown(HttpServletRequest req, HttpServletResponse res) throws Exception{
		
		InputStream is = null;
		BufferedOutputStream out = null;
		byte[] buffer = new byte[1024];
		long file_sno = LeeUtil.StringToLong(req.getParameter("file_sno"));
		long file_no = LeeUtil.StringToLong(req.getParameter("file_no"));
		try{
			//Map params = RequestUtil.getParameterMap(req, "atch_file_sno, atch_file_no", "");
			FileVO fileVO = atchFileService.fileView(file_sno, file_no);
			String filename = new String(fileVO.getFile_kpn_nm().getBytes("UTF-8"),"8859_1");
			
			File file = new File(UPLOADED_FOLDER + "/" + fileVO.getKpn_url() + "/" +fileVO.getFile_kpn_nm());
			
			if(file.exists()){
				is = new BufferedInputStream(new FileInputStream(file));
				res.setContentType("application/octet-stream");
				if (req.getHeader("User-Agent").indexOf("MSIE 5.5") > -1) {
					res.setHeader("Content-disposition", "filename="+URLEncoder.encode(fileVO.getFile_dsp_nm(),"UTF-8").replaceAll("\\+", "%20")+";");
				}else{
					res.setHeader("Content-disposition", "attachment;filename="+URLEncoder.encode(fileVO.getFile_dsp_nm(),"UTF-8").replaceAll("\\+", "%20")+";");
				}
				out = new BufferedOutputStream(res.getOutputStream());
				int read = 0;
				
				while(read != -1){
					read = is.read(buffer);
					if(read != -1){
						out.write(buffer, 0, read);
					}
				}
				out.flush(); 
				
				//attachService.attachDwn(params);
				
				//serviceService.fileRdnAdd(req, attachVO.getSvc_dman_cd(), attachVO.getSvc_sno(), "103");
				
				return null;
			}else
				return "/comm/attach/attachDownFail"; //TODO 다운로드 실패
		}catch(FileNotFoundException e){
			try{ if(is!=null) is.close(); }catch(IOException ignore){}
			try{ if(out!=null) out.close(); }catch(IOException ignore){}
			return "/comm/attach/attachDownFail"; //TODO 다운로드 실패
		}catch(IOException ie){
			try{ if(is!=null) is.close(); }catch(IOException ignore){}
			try{ if(out!=null) out.close(); }catch(IOException ignore){}
			return "/comm/attach/attachDownFail"; //TODO 다운로드 실패
		}catch(Exception ie){
			try{ if(is!=null) is.close(); }catch(IOException ignore){}
			try{ if(out!=null) out.close(); }catch(IOException ignore){}
			return "/comm/attach/attachDownFail"; //TODO 다운로드 실패
		}finally{
			try{ if(is!=null) is.close(); }catch(IOException ignore){}
			try{ if(out!=null) out.close(); }catch(IOException ignore){}
		}
	}
}
