package lee.login.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lee.domain.UsrVO;
import lee.login.dao.LoginMapper;
import lee.login.service.LoginService;

@Service("loginservice")
public class LoginServiceImpl implements LoginService{
	@Autowired
	LoginMapper loginMapper;
	
	public int checkId(String id) {
		return loginMapper.checkId(id);
	}
	
	public boolean checkPw(Map<String, String> params) {
		return loginMapper.checkPw(params) == 0 ? false : true;
	}
	
	public UsrVO getUsr(Map<String, String> params) {
		return loginMapper.getUsr(params);
	}
}
