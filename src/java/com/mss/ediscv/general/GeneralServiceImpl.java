package com.mss.ediscv.general;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.apache.log4j.Logger;
import com.mss.ediscv.util.ConnectionProvider;
import com.mss.ediscv.util.DataSourceDataProvider;
import com.mss.ediscv.util.ServiceLocatorException;

public class GeneralServiceImpl implements GeneralService {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;
    private static Logger logger = Logger.getLogger(GeneralServiceImpl.class.getName());

    /**
     * constructor of GeneralServiceIml
     */
    public GeneralServiceImpl() {
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.bcbsm.edi.general.GeneralService#getUserInfo(java.lang.String)
     */
    //@Override
    public UserInfoBean tpLoginCheck(String loginId) throws ServiceLocatorException {
        UserInfoBean userInfoBean = null;
        String tpoLoginQuery = "SELECT ID,LOGINID, PASSWORD, PARTNER_ID, NAME, EMAIL, PHONE_NO, COUNTRY, LAST_LOGIN_TS, LAST_LOGOUT_TS FROM TPO_USER WHERE LOGINID=?";
        System.out.println("tpoLoginQuery------" + tpoLoginQuery);
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            preparedStatement = connection.prepareStatement(tpoLoginQuery);
            preparedStatement.setString(1, loginId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                userInfoBean = new UserInfoBean();
                userInfoBean.setUserId(resultSet.getInt("ID"));
                userInfoBean.setLoginId(resultSet.getString("LOGINID"));
                userInfoBean.setPwd(resultSet.getString("PASSWORD"));
                userInfoBean.setPartnerId(resultSet.getInt("PARTNER_ID"));
                if((resultSet.getInt("ID")) == 1000){
                    userInfoBean.setPartnerName("TPO_ADMIN");
                }else{
                    userInfoBean.setPartnerName(DataSourceDataProvider.getInstance().getTpoPartnerName(resultSet.getInt("PARTNER_ID")));
                }
                userInfoBean.setContactName(resultSet.getString("NAME"));
                userInfoBean.setContactEmail(resultSet.getString("EMAIL"));
                userInfoBean.setPhoneNo(resultSet.getString("PHONE_NO"));
                userInfoBean.setCountry(resultSet.getString("COUNTRY"));
                userInfoBean.setLastLoginTS(resultSet.getTimestamp("LAST_LOGIN_TS"));
                userInfoBean.setLastLogoutTS(resultSet.getTimestamp("LAST_LOGOUT_TS"));
            }
        } catch (Exception ex) {
            throw new ServiceLocatorException(ex);
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                    resultSet = null;
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                    preparedStatement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException sqle) {
                throw new ServiceLocatorException(sqle);
            }
            logger.info("End of ::::GeneralServiceImpl :::: getUserInfo()");
            System.out.println("user info-->" + userInfoBean);
        }
        return userInfoBean;
    }
    /*
     * (non-Javadoc)
     * 
     * @see com.bcbsm.edi.general.GeneralService#getUserRoles(int)
     */
    //@Override
}
