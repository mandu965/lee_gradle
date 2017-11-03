package lee.domain;

import lombok.Data;

@Data
public class BoardVO {
	private long blt_rsrc_sno;
    private String bbs_title;
    private String bbs_contents;
    private long reg_usr_no;
    private long bbs_cnt;
    private long atch_file_sno;
	private String reg_date;
	private String del_yn;
	private long bbs_sno;
	private String ntc_yn;
	
	private String usr_nm;
	private String usr_id;
}
