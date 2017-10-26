package lee.main.dao;

import lee.domain.UsrVO;

public interface MainMapper {
	UsrVO getUsr();
	long addUsr(UsrVO usrVO);
}

/// http://progtrend.blogspot.kr/2017/07/spring-boot-mybatis.html �