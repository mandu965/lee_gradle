package lee.main.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import lee.domain.UserVO;

@Mapper
@Repository
public interface MainRepository {
	UserVO getUser();
}
