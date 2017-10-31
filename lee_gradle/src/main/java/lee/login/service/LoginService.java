package lee.login.service;

import java.util.Map;

import lee.domain.UsrVO;

public interface LoginService {
	
	public int checkId(String id);
	public boolean checkPw(Map<String, String> params);
	public UsrVO getUsr(Map<String, String> params);

}
