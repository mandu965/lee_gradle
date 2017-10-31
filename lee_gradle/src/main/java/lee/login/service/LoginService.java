package lee.login.service;

import java.util.Map;

import lee.domain.UsrVO;

public interface LoginService {
	
	int checkId(String id);
	boolean checkPw(Map<String, String> params);
	UsrVO getUsr(Map<String, String> params);

}
