package lee.join.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.join.dao.JoinMapper;

@Service
public class JoinService {
	@Autowired
	JoinMapper joinMapper;
	
	public long addUsr(UsrVO usrVO) {
		long inertRowCnt =joinMapper.addUsr(usrVO); 
		return inertRowCnt == 0 ? 0 : usrVO.getUsr_no();
	}
}
