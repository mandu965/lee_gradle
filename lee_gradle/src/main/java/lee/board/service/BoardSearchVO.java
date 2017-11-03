package lee.board.service;

import lee.domain.ListPagingVO;
import lombok.Data;

@Data
public class BoardSearchVO extends ListPagingVO{
	
	private String title;
	private String usr_id;
	private String usr_name;
	private long bbs_sno;

}
