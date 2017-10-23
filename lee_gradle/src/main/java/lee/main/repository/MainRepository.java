package lee.main.repository;

import org.apache.ibatis.annotations.Mapper;

import lee.domain.UsrVO;

@Mapper
public interface MainRepository {
	UsrVO getUsr();
}

/// http://progtrend.blogspot.kr/2017/07/spring-boot-mybatis.html ÀÐ±â