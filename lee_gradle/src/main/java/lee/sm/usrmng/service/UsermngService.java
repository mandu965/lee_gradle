package lee.sm.usrmng.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.sm.usrmng.dao.UsrmngMapper;

@Service
public class UsermngService {
	
	@Autowired
	UsrmngMapper usrmngMapper;
	
	public int usrmngCount(UsrmngSearchVO usrmngSearchVO) {
		return usrmngMapper.usrmngCount(usrmngSearchVO);
	}
	
	public List<UsrVO> usrmngList(UsrmngSearchVO usrmngSearchVO){
		return usrmngMapper.usrmngList(usrmngSearchVO);
	}
}
