package lee.sm.usrmng.service;

import lee.domain.ListPagingVO;
import lombok.Data;

@Data
public class UsrmngSearchVO extends ListPagingVO{
	private String usr_nm;
	private String usr_addr;
	private String usr_id;

}
