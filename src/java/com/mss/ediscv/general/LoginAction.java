package com.mss.ediscv.general;
import com.mss.ediscv.tpOnboarding.TpOnboardingBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.mss.ediscv.util.AppConstants;
import com.mss.ediscv.util.ConnectionProvider;
import com.mss.ediscv.util.DateUtility;
import com.mss.ediscv.util.PasswordUtil;
import com.mss.ediscv.util.Properties;
import com.mss.ediscv.util.ServiceLocator;
import com.mss.ediscv.util.ServiceLocatorException;
import com.opensymphony.xwork2.ActionSupport;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.List;
import org.apache.log4j.Logger;

public class LoginAction extends ActionSupport implements ServletRequestAware {
	private static Logger logger = Logger.getLogger(LoginAction.class.getName());
	private String resultType = SUCCESS;
	private HttpServletRequest httpServletRequest;
	private String loginId;
	private String password;
	private String changeDb;
        private List partnerNameList;
    
        public String tpoLoginCheck() throws Exception {
        resultType = LOGIN;
        HttpSession tpoUserSession = httpServletRequest.getSession(true);
        UserInfoBean userInfoBean = null;
      TpOnboardingBean tpOnboardingBean=null;
        try {
            userInfoBean = ServiceLocator.getGeneralService().tpLoginCheck(getLoginId().trim().toLowerCase());
            if (userInfoBean != null) {
                String decryptedPwd = PasswordUtil.decryptPwd(userInfoBean.getPwd().trim());
                if (getLoginId().equalsIgnoreCase(userInfoBean.getLoginId()) && getPassword().equalsIgnoreCase(decryptedPwd)) {
                    tpoUserSession.setAttribute(AppConstants.TPO_LOGIN_ID, userInfoBean.getLoginId());
                    tpoUserSession.setAttribute(AppConstants.TPO_PARTNER_ID, userInfoBean.getPartnerId());
                    tpoUserSession.setAttribute(AppConstants.TPO_PARTNER_NAME, userInfoBean.getPartnerName());
                    tpoUserSession.setAttribute(AppConstants.TPO_CONTACT_NAME, userInfoBean.getContactName());
                    tpoUserSession.setAttribute(AppConstants.TPO_COUNTRY, userInfoBean.getCountry());
                    tpoUserSession.setAttribute(AppConstants.TPO_EMAIL, userInfoBean.getContactEmail());
                    tpoUserSession.setAttribute(AppConstants.TPO_PHONE_NO, userInfoBean.getPhoneNo());
                    tpoUserSession.setAttribute(AppConstants.TPO_USERID, userInfoBean.getUserId());
                     //tpoUserSession.setAttribute(AppConstants.TPO_PARTNER_NAME,tpOnboardingBean.getPartnerName());
                    resultType = SUCCESS;
                } else {
                    httpServletRequest.setAttribute(AppConstants.REQ_ERROR_INFO, "<span class=\"resultFailure\">Please Login with valid UserId and Password! </span>");
                    resultType = "input";
                }
            } else {
                httpServletRequest.setAttribute(AppConstants.REQ_ERROR_INFO, "<span class=\"resultFailure\">Please Login with valid UserId and Password! </span>");
                resultType = "input";
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            resultType = "error";
        }
        return resultType;
    }
	
public void logUserAccess() throws Exception {
        try{
            //System.err.println("in log user access");
                if(getHttpServletRequest().getSession(false).getAttribute(AppConstants.SES_LOGIN_ID) != null){
                    String UserId=getHttpServletRequest().getSession(false).getAttribute(AppConstants.SES_LOGIN_ID).toString();
                    String forwarded = httpServletRequest.getHeader("X-FORWARDED-FOR");
                    String via = httpServletRequest.getHeader("VIA");
                    String remote = httpServletRequest.getRemoteAddr();
                    String agent = httpServletRequest.getHeader("User-Agent");
                    String location = httpServletRequest.getLocalAddr();
                  
                    Timestamp accessedtime=DateUtility.getInstance().getCurrentDB2Timestamp();
                    Connection connection=null;
                    Statement stmt=null;
                    ResultSet resultSet=null;
                    boolean isInserted=false;
                    String query = null;
                    try{
                        connection = ConnectionProvider.getInstance().getConnection();
                        query = "insert into LOGUSERACCESS(LoginId,X_FORWARDED_FOR1,VIA, REMOTE_ADDR,User_Agent,DateAccessed)"
                                + " values('"+UserId+"','"+forwarded+"','"+via+"','"+remote+"','"+agent+"','"+accessedtime+"')";
                    stmt=connection.createStatement();
                        int x = stmt.executeUpdate(query);
                        stmt.close();
                        if(x>0){
                            isInserted=true;
                        }
                    }catch(SQLException sql){
                        sql.printStackTrace();
                        throw new ServiceLocatorException(sql);
                    }finally{
                        try{
                            if(stmt!=null){
                                stmt.close();
                                stmt = null;
                            }
                            if(connection!=null){
                                connection.close();
                                connection = null;
                            }
                        }catch(SQLException sqle){
                            throw new ServiceLocatorException(sqle);
                        }
                    }
                    
                 
            }
        }catch(Exception ex){
            //List errorMsgList = ExceptionToListUtility.errorMessages(ex);
            ex.printStackTrace();
            getHttpServletRequest().getSession(false).setAttribute("errorMessage",ex.toString());
            resultType =  ERROR;
        }
        //   return resultType;
    }
	/**
	 * method is used to invalidate session
	 */

	public String switchDB() throws Exception {
		logger.info("Entered into the ::::LoginAction :::: switchDB()");

		HttpSession userSession = httpServletRequest.getSession(false);

		String db = userSession.getAttribute(AppConstants.SES_FIRST_DB)
				.toString();
		if (db.startsWith("Ar")) {
			userSession.setAttribute(AppConstants.PROP_CURRENT_DS_NAME,
					Properties.getProperty(AppConstants.PROP_PROD_DS_NAME));
			userSession.setAttribute(AppConstants.SES_FIRST_DB,
					"Production Data");
		} else {
			userSession.setAttribute(AppConstants.PROP_CURRENT_DS_NAME,
					Properties.getProperty(AppConstants.PROP_ARCH_DS_NAME));
			userSession.setAttribute(AppConstants.SES_FIRST_DB, "Archive Data");
		}
		logger.info("End of ::::LoginAction :::: switchDB()");
		return "success";

	}

	  public String doLogout() throws Exception {
        logger.info("Entered into the ::::LoginAction :::: doLogout()");
        try {
            if (httpServletRequest.getSession(false) != null) {
                httpServletRequest.getSession(false).invalidate();
            }
            setResultType(SUCCESS);
        } catch (Exception ex) {
            // List errorMsgList = ExceptionToListUtility.errorMessages(ex);
            httpServletRequest.getSession(false).setAttribute(
                    AppConstants.REQ_ERROR_INFO, ex.toString());

            setResultType(ERROR);
        }
        logger.info("End of ::::LoginAction :::: doLogout()");
        return getResultType();
    }// end of the doLogout method

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.struts2.interceptor.ServletRequestAware#setServletRequest(
	 * javax.servlet.http.HttpServletRequest)
	 */
	//@Override
	public void setServletRequest(HttpServletRequest reqObj) {
		this.setHttpServletRequest(reqObj);
	}

	/**
	 * @param resultType
	 *            the resultType to set
	 */
	public void setResultType(String resultType) {
		this.resultType = resultType;
	}

	/**
	 * @return the resultType
	 */
	public String getResultType() {
		return resultType;
	}

	/**
	 * @param httpServletRequest
	 *            the httpServletRequest to set
	 */
	public void setHttpServletRequest(HttpServletRequest httpServletRequest) {
		this.httpServletRequest = httpServletRequest;
	}

	/**
	 * @return the httpServletRequest
	 */
	public HttpServletRequest getHttpServletRequest() {
		return httpServletRequest;
	}


	/**
	 * @param loginId
	 *            the loginId to set
	 */
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	/**
	 * @return the loginId
	 */
	public String getLoginId() {
		return loginId;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param changeDb
	 *            the changeDb to set
	 */
	public void setChangeDb(String changeDb) {
		this.changeDb = changeDb;
	}

	/**
	 * @return the changeDb
	 */
	public String getChangeDb() {
		return changeDb;
	}

    public List getPartnerNameList() {
        return partnerNameList;
    }

    public void setPartnerNameList(List partnerNameList) {
        this.partnerNameList = partnerNameList;
    }
        
}
