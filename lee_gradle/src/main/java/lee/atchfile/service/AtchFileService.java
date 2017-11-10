package lee.atchfile.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import lee.domain.FileVO;

public interface AtchFileService {

	long atchFileAdd(HttpServletRequest req, long file_sno);
	List<FileVO> fileList(long file_sno);
	FileVO fileView(long file_sno, long file_no);
}
