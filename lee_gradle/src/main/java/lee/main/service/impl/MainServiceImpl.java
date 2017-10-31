package lee.main.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.main.dao.MainMapper;
import lee.main.service.MainService;

@Service("mainservice")
public class MainServiceImpl implements MainService{
	@Autowired
	MainMapper mainRepository;
	
	public UsrVO getUsr() {
		return mainRepository.getUsr();
	}
}
