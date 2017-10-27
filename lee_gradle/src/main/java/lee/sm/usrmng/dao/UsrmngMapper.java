package lee.sm.usrmng.dao;

import java.util.List;

import lee.domain.UsrVO;
import lee.sm.usrmng.service.UsrmngSearchVO;

public interface UsrmngMapper {
	int usrmngCount(UsrmngSearchVO usrmngSearchVO);
	List<UsrVO> usrmngList(UsrmngSearchVO usrmngSearchVO);
}
