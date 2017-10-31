package lee.join.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.join.dao.JoinMapper;
import lee.join.service.JoinService;

@Service("joinservice")
public class JoinServiceImpl implements JoinService{
	@Autowired
	JoinMapper joinMapper;
	
	public long addUsr(UsrVO usrVO) {
		long inertRowCnt =joinMapper.addUsr(usrVO); 
		return inertRowCnt == 0 ? 0 : usrVO.getUsr_no();
	}
}
