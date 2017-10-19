package lee.main.repository;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import lee.domain.UsrVO;

@Mapper
@Repository
public interface MainRepository {
	UsrVO getUsr();
}
