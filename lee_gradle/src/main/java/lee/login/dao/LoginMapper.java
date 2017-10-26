package lee.login.dao;

import java.util.Map;

public interface LoginMapper {

	int checkId(String id);
	int checkPw(Map<String, String> params);
}
