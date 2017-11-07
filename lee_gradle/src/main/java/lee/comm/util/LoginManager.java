package lee.comm.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import lee.comm.conf.LeeCode;
import lee.domain.UsrVO;

public class LoginManager {
	public static long getUsrNo(HttpServletRequest req) {
		HttpSession session  = req.getSession(false);  
		UsrVO usrVO = null;
		try {
			usrVO = (UsrVO)session.getAttribute(LeeCode.usrSession);
			return usrVO.getUsr_no();
		}catch (NullPointerException e) {
			return 0;
		}
	}

}
