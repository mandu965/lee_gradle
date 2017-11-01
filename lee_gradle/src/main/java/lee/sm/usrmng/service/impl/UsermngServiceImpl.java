package lee.sm.usrmng.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.sm.usrmng.dao.UsrmngMapper;
import lee.sm.usrmng.service.UsermngService;
import lee.sm.usrmng.service.UsrmngSearchVO;

@Service("usrmngService")
public class UsermngServiceImpl implements UsermngService{
	@Autowired
	UsrmngMapper usrmngMapper;
	
	public int usrmngCount(UsrmngSearchVO usrmngSearchVO) {
		return usrmngMapper.usrmngCount(usrmngSearchVO);
	}
	
	public List<UsrVO> usrmngList(UsrmngSearchVO usrmngSearchVO){
		return usrmngMapper.usrmngList(usrmngSearchVO);
	}
	
	public UsrVO getUsrInfo(long usr_no){
		return usrmngMapper.getUsrInfo(usr_no);
	}
	
	public boolean usrMod(UsrVO usrVO) {
		return usrmngMapper.usrMod(usrVO);
	}
	
}
