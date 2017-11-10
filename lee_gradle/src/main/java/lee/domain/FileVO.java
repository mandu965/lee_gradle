package lee.domain;

import lombok.Data;

@Data
public class FileVO {
	private long file_sno;
	private long file_no;
	private String file_dsp_nm; // 저장할 파일
	private String file_kpn_nm; // 실제 파일
	private String file_estn_nm;
	private String kpn_url;
	private double file_sz_byte;
	private String reg_date;
	private String mod_date;
	private long reg_usr_no;
	private long mod_usr_no;
}
