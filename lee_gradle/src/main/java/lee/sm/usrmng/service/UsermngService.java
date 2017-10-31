package lee.sm.usrmng.service;

import java.util.List;

import lee.domain.UsrVO;


public interface UsermngService {
	public int usrmngCount(UsrmngSearchVO usrmngSearchVO);
	public List<UsrVO> usrmngList(UsrmngSearchVO usrmngSearchVO);
}
