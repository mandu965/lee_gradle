package lee.login.dao;

import java.util.Map;

import lee.domain.UsrVO;

public interface LoginMapper {

	int checkId(String id);
	int checkPw(Map<String, String> params);
	UsrVO getUsr(Map<String, String> params);
}
