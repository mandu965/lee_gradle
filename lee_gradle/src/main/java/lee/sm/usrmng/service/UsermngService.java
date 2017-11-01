package lee.sm.usrmng.service;

import java.util.List;

import lee.domain.UsrVO;


public interface UsermngService {
	int usrmngCount(UsrmngSearchVO usrmngSearchVO);
	List<UsrVO> usrmngList(UsrmngSearchVO usrmngSearchVO);
	UsrVO getUsrInfo(long usr_no);
	boolean usrMod(UsrVO usrVO);
}
