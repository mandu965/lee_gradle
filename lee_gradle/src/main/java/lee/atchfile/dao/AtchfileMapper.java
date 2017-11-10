package lee.atchfile.dao;

import java.util.List;
import java.util.Map;

import lee.domain.FileVO;

public interface AtchfileMapper {
	long atchFileAdd(FileVO fileVO);
	List<FileVO> fileList(long file_sno);
	FileVO fileView(Map<String, Long> params);
}
