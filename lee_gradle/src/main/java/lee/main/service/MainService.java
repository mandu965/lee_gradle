package lee.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.main.dao.MainMapper;

@Service
public class MainService {
	@Autowired
	MainMapper mainRepository;
	
	public UsrVO getUsr() {
		System.out.println("로직 테스트");
		return mainRepository.getUsr();
	}


}
