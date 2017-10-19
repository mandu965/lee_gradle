package lee.main.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import lee.domain.UserVO;

@Mapper
public interface MainRepository {
	UserVO getUser();
}
