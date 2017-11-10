package lee.atchfile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.atchfile.dao.AtchfileMapper;
import lee.atchfile.service.AtchFileService;
import lee.comm.util.LeeUtil;
import lee.comm.util.LoginManager;
import lee.domain.FileVO;

@Service("atchService")
public class AtchFileServiceImpl implements AtchFileService{
	
	@Autowired
	AtchfileMapper atchfileMapper;
	
	public long atchFileAdd(HttpServletRequest req, long file_sno) {
		//file Add
		
		String [] file_dsp_nm = req.getParameterValues("file_dsp_nm");
		String [] file_kpn_nm = req.getParameterValues("file_kpn_nm");
		String [] kpn_url = req.getParameterValues("kpn_url");
		String [] file_sz_byte = req.getParameterValues("file_sz_byte");
		
		FileVO fileVO = new FileVO();
		fileVO.setReg_usr_no(LoginManager.getUsrNo(req));
		
		long result = 0;
		
		try {
			for(int i=0; i<file_dsp_nm.length; i++) {
				fileVO.setFile_sno(file_sno);
				fileVO.setFile_dsp_nm(file_dsp_nm[i]);
				fileVO.setFile_kpn_nm(file_kpn_nm[i]);
				fileVO.setKpn_url(kpn_url[i]);
				fileVO.setFile_sz_byte(LeeUtil.StringToDouble(file_sz_byte[i]));
				fileVO.setFile_estn_nm(LeeUtil.getFileExtension(file_kpn_nm[i]));
				
				result=atchfileMapper.atchFileAdd(fileVO);
				if(file_sno==0) {
					file_sno = (result != 0 ? fileVO.getFile_sno() : 0);
				}	
			}
			
		}catch (NullPointerException e) {
		
		}

		return file_sno;
	}
	
	public List<FileVO> fileList(long file_sno){
		return atchfileMapper.fileList(file_sno);
	}
	
	public FileVO fileView(long file_sno, long file_no) {
		Map<String, Long> params = new HashMap<String, Long>();
		params.put("file_sno", file_sno);
		params.put("file_no", file_no);
		return atchfileMapper.fileView(params);
	}

}
