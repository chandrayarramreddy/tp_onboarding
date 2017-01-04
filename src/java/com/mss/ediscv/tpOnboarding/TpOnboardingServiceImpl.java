 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.ediscv.tpOnboarding;

import com.mss.ediscv.util.AppConstants;
import com.mss.ediscv.util.ConnectionProvider;
import com.mss.ediscv.util.DateUtility;
import com.mss.ediscv.util.MailManager;
import com.mss.ediscv.util.PasswordUtil;
import com.mss.ediscv.util.ServiceLocatorException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;

/**
 * @author raja
 */
public class TpOnboardingServiceImpl implements TpOnboardingService {

    Connection connection = null;
    PreparedStatement preparedStatement = null;
    Statement statement = null;
    ResultSet resultSet = null;
    CallableStatement callableStatement = null;
    String responseString = null;
    Map mp;
    TpOnboardingBean tpOnboardingBean = null;
    private ArrayList<TpOnboardingBean> tpoSearchProfileList;
    private HttpServletRequest httpServletRequest;

    public String tpoREGISTER(TpOnboardingAction tpAction) throws ServiceLocatorException {
        int istpoUserInserted = 0;
        String email = tpAction.getRegcontactEmail();
        PasswordUtil passwordUtil = new PasswordUtil();
        String generatedPassword = passwordUtil.encryptPwd(tpAction.getRegpassword());
        String loginId = email.substring(0, email.indexOf("@")).toLowerCase();
        Timestamp curdate = DateUtility.getInstance().getCurrentDB2Timestamp();
        String createdBy = tpAction.getCreated_by();
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            String tpoRegisterQuery = "INSERT INTO MSCVP.TPO_USER(LOGINID, PASSWORD, PARTNER_ID, NAME, EMAIL, PHONE_NO, COUNTRY,"
                    + " LAST_LOGIN_TS, LAST_LOGOUT_TS, CREATED_BY, CREATED_TS)"
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(tpoRegisterQuery);
            preparedStatement.setString(1, loginId);
            preparedStatement.setString(2, generatedPassword);
            preparedStatement.setInt(3, tpAction.getRegpartnerId());
            preparedStatement.setString(4, tpAction.getRegcontactName());
            preparedStatement.setString(5, email);
            preparedStatement.setString(6, tpAction.getRegphoneNo());
            preparedStatement.setString(7, tpAction.getRegcountry());
            preparedStatement.setTimestamp(8, curdate);
            preparedStatement.setTimestamp(9, curdate);
            preparedStatement.setString(10, createdBy);
            preparedStatement.setTimestamp(11, curdate);
            istpoUserInserted = istpoUserInserted + preparedStatement.executeUpdate();
            if (istpoUserInserted > 0) {
                MailManager.tpoUserIdPwd(tpAction.getRegcontactName(), tpAction.getRegpartnerName(), tpAction.getRegcontactEmail(), loginId, passwordUtil.decryptPwd(generatedPassword));
            }
            responseString = "<font color='green'>Register successfully</font>";
        } catch (Exception e) {
            responseString = "<font color='red'>Please try again!</font>";
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                    preparedStatement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException se) {
                se.printStackTrace();
                throw new ServiceLocatorException(se);
            }
        }
        return responseString;
    }

    public TpOnboardingBean getPartnerInfo(int partnerId, String loginId) throws ServiceLocatorException {
        try {
            tpOnboardingBean = new TpOnboardingBean();
            connection = ConnectionProvider.getInstance().getConnection();
            String partnerInfoQuery = "SELECT NAME, PHONE_NO, ADDRESS, CITY, STATE, COUNTRY, ZIPCODE, CREATED_BY, CREATED_TS, TP_FLAG FROM MSCVP.TPO_PARTNERS WHERE ID=?";
            preparedStatement = connection.prepareStatement(partnerInfoQuery);
            preparedStatement.setInt(1, partnerId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                tpOnboardingBean.setPartnerName(resultSet.getString("NAME"));
                tpOnboardingBean.setPhoneNo(resultSet.getString("PHONE_NO"));
                tpOnboardingBean.setAddress1(resultSet.getString("ADDRESS"));
                tpOnboardingBean.setCity(resultSet.getString("CITY"));
                tpOnboardingBean.setState(resultSet.getString("STATE"));
                tpOnboardingBean.setCountry(resultSet.getString("COUNTRY"));
                tpOnboardingBean.setZipCode(resultSet.getString("ZIPCODE"));

            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
        }
        return tpOnboardingBean;
    }

    public String updatePartnerInfo(TpOnboardingAction tpAction, String loginId, int partnerId) throws ServiceLocatorException {
        int istpoPartnerUpdated = 0;
        Timestamp curdate = DateUtility.getInstance().getCurrentDB2Timestamp();
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            String updateTpoUserQuery = ("UPDATE MSCVP.TPO_PARTNERS SET PHONE_NO = ?,ADDRESS = ?,CITY = ?,STATE = ?,"
                    + "COUNTRY = ?,ZIPCODE = ?,MODIFIED_BY = ?,MODIFIED_TS = ? WHERE ID =?");
            preparedStatement = connection.prepareStatement(updateTpoUserQuery);
            preparedStatement.setString(1, tpAction.getPhoneNo());
            preparedStatement.setString(2, tpAction.getAddress1());
            preparedStatement.setString(3, tpAction.getCity());
            preparedStatement.setString(4, tpAction.getState());
            preparedStatement.setString(5, tpAction.getCountry());
            preparedStatement.setString(6, tpAction.getZipCode());
            preparedStatement.setString(7, loginId);
            preparedStatement.setTimestamp(8, curdate);
            preparedStatement.setInt(9, partnerId);
            istpoPartnerUpdated = istpoPartnerUpdated + preparedStatement.executeUpdate();
            if (istpoPartnerUpdated > 0) {
                responseString = "<font color='green'>Partner updated successfully</font>";
            } else {
                responseString = "<font color='red'>Please try again!</font>";
            }
        } catch (Exception e) {
            responseString = "<font color='red'>Please try again!</font>";
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                    preparedStatement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException se) {
                se.printStackTrace();
                throw new ServiceLocatorException(se);
            }
        }
        return responseString;
    }

    public TpOnboardingBean getTpoDetails(String loginId) throws ServiceLocatorException {
        try {
            int partnerId = 0;
            tpOnboardingBean = new TpOnboardingBean();
            connection = ConnectionProvider.getInstance().getConnection();
            String partnerIdQuery = "SELECT max(ID) as partnerId FROM MSCVP.TPO_USER WHERE LOGINID ='" + loginId + "'";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(partnerIdQuery);
            if (resultSet.next()) {
                partnerId = resultSet.getInt("partnerId");
            }

            String partnerInfoQuery = "SELECT PARTNER_ID,PARTNER_NAME,CONTACT_NAME,EMAIL,PHONE_NO,ADDRESS,CITY,STATE,COUNTRY,ZIP_CODE"
                    + " FROM MSCVP.TPO_ONBOARDINGINFO WHERE PARTNER_ID = ?";
            preparedStatement = connection.prepareStatement(partnerInfoQuery);
            preparedStatement.setInt(1, partnerId);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                tpOnboardingBean.setUserId(resultSet.getInt("PARTNER_ID"));
                tpOnboardingBean.setPartnerName(resultSet.getString("PARTNER_NAME"));
                tpOnboardingBean.setContactName(resultSet.getString("CONTACT_NAME"));
                tpOnboardingBean.setContactEmail(resultSet.getString("EMAIL"));
                tpOnboardingBean.setPhoneNo(resultSet.getString("PHONE_NO"));
                tpOnboardingBean.setAddress1(resultSet.getString("ADDRESS"));
                tpOnboardingBean.setCity(resultSet.getString("CITY"));
                tpOnboardingBean.setState(resultSet.getString("STATE"));
                tpOnboardingBean.setCountry(resultSet.getString("COUNTRY"));
                tpOnboardingBean.setZipCode(resultSet.getString("ZIP_CODE"));

            }
        } catch (Exception ex) {
            ex.printStackTrace();
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
        }
        return tpOnboardingBean;
    }

    /* addTP actions */
    public String addTpProfile(int partnerId,String partnerName,TpOnboardingAction tpAction) throws ServiceLocatorException {
        int isPartCommInserted = 0;
        int isProtocolInserted = 0;
        int isProtocolinsertNoNeed = 0;
        int isEnevelopInserted = 0;
        Timestamp curdate = DateUtility.getInstance().getCurrentDB2Timestamp();
        try {
            int communicationId = 0;
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.createStatement();
            // partnerId = (Integer) httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_PARTNER_ID);
             //   partnerName=httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_PARTNER_NAME).toString();
                System.out.println("partnerName-------"+partnerName);
             System.out.println("partnerId----------  "+partnerId);
//            String partnerIdQuery = "SELECT max(ID) AS partnerId FROM MSCVP.TPO_USER WHERE PARTNER_NAME ='" + tpAction.getPartnerName() + "' ";
//            resultSet = statement.executeQuery(partnerIdQuery);
//            if (resultSet.next()) {
//                partnerId = resultSet.getInt("partnerId");
//            }

            String addTpoUserQuery = "INSERT INTO MSCVP.TPO_COMMUNICATION(PARTNER_ID, PARTNER_NAME, PROTOCOL, TRANSFER_MODE, TP_FLAG, CREATED_BY, CREATED_TS) "
                    + "VALUES(?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(addTpoUserQuery);
            preparedStatement.setInt(1, partnerId);
            preparedStatement.setString(2, partnerName);
            preparedStatement.setString(3, tpAction.getCommnProtocol());
            if (("AS2".equalsIgnoreCase(tpAction.getCommnProtocol())) || ("SMTP".equalsIgnoreCase(tpAction.getCommnProtocol()))) {
                preparedStatement.setString(4, "");
            } else {
                preparedStatement.setString(4, tpAction.getTransferMode());
            }
            preparedStatement.setString(5,"N");
            preparedStatement.setString(6, tpAction.getCreated_by());
            preparedStatement.setTimestamp(7, curdate);
            isPartCommInserted = isPartCommInserted + preparedStatement.executeUpdate();
           String partnerIdQuery = "SELECT max(ID) AS communicationId FROM MSCVP.TPO_COMMUNICATION WHERE PARTNER_ID ="+partnerId;
            resultSet = statement.executeQuery(partnerIdQuery);
            if (resultSet.next()) {
                communicationId = resultSet.getInt("communicationId");
                System.out.println("communicationId----------  "+communicationId);
            }
            if ((isPartCommInserted > 0) && tpAction.getCommnProtocol().equals("FTP") && tpAction.getTransferMode().equals("put")) {
                
                String ftpInsertQuery = "INSERT INTO MSCVP.TPO_FTP(COMMUNICATION_ID, PARTNER_ID, TRANSFER_MODE, SSL_FLAG, FTP_METHOD, RECEIVING_PROTOCOL,"
                        + " FTP_HOST, FTP_PORT, FTP_USER_ID, FTP_PASSWORD, FTP_DIRECTORY, CONNECTION_METHOD, RESPONSE_TIMEOUT_SEC, TP_FLAG, CREATED_BY,"
                        + " CREATED_TS) VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
//                String ftpInsertQuery = "INSERT INTO MSCVP.TPO_FTP (PARTNER_ID, PARTNER_NAME, FTP_METHOD, RECEIVING_PROTOCOL, "
//                        + "FTP_HOST, FTP_PORT, FTP_USER_ID, FTP_PASSWORD, FTP_DIRECTORY, "
//                        + "CONNECTION_METHOD, RESPONSE_TIMEOUT_SEC, TRANSFER_MODE, CREATED_BY, CREATED_TS, SSL_FLAG) "
//                        + "VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                preparedStatement = connection.prepareStatement(ftpInsertQuery);
                preparedStatement.setInt(1, communicationId);
                preparedStatement.setInt(2, partnerId);
                preparedStatement.setString(3, tpAction.getTransferMode());
                preparedStatement.setString(4, tpAction.getFtp_ssl_req());
                preparedStatement.setString(5, tpAction.getFtp_method());
                preparedStatement.setString(6, tpAction.getFtp_recv_protocol());
                preparedStatement.setString(7, tpAction.getFtp_host());
                preparedStatement.setString(8, tpAction.getFtp_port());
                preparedStatement.setString(9, tpAction.getFtp_userId());
                preparedStatement.setString(10, tpAction.getFtp_pwd());
                preparedStatement.setString(11, tpAction.getFtp_directory());
                preparedStatement.setString(12, tpAction.getFtp_conn_method());
                preparedStatement.setInt(13, tpAction.getFtp_resp_time());
                preparedStatement.setString(14, "N");
                preparedStatement.setString(15, tpAction.getContactName());
                preparedStatement.setTimestamp(16, curdate);
                isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                if ((isProtocolInserted > 0) && ("true".equalsIgnoreCase(tpAction.getFtp_ssl_req()))) {
                    String insertQuery = "INSERT INTO MSCVP.TPO_SSL(COMMUNICATION_ID, PARTNER_ID, TRANSFER_MODE, PROTOCOL, SSL_PRIORITY,"
                            + " CIPHER_STRENGTH, CA_CERTIFICATES, TP_FLAG, CREATED_BY, CREATED_TS) VALUES(?,?,?,?,?,?,?,?,?,?)";
//                    String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY, "
//                            + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID, TRANSFER_MODE)"
//                            + "VALUES(?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(insertQuery);
                    preparedStatement.setInt(1, communicationId);
                preparedStatement.setInt(2, partnerId);
                preparedStatement.setString(3, tpAction.getTransferMode());
                    preparedStatement.setString(4, "FTP");
                    preparedStatement.setString(5, tpAction.getSsl_priority2());
                    preparedStatement.setString(6, tpAction.getSsl_cipher_stergth2());
                    preparedStatement.setString(7, tpAction.getCertGroups());
                    preparedStatement.setString(8, "N");
                    preparedStatement.setString(9, tpAction.getContactName());
                    preparedStatement.setTimestamp(10, curdate);
                    preparedStatement.executeUpdate();
                }
            }
            
            /*else if ((isPartCommInserted > 0) && tpAction.getCommnProtocol().equals("AS2")) {
                
                    String as2InsertQuery = "INSERT INTO MSCVP.TPO_AS2(ID, COMMUNICATION_ID, PARTNER_ID, TRANSFER_MODE, SSL_FLAG, DWL_MY_SYS_CERT,"
                            + " UPL_YOUR_SYS_CERT, MY_ORG, YOUR_ORG, MY_PART_PRO_NAME, YOUR_PART_PRO_NAME, MY_END_POINT, YOUR_END_POINT, "
                            + "STR_AS2_MSG_IN, WAIT_FOR_SYNC_MDN_PROC, TP_FLAG, CREATED_BY, CREATED_TS) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

                preparedStatement = connection.prepareStatement(as2InsertQuery);
                preparedStatement.setInt(1, partnerId);
                preparedStatement.setString(2, tpAction.getAs2_myOrgName());
                preparedStatement.setString(3, tpAction.getAs2_partOrgName());
                preparedStatement.setString(4, tpAction.getAs2_myPartname());
                preparedStatement.setString(5, tpAction.getAs2_yourPartname());
                preparedStatement.setString(6, tpAction.getAs2_myEndPoint());
                preparedStatement.setString(7, tpAction.getAs2_partendpoint());
                preparedStatement.setString(8, tpAction.getAs2_strMsg());
                preparedStatement.setString(9, tpAction.getAs2_waitForSync());
                preparedStatement.setString(10, tpAction.getContactName());
                preparedStatement.setTimestamp(11, DateUtility.getInstance().getCurrentDB2Timestamp());
                preparedStatement.setString(12, tpAction.getFilepath());
                preparedStatement.setString(13, tpAction.getAs2_ssl_req());
                preparedStatement.setString(14, tpAction.getAs2_payloadSendMode());
                isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                if ((isProtocolInserted > 0) && ("true".equalsIgnoreCase(tpAction.getAs2_ssl_req()))) {
                    String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                            + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID, TRANSFER_MODE)"
                            + "VALUES(?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1, tpAction.getCommnProtocol());
                    preparedStatement.setString(2, tpAction.getSsl_priority2());
                    preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                    preparedStatement.setString(4, tpAction.getCertGroups());
                    preparedStatement.setString(5, tpAction.getContactName());
                    preparedStatement.setTimestamp(6, curdate);
                    preparedStatement.setInt(7, partnerId);
                    preparedStatement.setString(8, tpAction.getTransferMode());
                    preparedStatement.executeUpdate();
                }
            } else if ((isPartCommInserted > 0) && tpAction.getCommnProtocol().equals("HTTP") && tpAction.getTransferMode().equals("get")) {
                String httpInsertQuery = "INSERT INTO MSCVP.TPO_HTTP(PARTNER_ID,RECEIVING_PROTOCOL, "
                        + "HTTP_END_POINT, HTTP_MODE, RESPONSE_TIMEOUT_SEC, HTTP_PORT, SSL_FLAG, TRANSFER_MODE, "
                        + "CREATED_BY, CREATED_TS, URL) "
                        + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                preparedStatement = connection.prepareStatement(httpInsertQuery);
                preparedStatement.setInt(1, partnerId);
                preparedStatement.setString(2, tpAction.getHttp_recv_protocol());
                preparedStatement.setString(3, tpAction.getHttp_endpoint());
                preparedStatement.setString(4, tpAction.getHttp_protocol_mode());
                preparedStatement.setInt(5, Integer.parseInt(tpAction.getHttp_resp_time()));
                preparedStatement.setInt(6, Integer.parseInt(tpAction.getHttp_port()));
                preparedStatement.setString(7, tpAction.getHttp_ssl_req());
                preparedStatement.setString(8, tpAction.getTransferMode());
                preparedStatement.setString(9, tpAction.getContactName());
                preparedStatement.setTimestamp(10, DateUtility.getInstance().getCurrentDB2Timestamp());
                preparedStatement.setString(11, tpAction.getHttp_url());
                isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                if ((isProtocolInserted > 0) && ("true".equalsIgnoreCase(tpAction.getHttp_ssl_req()))) {
                    String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                            + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID, TRANSFER_MODE)"
                            + "VALUES(?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(insertQuery);
                    preparedStatement.setString(1, tpAction.getCommnProtocol());
                    preparedStatement.setString(2, tpAction.getSsl_priority2());
                    preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                    preparedStatement.setString(4, tpAction.getCertGroups());
                    preparedStatement.setString(5, tpAction.getContactName());
                    preparedStatement.setTimestamp(6, curdate);
                    preparedStatement.setInt(7, partnerId);
                    preparedStatement.setString(8, tpAction.getTransferMode());
                    preparedStatement.executeUpdate();
                }
            } else if ((isPartCommInserted > 0) && tpAction.getCommnProtocol().equals("SFTP") && tpAction.getTransferMode().equals("put")) {
                String sftpInsertQuery = "INSERT INTO MSCVP.TPO_SFTP(PARTNER_ID, CONN_METHOD, MY_SSH_PUB_KEY, UPL_YOUR_SSH_PUB_KEY,"
                        + " REMOTE_HOST_IP_ADD, REMOTE_USERID, METHOD, AUTH_METHOD, REMOTE_PORT, REMOTE_PWD, DIRECTORY, TRANSFER_MODE,"
                        + " CREATED_BY, CREATED_TS)"
                        + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                preparedStatement = connection.prepareStatement(sftpInsertQuery);
                preparedStatement.setInt(1, partnerId);
                preparedStatement.setString(2, tpAction.getSftp_conn_method());
                preparedStatement.setString(3, tpAction.getSftp_public_key());
                preparedStatement.setString(4, tpAction.getFilepath());
                preparedStatement.setString(5, tpAction.getSftp_host_ip());
                preparedStatement.setString(6, tpAction.getSftp_remote_userId());
                preparedStatement.setString(7, tpAction.getSftp_method());
                preparedStatement.setString(8, tpAction.getSftp_auth_method());
                preparedStatement.setString(9, tpAction.getSftp_remote_port());
                preparedStatement.setString(10, tpAction.getSftp_remote_pwd());
                preparedStatement.setString(11, tpAction.getSftp_directory());
                preparedStatement.setString(12, tpAction.getTransferMode());
                preparedStatement.setString(13, tpAction.getContactName());
                preparedStatement.setTimestamp(14, DateUtility.getInstance().getCurrentDB2Timestamp());
                isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
            } else if ((isPartCommInserted > 0) && tpAction.getCommnProtocol().equals("SMTP")) {
                String smtpInsertQuery = "INSERT INTO MSCVP.TPO_SMTP (PARTNER_ID,RECEIVING_PROTOCOL, SMTP_SERVER_PORT,"
                        + "  TO_EMAIL_ADDRESS, SMTP_SERVER_HOST, FROM_EMAIL_ADDRESS, CREATED_BY, "
                        + "CREATED_TS)"
                        + "VALUES(?,?,?,?,?,?,?,?)";
                preparedStatement = connection.prepareStatement(smtpInsertQuery);
                preparedStatement.setInt(1, partnerId);
                preparedStatement.setString(2, tpAction.getSmtp_recv_protocol());
                preparedStatement.setInt(3, Integer.parseInt(tpAction.getSmtp_server_port()));
                preparedStatement.setString(4, tpAction.getSmtp_to_email());
                preparedStatement.setString(5, tpAction.getSmtp_server_protocol());
                preparedStatement.setString(6, tpAction.getSmtp_from_email());
                preparedStatement.setString(7, tpAction.getContactName());
                preparedStatement.setTimestamp(8, DateUtility.getInstance().getCurrentDB2Timestamp());
                isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
            } */else {
                isProtocolinsertNoNeed = 1;
            }
//          if ((isProtocolInserted > 0) || (isProtocolinsertNoNeed > 0)) {
//                String envelopsInsertQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
//                        + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
//                        + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
//                        + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
//                        + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
//
//                String allTransactions = "";
//                if (tpAction.isIb850() == true) {
//                    allTransactions = allTransactions + tpAction.getIB850Transaction() + "#";
//                }
//                if (tpAction.isIb855() == true) {
//                    allTransactions = allTransactions + tpAction.getIB855Transaction() + "#";
//                }
//                if (tpAction.isIb856() == true) {
//                    allTransactions = allTransactions + tpAction.getIB856Transaction() + "#";
//                }
//                if (tpAction.isIb810() == true) {
//                    allTransactions = allTransactions + tpAction.getIB810Transaction() + "#";
//                }
//                if (tpAction.isOb850() == true) {
//                    allTransactions = allTransactions + tpAction.getOB850Transaction() + "#";
//                }
//                if (tpAction.isOb855() == true) {
//                    allTransactions = allTransactions + tpAction.getOB855Transaction() + "#";
//                }
//                if (tpAction.isOb856() == true) {
//                    allTransactions = allTransactions + tpAction.getOB856Transaction() + "#";
//                }
//                if (tpAction.isOb810() == true) {
//                    allTransactions = allTransactions + tpAction.getOB810Transaction() + "#";
//                }
//
//                if ((tpAction.isIb850() == true) || (tpAction.isIb855() == true) || (tpAction.isIb856() == true) || (tpAction.isIb810() == true) || (tpAction.isOb850() == true) || (tpAction.isOb855() == true) || (tpAction.isOb856() == true) || (tpAction.isOb810() == true)) {
//                    String transactionsSplit[] = allTransactions.substring(0, allTransactions.length() - 1).split(Pattern.quote("#"));
//
//                    for (int i = 0; i < transactionsSplit.length; i++) {
//                        String envelopData[] = transactionsSplit[i].substring(0, transactionsSplit[i].length()).split(Pattern.quote("@"));
//                        preparedStatement = connection.prepareStatement(envelopsInsertQuery);
//                        preparedStatement.setInt(1, partnerId);
//                        preparedStatement.setString(2, tpAction.getCommnProtocol());
//                        preparedStatement.setString(3, envelopData[0]);
//                        preparedStatement.setString(4, envelopData[1]);
//                        preparedStatement.setString(5, envelopData[2]);
//                        preparedStatement.setString(6, envelopData[3]);
//                        preparedStatement.setString(7, envelopData[4]);
//                        preparedStatement.setString(8, envelopData[5]);
//                        preparedStatement.setString(9, envelopData[6]);
//                        preparedStatement.setString(10, envelopData[7]);
//                        preparedStatement.setString(11, envelopData[8]);
//                        preparedStatement.setString(12, envelopData[9]);
//                        preparedStatement.setString(13, envelopData[10]);
//                        preparedStatement.setString(14, envelopData[11]);
//                        preparedStatement.setString(15, envelopData[12]);
//                        preparedStatement.setString(16, envelopData[13]);
//                        preparedStatement.setString(17, envelopData[14]);
//                        preparedStatement.setString(18, tpAction.getContactName());
//                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
//                        isEnevelopInserted = isEnevelopInserted + preparedStatement.executeUpdate();
//                    }
//                }
//
//            }
//            mp = tpAction.getMap();
            System.out.println("(isTpoUserInserted-->" + isPartCommInserted + ")  && (isProtocolInserted-->" + isProtocolInserted + " || isProtocolinsertNoNeed-->" + isProtocolinsertNoNeed + ")");
            if ((isPartCommInserted > 0) && ((isProtocolInserted > 0) || (isProtocolinsertNoNeed > 0))) {
                System.out.println("inside");
                responseString = "<font color='green'>Inserted successfully</font>";
//                System.out.println("partnerId:" + partnerId + " PartnerName:" + tpAction.getPartnerName() + " ContactName:" + tpAction.getContactName() + " ContactEmail:" + tpAction.getContactEmail());
//                System.out.println("PhoneNo:" + tpAction.getPhoneNo() + " Country:" + tpAction.getCountry() + " Protocol:" + tpAction.getCommnProtocol() + " TransferMode:" + tpAction.getTransferMode());
//                System.out.println("Filepath:" + tpAction.getFilepath() + " Ib850:" + tpAction.isIb850() + " Ib855:" + tpAction.isIb855() + " Ib856:" + tpAction.isIb856() + " Ib810:" + tpAction.isIb810());
//                System.out.println("Ob850:" + tpAction.isOb850() + " Ob855:" + tpAction.isOb855() + " Ob856:" + tpAction.isOb856() + " Ob810:" + tpAction.isOb810() + " Insert");
//                MailManager.tpoDetails(partnerId, tpAction.getPartnerName(), tpAction.getContactName(), tpAction.getContactEmail(),
//                        tpAction.getPhoneNo(), tpAction.getCountry(), tpAction.getCommnProtocol(), tpAction.getTransferMode(),
//                        tpAction.getFilepath(), tpAction.getCertGroups(), mp, tpAction.isIb850(), tpAction.isIb855(), tpAction.isIb856(), tpAction.isIb810(),
//                        tpAction.isOb850(), tpAction.isOb855(), tpAction.isOb856(), tpAction.isOb810(), "Insert");
            } else {
                responseString = "<font color='red'>Please try again!</font>";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                    callableStatement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException se) {
                throw new ServiceLocatorException(se);
            }
        }
        return responseString;
    }

    public String updateTPO(TpOnboardingAction tpAction) throws ServiceLocatorException {
        int isTpoUserUpdated = 0;
        int isProtocolUpdated = 0;
        int isProtocolInserted = 0;
        int isProtocolinsertOrUpdateNoNeed = 0;
        int isEnvelopeUpdated = 0;
        int isEnvelopeInserted = 0;
        Timestamp curdate = DateUtility.getInstance().getCurrentDB2Timestamp();
        try {
            int partnerId = 0;
            int ftpIsExisted = 0;
            int as2IsExisted = 0;
            int smtpIsExisted = 0;
            int httpIsExisted = 0;
            int sftpIsExisted = 0;

            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.createStatement();

            String partnerIdQuery = "SELECT max(ID) AS partnerId FROM MSCVP.TPO_USER WHERE PARTNER_NAME = '" + tpAction.getPartnerName() + "' ";
            resultSet = statement.executeQuery(partnerIdQuery);
            if (resultSet.next()) {
                partnerId = resultSet.getInt("partnerId");
            }

            String updateTpoUserQuery = ("UPDATE MSCVP.TPO_ONBOARDINGINFO SET PARTNER_NAME = ?,CONTACT_NAME = ?,EMAIL = ?,PHONE_NO = ?,"
                    + "ADDRESS = ?,CITY = ?,STATE = ?,COUNTRY = ?,ZIP_CODE = ?,PROTOCOL = ?,TRANSFER_MODE = ?,MODIFIED_BY = ?,"
                    + "MODIFIED_TS = ?,TP_FLAG=? WHERE PARTNER_ID = ?");
            preparedStatement = connection.prepareStatement(updateTpoUserQuery);
            preparedStatement.setString(1, tpAction.getPartnerName());
            preparedStatement.setString(2, tpAction.getContactName());
            preparedStatement.setString(3, tpAction.getContactEmail());
            preparedStatement.setString(4, tpAction.getPhoneNo());
            preparedStatement.setString(5, tpAction.getAddress1());
            preparedStatement.setString(6, tpAction.getCity());
            preparedStatement.setString(7, tpAction.getState());
            preparedStatement.setString(8, tpAction.getCountry());
            preparedStatement.setString(9, tpAction.getZipCode());
            preparedStatement.setString(10, tpAction.getCommnProtocol());
            if (("AS2".equalsIgnoreCase(tpAction.getCommnProtocol())) || ("SMTP".equalsIgnoreCase(tpAction.getCommnProtocol()))) {
                preparedStatement.setString(11, "");
            } else {
                preparedStatement.setString(11, tpAction.getTransferMode());
            }
            preparedStatement.setString(12, tpAction.getContactName());
            preparedStatement.setTimestamp(13, curdate);
            preparedStatement.setString(14, "N");
            preparedStatement.setInt(15, partnerId);
            isTpoUserUpdated = isTpoUserUpdated + preparedStatement.executeUpdate();
            if ((isTpoUserUpdated > 0) && tpAction.getCommnProtocol().equals("FTP") && tpAction.getTransferMode().equals("put")) {
                String ftpIsExistedQuery = "SELECT count(ID) AS count FROM MSCVP.TPO_FTP where PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(ftpIsExistedQuery);
                if (resultSet.next()) {
                    ftpIsExisted = resultSet.getInt("count");
                }

                if (ftpIsExisted > 0) {
                    String ftpUpdateQuery = ("UPDATE MSCVP.TPO_FTP SET PARTNER_NAME = ?,FTP_METHOD = ?,RECEIVING_PROTOCOL = ?,FTP_HOST = ?,"
                            + "FTP_PORT = ?,FTP_USER_ID = ?,FTP_PASSWORD = ?,FTP_DIRECTORY = ?,CONNECTION_METHOD = ?,RESPONSE_TIMEOUT_SEC =?,"
                            + "TRANSFER_MODE = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,SSL_FLAG=? WHERE PARTNER_ID = ?");
                    preparedStatement = connection.prepareStatement(ftpUpdateQuery);
                    preparedStatement.setString(1, tpAction.getPartnerName());
                    preparedStatement.setString(2, tpAction.getFtp_method());
                    preparedStatement.setString(3, tpAction.getFtp_recv_protocol());
                    preparedStatement.setString(4, tpAction.getFtp_host());
                    preparedStatement.setString(5, tpAction.getFtp_port());
                    preparedStatement.setString(6, tpAction.getFtp_userId());
                    preparedStatement.setString(7, tpAction.getFtp_pwd());
                    preparedStatement.setString(8, tpAction.getFtp_directory());
                    preparedStatement.setString(9, tpAction.getFtp_conn_method());
                    preparedStatement.setInt(10, tpAction.getFtp_resp_time());
                    preparedStatement.setString(11, tpAction.getTransferMode());
                    preparedStatement.setString(12, tpAction.getContactName());
                    preparedStatement.setTimestamp(13, curdate);
                    preparedStatement.setString(14, tpAction.getFtp_ssl_req());
                    preparedStatement.setInt(15, partnerId);
                    isProtocolUpdated = isProtocolUpdated + preparedStatement.executeUpdate();
                    if ((isProtocolUpdated > 0) && ("true".equalsIgnoreCase(tpAction.getFtp_ssl_req()))) {
                        String selectQuery = "SELECT count(ID)  FROM MSCVP.TPO_SSL where PARTNER_ID=? and PROTOCOL=?";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        resultSet = preparedStatement.executeQuery();
                        while (resultSet.next()) {
                            System.out.println("resultSet.getInt(1)-->" + resultSet.getInt(1));
                            if (resultSet.getInt(1) > 0) {
                                System.out.println("abcd");
                                System.out.println("tpAction.getSsl_priority2()-->" + tpAction.getSsl_priority2());
                                System.out.println("tpAction.getSsl_cipher_stergth2()-->" + tpAction.getSsl_cipher_stergth2());
                                String insertQuery = "Update MSCVP.TPO_SSL set PROTOCOL=?, SSL_PRIORITY=?, "
                                        + " CIPHER_STRENGTH=?,CA_CERTIFICATES=?, MODIFIED_BY=?, MODIFIED_TS=?,TRANSFER_MODE=? where PARTNER_ID=?";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "FTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setString(7, tpAction.getTransferMode());
                                preparedStatement.setInt(8, partnerId);
                                preparedStatement.executeUpdate();
                            } else {
                                String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                                        + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID,TRANSFER_MODE)"
                                        + "VALUES(?,?,?,?,?,?,?,?)";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "FTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.setString(8, tpAction.getTransferMode());
                                preparedStatement.executeUpdate();
                            }
                        }
                    }
                } else {
                    String ftpInsertQuery = "INSERT INTO MSCVP.TPO_FTP (PARTNER_ID, PARTNER_NAME, FTP_METHOD, RECEIVING_PROTOCOL, "
                            + "FTP_HOST, FTP_PORT, FTP_USER_ID, FTP_PASSWORD, FTP_DIRECTORY, "
                            + "CONNECTION_METHOD, RESPONSE_TIMEOUT_SEC, TRANSFER_MODE, CREATED_BY, SSL_FLAG) "
                            + "VALUES  (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(ftpInsertQuery);
                    preparedStatement.setInt(1, partnerId);
                    preparedStatement.setString(2, tpAction.getPartnerName());
                    preparedStatement.setString(3, tpAction.getFtp_method());
                    preparedStatement.setString(4, tpAction.getFtp_recv_protocol());
                    preparedStatement.setString(5, tpAction.getFtp_host());
                    preparedStatement.setString(6, tpAction.getFtp_port());
                    preparedStatement.setString(7, tpAction.getFtp_userId());
                    preparedStatement.setString(8, tpAction.getFtp_pwd());
                    preparedStatement.setString(9, tpAction.getFtp_directory());
                    preparedStatement.setString(10, tpAction.getFtp_conn_method());
                    preparedStatement.setInt(11, tpAction.getFtp_resp_time());
                    preparedStatement.setString(12, tpAction.getTransferMode());
                    preparedStatement.setString(13, tpAction.getContactName());
                    preparedStatement.setString(14, tpAction.getFtp_ssl_req());
                    isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                    if ((isProtocolInserted > 0) && ("true".equalsIgnoreCase(tpAction.getFtp_ssl_req()))) {
                        String selectQuery = "SELECT count(ID)  FROM MSCVP.TPO_SSL where PARTNER_ID=? and PROTOCOL=?";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        resultSet = preparedStatement.executeQuery();
                        while (resultSet.next()) {
                            if (resultSet.getInt(1) > 0) {
                                String insertQuery = "Update MSCVP.TPO_SSL set PROTOCOL=?, SSL_PRIORITY=?, "
                                        + " CIPHER_STRENGTH=?,CA_CERTIFICATES=?,MODIFIED_BY=?, MODIFIED_TS=?,TRANSFER_MODE=? where PARTNER_ID=?";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "FTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setString(7, tpAction.getTransferMode());
                                preparedStatement.setInt(8, partnerId);
                                preparedStatement.executeUpdate();
                            } else {
                                String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                                        + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID,TRANSFER_MODE)"
                                        + "VALUES(?,?,?,?,?,?,?,?)";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "FTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.setString(8, tpAction.getTransferMode());
                                preparedStatement.executeUpdate();
                            }
                        }
                    }
                }
            } else if ((isTpoUserUpdated > 0) && tpAction.getCommnProtocol().equals("AS2")) {
                String as2IsExistedQuery = "SELECT count(ID) AS as2_details FROM MSCVP.TPO_AS2 where PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(as2IsExistedQuery);
                if (resultSet.next()) {
                    as2IsExisted = resultSet.getInt("as2_details");
                }
                if (as2IsExisted > 0) {
                    String as2UpdateQuery = ("UPDATE MSCVP.TPO_AS2 SET MY_ORG = ?,YOUR_ORG = ?,"
                            + "MY_PART_PRO_NAME = ?,YOUR_PART_PRO_NAME = ?,MY_END_POINT = ?,YOUR_END_POINT = ?,STR_AS2_MSG_IN = ?,"
                            + "WAIT_FOR_SYNC_MDN_PROC = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,UPL_YOUR_SYS_CERT=?,SSL_FLAG=?,TRANSFER_MODE=? WHERE PARTNER_ID = ?");
                    preparedStatement = connection.prepareStatement(as2UpdateQuery);
                    preparedStatement.setString(1, tpAction.getAs2_myOrgName());
                    preparedStatement.setString(2, tpAction.getAs2_partOrgName());
                    preparedStatement.setString(3, tpAction.getAs2_myPartname());
                    preparedStatement.setString(4, tpAction.getAs2_yourPartname());
                    preparedStatement.setString(5, tpAction.getAs2_myEndPoint());
                    preparedStatement.setString(6, tpAction.getAs2_partendpoint());
                    preparedStatement.setString(7, tpAction.getAs2_strMsg());
                    preparedStatement.setString(8, tpAction.getAs2_waitForSync());
                    preparedStatement.setString(9, tpAction.getContactName());
                    preparedStatement.setTimestamp(10, curdate);
                    preparedStatement.setString(11, tpAction.getFilepath());
                    preparedStatement.setString(12, tpAction.getAs2_ssl_req());
                    preparedStatement.setString(13, tpAction.getAs2_payloadSendMode());
                    preparedStatement.setInt(14, partnerId);
                    isProtocolUpdated = isProtocolUpdated + preparedStatement.executeUpdate();
                    if ((isProtocolUpdated > 0) && ("true".equalsIgnoreCase(tpAction.getAs2_ssl_req()))) {
                        String selectQuery = "SELECT count(ID)  FROM MSCVP.TPO_SSL where PARTNER_ID=? and PROTOCOL=?";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        resultSet = preparedStatement.executeQuery();
                        while (resultSet.next()) {
                            if (resultSet.getInt(1) > 0) {
                                String insertQuery = "Update MSCVP.TPO_SSL set PROTOCOL=?, SSL_PRIORITY=?,"
                                        + " CIPHER_STRENGTH=?,CA_CERTIFICATES=?, MODIFIED_BY=?, MODIFIED_TS=? where PARTNER_ID=?";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "AS2");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.executeUpdate();
                            } else {
                                String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                                        + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID)"
                                        + "VALUES(?,?,?,?,?,?,?)";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "AS2");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.executeUpdate();
                            }
                        }
                    }
                } else {
                    String as2InsertQuery = "INSERT INTO MSCVP.TPO_AS2(PARTNER_ID,MY_ORG,"
                            + " YOUR_ORG, MY_PART_PRO_NAME, YOUR_PART_PRO_NAME, MY_END_POINT, YOUR_END_POINT, STR_AS2_MSG_IN, "
                            + "WAIT_FOR_SYNC_MDN_PROC, CREATED_BY, CREATED_TS,UPL_YOUR_SYS_CERT,SSL_FLAG,TRANSFER_MODE) "
                            + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(as2InsertQuery);
                    preparedStatement.setInt(1, partnerId);
                    preparedStatement.setString(2, tpAction.getAs2_myOrgName());
                    preparedStatement.setString(3, tpAction.getAs2_partOrgName());
                    preparedStatement.setString(4, tpAction.getAs2_myPartname());
                    preparedStatement.setString(5, tpAction.getAs2_yourPartname());
                    preparedStatement.setString(6, tpAction.getAs2_myEndPoint());
                    preparedStatement.setString(7, tpAction.getAs2_partendpoint());
                    preparedStatement.setString(8, tpAction.getAs2_strMsg());
                    preparedStatement.setString(9, tpAction.getAs2_waitForSync());
                    preparedStatement.setString(10, tpAction.getContactName());
                    preparedStatement.setTimestamp(11, DateUtility.getInstance().getCurrentDB2Timestamp());
                    preparedStatement.setString(12, tpAction.getFilepath());
                    preparedStatement.setString(13, tpAction.getAs2_ssl_req());
                    preparedStatement.setString(14, tpAction.getAs2_payloadSendMode());
                    isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                    if ((isProtocolInserted > 0) && ("true".equalsIgnoreCase(tpAction.getAs2_ssl_req()))) {
                        String selectQuery = "SELECT count(ID)  FROM MSCVP.TPO_SSL where PARTNER_ID=? and PROTOCOL=?";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        resultSet = preparedStatement.executeQuery();
                        while (resultSet.next()) {
                            if (resultSet.getInt(1) > 0) {
                                String insertQuery = "Update MSCVP.TPO_SSL set PROTOCOL=?, SSL_PRIORITY=?, "
                                        + " CIPHER_STRENGTH=?,CA_CERTIFICATES=?, MODIFIED_BY=?, MODIFIED_TS=? where PARTNER_ID=?";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "AS2");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.executeUpdate();
                            } else {
                                String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                                        + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID)"
                                        + "VALUES(?,?,?,?,?,?,?)";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "AS2");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.executeUpdate();
                            }
                        }
                    }
                }
            } else if ((isTpoUserUpdated > 0) && tpAction.getCommnProtocol().equals("HTTP") && tpAction.getTransferMode().equals("get")) {
                String httpIsExistedQuery = "SELECT count(ID) AS httpProtocal FROM MSCVP.TPO_HTTP where PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(httpIsExistedQuery);
                if (resultSet.next()) {
                    httpIsExisted = resultSet.getInt("httpProtocal");
                }
                if (httpIsExisted > 0) {
                    String httpUpdateQuery = ("UPDATE MSCVP.TPO_HTTP SET RECEIVING_PROTOCOL = ?,HTTP_END_POINT = ?,HTTP_MODE = ?,"
                            + "RESPONSE_TIMEOUT_SEC = ?,HTTP_PORT = ?,TRANSFER_MODE = ?,MODIFIED_BY = ?,MODIFIED_TS =?,SSL_FLAG=?, URL=? WHERE PARTNER_ID = ?");
                    preparedStatement = connection.prepareStatement(httpUpdateQuery);
                    preparedStatement.setString(1, tpAction.getHttp_recv_protocol());
                    preparedStatement.setString(2, tpAction.getHttp_endpoint());
                    preparedStatement.setString(3, tpAction.getHttp_protocol_mode());
                    preparedStatement.setInt(4, Integer.parseInt(tpAction.getHttp_resp_time()));
                    preparedStatement.setInt(5, Integer.parseInt(tpAction.getHttp_port()));
                    preparedStatement.setString(6, tpAction.getTransferMode());
                    preparedStatement.setString(7, tpAction.getContactName());
                    preparedStatement.setTimestamp(8, curdate);
                    preparedStatement.setString(9, tpAction.getHttp_ssl_req());
                    preparedStatement.setString(10, tpAction.getHttp_url());
                    preparedStatement.setInt(11, partnerId);
                    isProtocolUpdated = isProtocolUpdated + preparedStatement.executeUpdate();

                    if ((isProtocolUpdated > 0) && ("true".equalsIgnoreCase(tpAction.getHttp_ssl_req()))) {
                        String selectQuery = "SELECT count(ID)  FROM MSCVP.TPO_SSL where PARTNER_ID=? and PROTOCOL=?";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        resultSet = preparedStatement.executeQuery();
                        while (resultSet.next()) {
                            if (resultSet.getInt(1) > 0) {
                                String insertQuery = "Update MSCVP.TPO_SSL set PROTOCOL=?, SSL_PRIORITY=?, "
                                        + " CIPHER_STRENGTH=?,CA_CERTIFICATES=?, MODIFIED_BY=?, MODIFIED_TS=?,TRANSFER_MODE=? where PARTNER_ID=?";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "HTTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setString(7, tpAction.getTransferMode());
                                preparedStatement.setInt(8, partnerId);
                                preparedStatement.executeUpdate();
                            } else {
                                String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                                        + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID,TRANSFER_MODE)"
                                        + "VALUES(?,?,?,?,?,?,?,?)";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "HTTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.setString(8, tpAction.getTransferMode());
                                preparedStatement.executeUpdate();
                            }
                        }
                    }
                } else {
                    String httpInsertQuery = "INSERT INTO MSCVP.TPO_HTTP(PARTNER_ID,RECEIVING_PROTOCOL, "
                            + "HTTP_END_POINT, HTTP_MODE, RESPONSE_TIMEOUT_SEC, HTTP_PORT, SSL_FLAG, TRANSFER_MODE, "
                            + "CREATED_BY, CREATED_TS, URL) "
                            + "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(httpInsertQuery);
                    preparedStatement.setInt(1, partnerId);
                    preparedStatement.setString(2, tpAction.getHttp_recv_protocol());
                    preparedStatement.setString(3, tpAction.getHttp_endpoint());
                    preparedStatement.setString(4, tpAction.getHttp_protocol_mode());
                    preparedStatement.setInt(5, Integer.parseInt(tpAction.getHttp_resp_time()));
                    preparedStatement.setInt(6, Integer.parseInt(tpAction.getHttp_port()));
                    preparedStatement.setString(7, tpAction.getHttp_ssl_req());
                    preparedStatement.setString(8, tpAction.getTransferMode());
                    preparedStatement.setString(9, tpAction.getContactName());
                    preparedStatement.setTimestamp(10, DateUtility.getInstance().getCurrentDB2Timestamp());
                    preparedStatement.setString(11, tpAction.getHttp_url());
                    isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();

                    if ((isProtocolInserted > 0) && ("true".equalsIgnoreCase(tpAction.getHttp_ssl_req()))) {
                        String selectQuery = "SELECT count(ID)  FROM MSCVP.TPO_SSL where PARTNER_ID=? and PROTOCOL=?";
                        preparedStatement = connection.prepareStatement(selectQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        resultSet = preparedStatement.executeQuery();
                        while (resultSet.next()) {
                            if (resultSet.getInt(1) > 0) {
                                String insertQuery = "Update MSCVP.TPO_SSL set PROTOCOL=?, SSL_PRIORITY=?,"
                                        + " CIPHER_STRENGTH=?,CA_CERTIFICATES=?, MODIFIED_BY=?, MODIFIED_TS=?,TRANSFER_MODE=? where PARTNER_ID=?";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "HTTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setString(7, tpAction.getTransferMode());
                                preparedStatement.setInt(8, partnerId);
                                preparedStatement.executeUpdate();
                            } else {
                                String insertQuery = "INSERT INTO MSCVP.TPO_SSL(PROTOCOL, SSL_PRIORITY,"
                                        + " CIPHER_STRENGTH,CA_CERTIFICATES, CREATED_BY, CREATED_TS, PARTNER_ID,TRANSFER_MODE)"
                                        + "VALUES(?,?,?,?,?,?,?,?)";
                                preparedStatement = connection.prepareStatement(insertQuery);
                                preparedStatement.setString(1, "HTTP");
                                preparedStatement.setString(2, tpAction.getSsl_priority2());
                                preparedStatement.setString(3, tpAction.getSsl_cipher_stergth2());
                                preparedStatement.setString(4, tpAction.getCertGroups());
                                preparedStatement.setString(5, tpAction.getContactName());
                                preparedStatement.setTimestamp(6, curdate);
                                preparedStatement.setInt(7, partnerId);
                                preparedStatement.setString(8, tpAction.getTransferMode());
                                preparedStatement.executeUpdate();
                            }
                        }
                    }
                }
            } else if ((isTpoUserUpdated > 0) && tpAction.getCommnProtocol().equals("SFTP") && tpAction.getTransferMode().equals("put")) {
                String sftpIsExistedQuery = "SELECT count(ID) AS sftpProtocal FROM MSCVP.TPO_SFTP where PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(sftpIsExistedQuery);
                if (resultSet.next()) {
                    sftpIsExisted = resultSet.getInt("sftpProtocal");
                }

                if (sftpIsExisted > 0) {
                    String sftpUpdateQuery = ("UPDATE MSCVP.TPO_SFTP SET CONN_METHOD = ?,MY_SSH_PUB_KEY = ?,UPL_YOUR_SSH_PUB_KEY = ?,"
                            + "REMOTE_HOST_IP_ADD = ?,REMOTE_USERID = ?,METHOD = ?,AUTH_METHOD = ?,REMOTE_PORT = ?,REMOTE_PWD = ?,"
                            + "DIRECTORY = ?,TRANSFER_MODE = ?,MODIFIED_BY = ?,MODIFIED_TS = ? WHERE PARTNER_ID = ?");
                    preparedStatement = connection.prepareStatement(sftpUpdateQuery);
                    preparedStatement.setString(1, tpAction.getSftp_conn_method());
                    preparedStatement.setString(2, tpAction.getSftp_public_key());
                    preparedStatement.setString(3, tpAction.getFilepath());
                    preparedStatement.setString(4, tpAction.getSftp_host_ip());
                    preparedStatement.setString(5, tpAction.getSftp_remote_userId());
                    preparedStatement.setString(6, tpAction.getSftp_method());
                    preparedStatement.setString(7, tpAction.getSftp_auth_method());
                    preparedStatement.setString(8, tpAction.getSftp_remote_port());
                    preparedStatement.setString(9, tpAction.getSftp_remote_pwd());
                    preparedStatement.setString(10, tpAction.getSftp_directory());
                    preparedStatement.setString(11, tpAction.getTransferMode());
                    preparedStatement.setString(12, tpAction.getContactName());
                    preparedStatement.setTimestamp(13, curdate);
                    preparedStatement.setInt(14, partnerId);
                    isProtocolUpdated = isProtocolUpdated + preparedStatement.executeUpdate();
                } else {
                    String sftpInsertQuery = "INSERT INTO MSCVP.TPO_SFTP(PARTNER_ID, CONN_METHOD, MY_SSH_PUB_KEY, UPL_YOUR_SSH_PUB_KEY,"
                            + " REMOTE_HOST_IP_ADD, REMOTE_USERID, METHOD, AUTH_METHOD, REMOTE_PORT, REMOTE_PWD, DIRECTORY, TRANSFER_MODE,"
                            + " CREATED_BY, CREATED_TS)"
                            + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(sftpInsertQuery);
                    preparedStatement.setInt(1, partnerId);
                    preparedStatement.setString(2, tpAction.getSftp_conn_method());
                    preparedStatement.setString(3, tpAction.getSftp_public_key());
                    preparedStatement.setString(4, tpAction.getFilepath());
                    preparedStatement.setString(5, tpAction.getSftp_host_ip());
                    preparedStatement.setString(6, tpAction.getSftp_remote_userId());
                    preparedStatement.setString(7, tpAction.getSftp_method());
                    preparedStatement.setString(8, tpAction.getSftp_auth_method());
                    preparedStatement.setString(9, tpAction.getSftp_remote_port());
                    preparedStatement.setString(10, tpAction.getSftp_remote_pwd());
                    preparedStatement.setString(11, tpAction.getSftp_directory());
                    preparedStatement.setString(12, tpAction.getTransferMode());
                    preparedStatement.setString(13, tpAction.getContactName());
                    preparedStatement.setTimestamp(14, DateUtility.getInstance().getCurrentDB2Timestamp());
                    isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                }
            } else if ((isTpoUserUpdated > 0) && tpAction.getCommnProtocol().equals("SMTP")) {
                String smtpIsExistedQuery = "SELECT count(ID) AS smtpProtocal FROM MSCVP.TPO_SMTP where PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(smtpIsExistedQuery);
                if (resultSet.next()) {
                    smtpIsExisted = resultSet.getInt("smtpProtocal");
                }

                if (smtpIsExisted > 0) {
                    String smtpUpdateQuery = ("UPDATE MSCVP.TPO_SMTP SET RECEIVING_PROTOCOL = ?,SMTP_SERVER_PORT = ?,TO_EMAIL_ADDRESS = ?,"
                            + "SMTP_SERVER_HOST = ?,FROM_EMAIL_ADDRESS = ?, MODIFIED_BY = ?,MODIFIED_TS = ? WHERE PARTNER_ID = ?");
                    preparedStatement = connection.prepareStatement(smtpUpdateQuery);
                    preparedStatement.setString(1, tpAction.getSmtp_recv_protocol());
                    preparedStatement.setInt(2, Integer.parseInt(tpAction.getSmtp_server_port()));
                    preparedStatement.setString(3, tpAction.getSmtp_to_email());
                    preparedStatement.setString(4, tpAction.getSmtp_server_protocol());
                    preparedStatement.setString(5, tpAction.getSmtp_from_email());
                    preparedStatement.setString(6, tpAction.getContactName());
                    preparedStatement.setTimestamp(7, curdate);
                    preparedStatement.setInt(8, partnerId);
                    isProtocolUpdated = isProtocolUpdated + preparedStatement.executeUpdate();
                } else {
                    String smtpInsertQuery = "INSERT INTO MSCVP.TPO_SMTP (PARTNER_ID,RECEIVING_PROTOCOL, SMTP_SERVER_PORT,"
                            + "  TO_EMAIL_ADDRESS, SMTP_SERVER_HOST, FROM_EMAIL_ADDRESS, CREATED_BY, "
                            + "CREATED_TS)"
                            + "VALUES(?,?,?,?,?,?,?,?)";
                    preparedStatement = connection.prepareStatement(smtpInsertQuery);
                    preparedStatement.setInt(1, partnerId);
                    preparedStatement.setString(2, tpAction.getSmtp_recv_protocol());
                    preparedStatement.setInt(3, Integer.parseInt(tpAction.getSmtp_server_port()));
                    preparedStatement.setString(4, tpAction.getSmtp_to_email());
                    preparedStatement.setString(5, tpAction.getSmtp_server_protocol());
                    preparedStatement.setString(6, tpAction.getSmtp_from_email());
                    preparedStatement.setString(7, tpAction.getContactName());
                    preparedStatement.setTimestamp(8, DateUtility.getInstance().getCurrentDB2Timestamp());
                    isProtocolInserted = isProtocolInserted + preparedStatement.executeUpdate();
                }
            } else {
                isProtocolinsertOrUpdateNoNeed = 1;
            }
            // Evvelopes strated
            boolean ib850 = false;
            boolean ib855 = false;
            boolean ib856 = false;
            boolean ib810 = false;
            boolean ob850 = false;
            boolean ob855 = false;
            boolean ob856 = false;
            boolean ob810 = false;
            String envFlag = "Insert";
            if ((isProtocolInserted > 0) || (isProtocolUpdated > 0) || (isProtocolinsertOrUpdateNoNeed > 0)) {
                String transactionsQuery = "SELECT TRANSACTION,DIRECTION FROM TPO_ENVELOPES where PARTNER_ID = ?";
                preparedStatement = connection.prepareStatement(transactionsQuery);
                preparedStatement.setInt(1, partnerId);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    if ("850".equalsIgnoreCase(resultSet.getString("TRANSACTION"))) {
                        if ("Inbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ib850 = true;
                            envFlag = "Update";
                        }
                        if ("Outbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ob850 = true;
                            envFlag = "Update";
                        }
                    }
                    if ("855".equalsIgnoreCase(resultSet.getString("TRANSACTION"))) {
                        if ("Inbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ib855 = true;
                            envFlag = "Update";
                        }
                        if ("Outbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ob855 = true;
                            envFlag = "Update";
                        }
                    }
                    if ("856".equalsIgnoreCase(resultSet.getString("TRANSACTION"))) {
                        if ("Inbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ib856 = true;
                            envFlag = "Update";
                        }
                        if ("Outbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ob856 = true;
                            envFlag = "Update";
                        }
                    }
                    if ("810".equalsIgnoreCase(resultSet.getString("TRANSACTION"))) {
                        if ("Inbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ib810 = true;
                            envFlag = "Update";
                        }
                        if ("Outbound".equalsIgnoreCase(resultSet.getString("DIRECTION"))) {
                            ob810 = true;
                            envFlag = "Update";
                        }
                    }
                }
                //850-inbound
                if (tpAction.isIb850() == true) {
                    if (ib850 == true) {
                        String dataib850 = tpAction.getIB850Transaction();
                        String ib850Transaction[] = dataib850.substring(0, dataib850.length()).split(Pattern.quote("@"));
                        //ib850 = ibtransaction+"@"+ibdirection+"@"+isa850senderIdIB+"@"+gs850senderIdIB+"@"+st850senderIdIB+"@"+isa850RecIdIB+"@"+gs850RecIdIB+"@"+st850RecIdIB+"@"+isa850VersionIB+"@"+gs850VersionIB+"@"+st850VersionIB+"@"+fun850GroupIdIB+"@"+res850AgecodeIB+"@"+gen850AckIB+"@"+trans850IdcodeIB;     
                        String ib850UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS =?,TP_FLAG=? WHERE TRANSACTION = '850' AND lcase(DIRECTION) like lcase('%Inbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ib850UpdateQuery);
                        preparedStatement.setString(1, ib850Transaction[0]);
                        preparedStatement.setString(2, ib850Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ib850Transaction[2]);
                        preparedStatement.setString(5, ib850Transaction[3]);
                        preparedStatement.setString(6, ib850Transaction[4]);
                        preparedStatement.setString(7, ib850Transaction[5]);
                        preparedStatement.setString(8, ib850Transaction[6]);
                        preparedStatement.setString(9, ib850Transaction[7]);
                        preparedStatement.setString(10, ib850Transaction[8]);
                        preparedStatement.setString(11, ib850Transaction[9]);
                        preparedStatement.setString(12, ib850Transaction[10]);
                        preparedStatement.setString(13, ib850Transaction[11]);
                        preparedStatement.setString(14, ib850Transaction[12]);
                        preparedStatement.setString(15, ib850Transaction[13]);
                        preparedStatement.setString(16, ib850Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataib850 = tpAction.getIB850Transaction();
                        String ib850Transaction[] = dataib850.substring(0, dataib850.length()).split(Pattern.quote("@"));
                        //ib850 = ibtransaction+"@"+ibdirection+"@"+isa850senderIdIB+"@"+gs850senderIdIB+"@"+st850senderIdIB+"@"+isa850RecIdIB+"@"+gs850RecIdIB+"@"+st850RecIdIB+"@"+isa850VersionIB+"@"+gs850VersionIB+"@"+st850VersionIB+"@"+fun850GroupIdIB+"@"+res850AgecodeIB+"@"+gen850AckIB+"@"+trans850IdcodeIB;     
                        String ib850UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ib850UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ib850Transaction[0]);
                        preparedStatement.setString(4, ib850Transaction[1]);
                        preparedStatement.setString(5, ib850Transaction[2]);
                        preparedStatement.setString(6, ib850Transaction[3]);
                        preparedStatement.setString(7, ib850Transaction[4]);
                        preparedStatement.setString(8, ib850Transaction[5]);
                        preparedStatement.setString(9, ib850Transaction[6]);
                        preparedStatement.setString(10, ib850Transaction[7]);
                        preparedStatement.setString(11, ib850Transaction[8]);
                        preparedStatement.setString(12, ib850Transaction[9]);
                        preparedStatement.setString(13, ib850Transaction[10]);
                        preparedStatement.setString(14, ib850Transaction[11]);
                        preparedStatement.setString(15, ib850Transaction[12]);
                        preparedStatement.setString(16, ib850Transaction[13]);
                        preparedStatement.setString(17, ib850Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isIb850() == false) {
                    if (ib850 == true) {
                        String deleteIb850Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '850' AND DIRECTION = 'Inbound' AND PARTNER_ID =  " + partnerId;
                        int deleteIb850Count = statement.executeUpdate(deleteIb850Query);
                    }
                }
                //855-inbound
                if (tpAction.isIb855() == true) {
                    if (ib855 == true) {
                        String dataib855 = tpAction.getIB855Transaction();
                        String ib855Transaction[] = dataib855.substring(0, dataib855.length()).split(Pattern.quote("@"));
                        String ib855UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '855' AND lcase(DIRECTION) like lcase('%Inbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ib855UpdateQuery);
                        preparedStatement.setString(1, ib855Transaction[0]);
                        preparedStatement.setString(2, ib855Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ib855Transaction[2]);
                        preparedStatement.setString(5, ib855Transaction[3]);
                        preparedStatement.setString(6, ib855Transaction[4]);
                        preparedStatement.setString(7, ib855Transaction[5]);
                        preparedStatement.setString(8, ib855Transaction[6]);
                        preparedStatement.setString(9, ib855Transaction[7]);
                        preparedStatement.setString(10, ib855Transaction[8]);
                        preparedStatement.setString(11, ib855Transaction[9]);
                        preparedStatement.setString(12, ib855Transaction[10]);
                        preparedStatement.setString(13, ib855Transaction[11]);
                        preparedStatement.setString(14, ib855Transaction[12]);
                        preparedStatement.setString(15, ib855Transaction[13]);
                        preparedStatement.setString(16, ib855Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataib855 = tpAction.getIB855Transaction();
                        String ib855Transaction[] = dataib855.substring(0, dataib855.length()).split(Pattern.quote("@"));
                        String ib855UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ib855UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ib855Transaction[0]);
                        preparedStatement.setString(4, ib855Transaction[1]);
                        preparedStatement.setString(5, ib855Transaction[2]);
                        preparedStatement.setString(6, ib855Transaction[3]);
                        preparedStatement.setString(7, ib855Transaction[4]);
                        preparedStatement.setString(8, ib855Transaction[5]);
                        preparedStatement.setString(9, ib855Transaction[6]);
                        preparedStatement.setString(10, ib855Transaction[7]);
                        preparedStatement.setString(11, ib855Transaction[8]);
                        preparedStatement.setString(12, ib855Transaction[9]);
                        preparedStatement.setString(13, ib855Transaction[10]);
                        preparedStatement.setString(14, ib855Transaction[11]);
                        preparedStatement.setString(15, ib855Transaction[12]);
                        preparedStatement.setString(16, ib855Transaction[13]);
                        preparedStatement.setString(17, ib855Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isIb855() == false) {
                    if (ib855 == true) {
                        String deleteIb855Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '855' AND DIRECTION = 'Inbound' AND PARTNER_ID =  " + partnerId;
                        int deleteIb855Count = statement.executeUpdate(deleteIb855Query);
                    }
                }
                //856-inbound
                if (tpAction.isIb856() == true) {
                    if (ib856 == true) {
                        String dataib856 = tpAction.getIB856Transaction();
                        String ib856Transaction[] = dataib856.substring(0, dataib856.length()).split(Pattern.quote("@"));
                        //ib856 = ibtransaction+"@"+ibdirection+"@"+isa856senderIdIB+"@"+gs856senderIdIB+"@"+st856senderIdIB+"@"+isa856RecIdIB+"@"+gs856RecIdIB+"@"+st856RecIdIB+"@"+isa856VersionIB+"@"+gs856VersionIB+"@"+st856VersionIB+"@"+fun856GroupIdIB+"@"+res856AgecodeIB+"@"+gen856AckIB+"@"+trans856IdcodeIB; 
                        String ib856UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '856' AND lcase(DIRECTION) like lcase('%Inbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ib856UpdateQuery);
                        preparedStatement.setString(1, ib856Transaction[0]);
                        preparedStatement.setString(2, ib856Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ib856Transaction[2]);
                        preparedStatement.setString(5, ib856Transaction[3]);
                        preparedStatement.setString(6, ib856Transaction[4]);
                        preparedStatement.setString(7, ib856Transaction[5]);
                        preparedStatement.setString(8, ib856Transaction[6]);
                        preparedStatement.setString(9, ib856Transaction[7]);
                        preparedStatement.setString(10, ib856Transaction[8]);
                        preparedStatement.setString(11, ib856Transaction[9]);
                        preparedStatement.setString(12, ib856Transaction[10]);
                        preparedStatement.setString(13, ib856Transaction[11]);
                        preparedStatement.setString(14, ib856Transaction[12]);
                        preparedStatement.setString(15, ib856Transaction[13]);
                        preparedStatement.setString(16, ib856Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataib856 = tpAction.getIB856Transaction();
                        String ib856Transaction[] = dataib856.substring(0, dataib856.length()).split(Pattern.quote("@"));
                        String ib856UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ib856UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ib856Transaction[0]);
                        preparedStatement.setString(4, ib856Transaction[1]);
                        preparedStatement.setString(5, ib856Transaction[2]);
                        preparedStatement.setString(6, ib856Transaction[3]);
                        preparedStatement.setString(7, ib856Transaction[4]);
                        preparedStatement.setString(8, ib856Transaction[5]);
                        preparedStatement.setString(9, ib856Transaction[6]);
                        preparedStatement.setString(10, ib856Transaction[7]);
                        preparedStatement.setString(11, ib856Transaction[8]);
                        preparedStatement.setString(12, ib856Transaction[9]);
                        preparedStatement.setString(13, ib856Transaction[10]);
                        preparedStatement.setString(14, ib856Transaction[11]);
                        preparedStatement.setString(15, ib856Transaction[12]);
                        preparedStatement.setString(16, ib856Transaction[13]);
                        preparedStatement.setString(17, ib856Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isIb856() == false) {
                    if (ib856 == true) {
                        String deleteIb856Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '856' AND DIRECTION = 'Inbound' AND PARTNER_ID =  " + partnerId;
                        int deleteIb856Count = statement.executeUpdate(deleteIb856Query);
                    }
                }

                // 810- inbound  
                if (tpAction.isIb810() == true) {
                    if (ib810 == true) {
                        String dataib810 = tpAction.getIB810Transaction();
                        String ib810Transaction[] = dataib810.substring(0, dataib810.length()).split(Pattern.quote("@"));
                        //ib810 = ibtransaction+"@"+ibdirection+"@"+isa810senderIdIB+"@"+gs810senderIdIB+"@"+st810senderIdIB+"@"+isa810RecIdIB+"@"+gs810RecIdIB+"@"+st810RecIdIB+"@"+isa810VersionIB+"@"+gs810VersionIB+"@"+st810VersionIB+"@"+fun810GroupIdIB+"@"+res810AgecodeIB+"@"+gen810AckIB+"@"+trans810IdcodeIB; 
                        String ib810UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '810' AND lcase(DIRECTION) like lcase('%Inbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ib810UpdateQuery);
                        preparedStatement.setString(1, ib810Transaction[0]);
                        preparedStatement.setString(2, ib810Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ib810Transaction[2]);
                        preparedStatement.setString(5, ib810Transaction[3]);
                        preparedStatement.setString(6, ib810Transaction[4]);
                        preparedStatement.setString(7, ib810Transaction[5]);
                        preparedStatement.setString(8, ib810Transaction[6]);
                        preparedStatement.setString(9, ib810Transaction[7]);
                        preparedStatement.setString(10, ib810Transaction[8]);
                        preparedStatement.setString(11, ib810Transaction[9]);
                        preparedStatement.setString(12, ib810Transaction[10]);
                        preparedStatement.setString(13, ib810Transaction[11]);
                        preparedStatement.setString(14, ib810Transaction[12]);
                        preparedStatement.setString(15, ib810Transaction[13]);
                        preparedStatement.setString(16, ib810Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataib810 = tpAction.getIB810Transaction();
                        String ib810Transaction[] = dataib810.substring(0, dataib810.length()).split(Pattern.quote("@"));
                        //ib810 = ibtransaction+"@"+ibdirection+"@"+isa810senderIdIB+"@"+gs810senderIdIB+"@"+st810senderIdIB+"@"+isa810RecIdIB+"@"+gs810RecIdIB+"@"+st810RecIdIB+"@"+isa810VersionIB+"@"+gs810VersionIB+"@"+st810VersionIB+"@"+fun810GroupIdIB+"@"+res810AgecodeIB+"@"+gen810AckIB+"@"+trans810IdcodeIB; 
                        String ib810UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ib810UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ib810Transaction[0]);
                        preparedStatement.setString(4, ib810Transaction[1]);
                        preparedStatement.setString(5, ib810Transaction[2]);
                        preparedStatement.setString(6, ib810Transaction[3]);
                        preparedStatement.setString(7, ib810Transaction[4]);
                        preparedStatement.setString(8, ib810Transaction[5]);
                        preparedStatement.setString(9, ib810Transaction[6]);
                        preparedStatement.setString(10, ib810Transaction[7]);
                        preparedStatement.setString(11, ib810Transaction[8]);
                        preparedStatement.setString(12, ib810Transaction[9]);
                        preparedStatement.setString(13, ib810Transaction[10]);
                        preparedStatement.setString(14, ib810Transaction[11]);
                        preparedStatement.setString(15, ib810Transaction[12]);
                        preparedStatement.setString(16, ib810Transaction[13]);
                        preparedStatement.setString(17, ib810Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isIb810() == false) {
                    if (ib810 == true) {
                        String deleteIb810Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '810' AND DIRECTION = 'Inbound' AND PARTNER_ID =  " + partnerId;
                        int deleteIb810Count = statement.executeUpdate(deleteIb810Query);
                    }
                }
                //850 outbound start
                if (tpAction.isOb850() == true) {
                    if (ob850 == true) {
                        String dataob850 = tpAction.getOB850Transaction();
                        String ob850Transaction[] = dataob850.substring(0, dataob850.length()).split(Pattern.quote("@"));
                        //ob850 = obtransaction+"@"+obdirection+"@"+isa850senderIdOB+"@"+gs850senderIdOB+"@"+st850senderIdOB+"@"+isa850RecIdOB+"@"+gs850RecIdOB+"@"+st850RecIdOB+"@"+isa850VersionOB+"@"+gs850VersionOB+"@"+st850VersionOB+"@"+fun850GroupIdOB+"@"+res850AgecodeOB+"@"+gen850AckOB+"@"+trans850IdcodeOB; 
                        String ob850UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '850' AND lcase(DIRECTION) like lcase('%Outbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ob850UpdateQuery);
                        preparedStatement.setString(1, ob850Transaction[0]);
                        preparedStatement.setString(2, ob850Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ob850Transaction[2]);
                        preparedStatement.setString(5, ob850Transaction[3]);
                        preparedStatement.setString(6, ob850Transaction[4]);
                        preparedStatement.setString(7, ob850Transaction[5]);
                        preparedStatement.setString(8, ob850Transaction[6]);
                        preparedStatement.setString(9, ob850Transaction[7]);
                        preparedStatement.setString(10, ob850Transaction[8]);
                        preparedStatement.setString(11, ob850Transaction[9]);
                        preparedStatement.setString(12, ob850Transaction[10]);
                        preparedStatement.setString(13, ob850Transaction[11]);
                        preparedStatement.setString(14, ob850Transaction[12]);
                        preparedStatement.setString(15, ob850Transaction[13]);
                        preparedStatement.setString(16, ob850Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataob850 = tpAction.getOB850Transaction();
                        System.out.println("dataob850:" + dataob850);
                        String ob850Transaction[] = dataob850.substring(0, dataob850.length()).split(Pattern.quote("@"));
                        //ob850 = obtransaction+"@"+obdirection+"@"+isa850senderIdOB+"@"+gs850senderIdOB+"@"+st850senderIdOB+"@"+isa850RecIdOB+"@"+gs850RecIdOB+"@"+st850RecIdOB+"@"+isa850VersionOB+"@"+gs850VersionOB+"@"+st850VersionOB+"@"+fun850GroupIdOB+"@"+res850AgecodeOB+"@"+gen850AckOB+"@"+trans850IdcodeOB; 
                        String ib850UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ib850UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ob850Transaction[0]);
                        preparedStatement.setString(4, ob850Transaction[1]);
                        preparedStatement.setString(5, ob850Transaction[2]);
                        preparedStatement.setString(6, ob850Transaction[3]);
                        preparedStatement.setString(7, ob850Transaction[4]);
                        preparedStatement.setString(8, ob850Transaction[5]);
                        preparedStatement.setString(9, ob850Transaction[6]);
                        preparedStatement.setString(10, ob850Transaction[7]);
                        preparedStatement.setString(11, ob850Transaction[8]);
                        preparedStatement.setString(12, ob850Transaction[9]);
                        preparedStatement.setString(13, ob850Transaction[10]);
                        preparedStatement.setString(14, ob850Transaction[11]);
                        preparedStatement.setString(15, ob850Transaction[12]);
                        preparedStatement.setString(16, ob850Transaction[13]);
                        preparedStatement.setString(17, ob850Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isOb850() == false) {
                    if (ob850 == true) {
                        String deleteOb850Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '850' AND DIRECTION = 'Outbound' AND PARTNER_ID =  " + partnerId;
                        int deleteOb850Count = statement.executeUpdate(deleteOb850Query);
                    }
                }
                //855 outbound start
                if (tpAction.isOb855() == true) {
                    if (ob855 == true) {
                        String dataob855 = tpAction.getOB855Transaction();
                        String ob855Transaction[] = dataob855.substring(0, dataob855.length()).split(Pattern.quote("@"));
                        //ob855 = obtransaction+"@"+obdirection+"@"+isa855senderIdOB+"@"+gs855senderIdOB+"@"+st855senderIdOB+"@"+isa855RecIdOB+"@"+gs855RecIdOB+"@"+st855RecIdOB+"@"+isa855VersionOB+"@"+gs855VersionOB+"@"+st855VersionOB+"@"+fun855GroupIdOB+"@"+res855AgecodeOB+"@"+gen855AckOB+"@"+trans855IdcodeOB;   
                        String ob855UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '855' AND lcase(DIRECTION) like lcase('%Outbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ob855UpdateQuery);
                        preparedStatement.setString(1, ob855Transaction[0]);
                        preparedStatement.setString(2, ob855Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ob855Transaction[2]);
                        preparedStatement.setString(5, ob855Transaction[3]);
                        preparedStatement.setString(6, ob855Transaction[4]);
                        preparedStatement.setString(7, ob855Transaction[5]);
                        preparedStatement.setString(8, ob855Transaction[6]);
                        preparedStatement.setString(9, ob855Transaction[7]);
                        preparedStatement.setString(10, ob855Transaction[8]);
                        preparedStatement.setString(11, ob855Transaction[9]);
                        preparedStatement.setString(12, ob855Transaction[10]);
                        preparedStatement.setString(13, ob855Transaction[11]);
                        preparedStatement.setString(14, ob855Transaction[12]);
                        preparedStatement.setString(15, ob855Transaction[13]);
                        preparedStatement.setString(16, ob855Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataob855 = tpAction.getOB855Transaction();
                        String ob855Transaction[] = dataob855.substring(0, dataob855.length()).split(Pattern.quote("@"));
                        //ob855 = obtransaction+"@"+obdirection+"@"+isa855senderIdOB+"@"+gs855senderIdOB+"@"+st855senderIdOB+"@"+isa855RecIdOB+"@"+gs855RecIdOB+"@"+st855RecIdOB+"@"+isa855VersionOB+"@"+gs855VersionOB+"@"+st855VersionOB+"@"+fun855GroupIdOB+"@"+res855AgecodeOB+"@"+gen855AckOB+"@"+trans855IdcodeOB;   
                        String ob855UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ob855UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ob855Transaction[0]);
                        preparedStatement.setString(4, ob855Transaction[1]);
                        preparedStatement.setString(5, ob855Transaction[2]);
                        preparedStatement.setString(6, ob855Transaction[3]);
                        preparedStatement.setString(7, ob855Transaction[4]);
                        preparedStatement.setString(8, ob855Transaction[5]);
                        preparedStatement.setString(9, ob855Transaction[6]);
                        preparedStatement.setString(10, ob855Transaction[7]);
                        preparedStatement.setString(11, ob855Transaction[8]);
                        preparedStatement.setString(12, ob855Transaction[9]);
                        preparedStatement.setString(13, ob855Transaction[10]);
                        preparedStatement.setString(14, ob855Transaction[11]);
                        preparedStatement.setString(15, ob855Transaction[12]);
                        preparedStatement.setString(16, ob855Transaction[13]);
                        preparedStatement.setString(17, ob855Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isOb855() == false) {
                    if (ob855 == true) {
                        String deleteOb855Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '855' AND DIRECTION = 'Outbound' AND PARTNER_ID =  " + partnerId;
                        int deleteOb855Count = statement.executeUpdate(deleteOb855Query);
                    }
                }
                //856 outbound start
                if (tpAction.isOb856() == true) {
                    if (ob856 == true) {
                        String dataob856 = tpAction.getOB856Transaction();
                        String ob856Transaction[] = dataob856.substring(0, dataob856.length()).split(Pattern.quote("@"));
                        //ob856 = obtransaction+"@"+obdirection+"@"+isa856senderIdOB+"@"+gs856senderIdOB+"@"+st856senderIdOB+"@"+isa856RecIdOB+"@"+gs856RecIdOB+"@"+st856RecIdOB+"@"+isa856VersionOB+"@"+gs856VersionOB+"@"+st856VersionOB+"@"+fun856GroupIdOB+"@"+res856AgecodeOB+"@"+gen856AckOB+"@"+trans856IdcodeOB;  
                        String ob856UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '856' AND lcase(DIRECTION) like lcase('%Outbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ob856UpdateQuery);
                        preparedStatement.setString(1, ob856Transaction[0]);
                        preparedStatement.setString(2, ob856Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ob856Transaction[2]);
                        preparedStatement.setString(5, ob856Transaction[3]);
                        preparedStatement.setString(6, ob856Transaction[4]);
                        preparedStatement.setString(7, ob856Transaction[5]);
                        preparedStatement.setString(8, ob856Transaction[6]);
                        preparedStatement.setString(9, ob856Transaction[7]);
                        preparedStatement.setString(10, ob856Transaction[8]);
                        preparedStatement.setString(11, ob856Transaction[9]);
                        preparedStatement.setString(12, ob856Transaction[10]);
                        preparedStatement.setString(13, ob856Transaction[11]);
                        preparedStatement.setString(14, ob856Transaction[12]);
                        preparedStatement.setString(15, ob856Transaction[13]);
                        preparedStatement.setString(16, ob856Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataob856 = tpAction.getOB856Transaction();
                        String ob856Transaction[] = dataob856.substring(0, dataob856.length()).split(Pattern.quote("@"));
                        //ob856 = obtransaction+"@"+obdirection+"@"+isa856senderIdOB+"@"+gs856senderIdOB+"@"+st856senderIdOB+"@"+isa856RecIdOB+"@"+gs856RecIdOB+"@"+st856RecIdOB+"@"+isa856VersionOB+"@"+gs856VersionOB+"@"+st856VersionOB+"@"+fun856GroupIdOB+"@"+res856AgecodeOB+"@"+gen856AckOB+"@"+trans856IdcodeOB;  
                        String ob856UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ob856UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ob856Transaction[0]);
                        preparedStatement.setString(4, ob856Transaction[1]);
                        preparedStatement.setString(5, ob856Transaction[2]);
                        preparedStatement.setString(6, ob856Transaction[3]);
                        preparedStatement.setString(7, ob856Transaction[4]);
                        preparedStatement.setString(8, ob856Transaction[5]);
                        preparedStatement.setString(9, ob856Transaction[6]);
                        preparedStatement.setString(10, ob856Transaction[7]);
                        preparedStatement.setString(11, ob856Transaction[8]);
                        preparedStatement.setString(12, ob856Transaction[9]);
                        preparedStatement.setString(13, ob856Transaction[10]);
                        preparedStatement.setString(14, ob856Transaction[11]);
                        preparedStatement.setString(15, ob856Transaction[12]);
                        preparedStatement.setString(16, ob856Transaction[13]);
                        preparedStatement.setString(17, ob856Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isOb856() == false) {
                    if (ob856 == true) {
                        String deleteOb856Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '856' AND DIRECTION = 'Outbound' AND PARTNER_ID =  " + partnerId;
                        int deleteOb856Count = statement.executeUpdate(deleteOb856Query);
                    }
                }
                //810 outbound start
                if (tpAction.isOb810() == true) {
                    if (ob810 == true) {
                        String dataob810 = tpAction.getOB810Transaction();
                        String ob810Transaction[] = dataob810.substring(0, dataob810.length()).split(Pattern.quote("@"));
                        //ob810 = obtransaction+"@"+obdirection+"@"+isa810senderIdOB+"@"+gs810senderIdOB+"@"+st810senderIdOB+"@"+isa810RecIdOB+"@"+gs810RecIdOB+"@"+st810RecIdOB+"@"+isa810VersionOB+"@"+gs810VersionOB+"@"+st810VersionOB+"@"+fun810GroupIdOB+"@"+res810AgecodeOB+"@"+gen810AckOB+"@"+trans810IdcodeOB; 
                        String ob810UpdateQuery = ("UPDATE MSCVP.TPO_ENVELOPES SET TRANSACTION = ?,DIRECTION = ?,PROTOCOL = ?,SENDERID_ISA = ?,"
                                + "SENDERID_GS = ?,SENDERID_ST = ?,RECEIVERID_ISA = ?,RECEIVERID_GS = ?,RECEIVERID_ST = ?,VERSION_ISA = ?,"
                                + "VERSION_GS = ?,VERSION_ST = ?,FUNCTIONAL_ID_CODE_GS = ?,RESPONSIBLE_AGENCY_CODE_GS = ?,"
                                + "GENERATE_AN_ACKNOWLEDGEMENT_GS = ?,TRANSACTION_SET_ID_CODE_ST = ?,MODIFIED_BY = ?,MODIFIED_TS = ?,TP_FLAG=? WHERE TRANSACTION = '810' AND lcase(DIRECTION) like lcase('%Outbound%') AND PARTNER_ID = ?");
                        preparedStatement = connection.prepareStatement(ob810UpdateQuery);
                        preparedStatement.setString(1, ob810Transaction[0]);
                        preparedStatement.setString(2, ob810Transaction[1]);
                        preparedStatement.setString(3, tpAction.getCommnProtocol());
                        preparedStatement.setString(4, ob810Transaction[2]);
                        preparedStatement.setString(5, ob810Transaction[3]);
                        preparedStatement.setString(6, ob810Transaction[4]);
                        preparedStatement.setString(7, ob810Transaction[5]);
                        preparedStatement.setString(8, ob810Transaction[6]);
                        preparedStatement.setString(9, ob810Transaction[7]);
                        preparedStatement.setString(10, ob810Transaction[8]);
                        preparedStatement.setString(11, ob810Transaction[9]);
                        preparedStatement.setString(12, ob810Transaction[10]);
                        preparedStatement.setString(13, ob810Transaction[11]);
                        preparedStatement.setString(14, ob810Transaction[12]);
                        preparedStatement.setString(15, ob810Transaction[13]);
                        preparedStatement.setString(16, ob810Transaction[14]);
                        preparedStatement.setString(17, tpAction.getContactName());
                        preparedStatement.setTimestamp(18, DateUtility.getInstance().getCurrentDB2Timestamp());
                        preparedStatement.setString(19, "N");
                        preparedStatement.setInt(20, partnerId);
                        isEnvelopeUpdated = isEnvelopeUpdated + preparedStatement.executeUpdate();
                    } else {
                        String dataob810 = tpAction.getOB810Transaction();
                        String ob810Transaction[] = dataob810.substring(0, dataob810.length()).split(Pattern.quote("@"));
                        //ob810 = obtransaction+"@"+obdirection+"@"+isa810senderIdOB+"@"+gs810senderIdOB+"@"+st810senderIdOB+"@"+isa810RecIdOB+"@"+gs810RecIdOB+"@"+st810RecIdOB+"@"+isa810VersionOB+"@"+gs810VersionOB+"@"+st810VersionOB+"@"+fun810GroupIdOB+"@"+res810AgecodeOB+"@"+gen810AckOB+"@"+trans810IdcodeOB; 
                        String ob810UpdateQuery = "INSERT INTO TPO_ENVELOPES (PARTNER_ID,PROTOCOL, TRANSACTION, DIRECTION,  SENDERID_ISA,"
                                + " SENDERID_GS, SENDERID_ST, RECEIVERID_ISA, RECEIVERID_GS, RECEIVERID_ST, VERSION_ISA, "
                                + "VERSION_GS, VERSION_ST, FUNCTIONAL_ID_CODE_GS, RESPONSIBLE_AGENCY_CODE_GS, GENERATE_AN_ACKNOWLEDGEMENT_GS, "
                                + "TRANSACTION_SET_ID_CODE_ST, CREATED_BY, CREATED_TS) "
                                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
                        preparedStatement = connection.prepareStatement(ob810UpdateQuery);
                        preparedStatement.setInt(1, partnerId);
                        preparedStatement.setString(2, tpAction.getCommnProtocol());
                        preparedStatement.setString(3, ob810Transaction[0]);
                        preparedStatement.setString(4, ob810Transaction[1]);
                        preparedStatement.setString(5, ob810Transaction[2]);
                        preparedStatement.setString(6, ob810Transaction[3]);
                        preparedStatement.setString(7, ob810Transaction[4]);
                        preparedStatement.setString(8, ob810Transaction[5]);
                        preparedStatement.setString(9, ob810Transaction[6]);
                        preparedStatement.setString(10, ob810Transaction[7]);
                        preparedStatement.setString(11, ob810Transaction[8]);
                        preparedStatement.setString(12, ob810Transaction[9]);
                        preparedStatement.setString(13, ob810Transaction[10]);
                        preparedStatement.setString(14, ob810Transaction[11]);
                        preparedStatement.setString(15, ob810Transaction[12]);
                        preparedStatement.setString(16, ob810Transaction[13]);
                        preparedStatement.setString(17, ob810Transaction[14]);
                        preparedStatement.setString(18, tpAction.getContactName());
                        preparedStatement.setTimestamp(19, DateUtility.getInstance().getCurrentDB2Timestamp());
                        isEnvelopeInserted = isEnvelopeInserted + preparedStatement.executeUpdate();
                    }
                } else if (tpAction.isOb810() == false) {
                    if (ob810 == true) {
                        String deleteOb810Query = "DELETE FROM MSCVP.TPO_ENVELOPES WHERE TRANSACTION = '810' AND DIRECTION = 'Outbound' AND PARTNER_ID =  " + partnerId;
                        int deleteOb810Count = statement.executeUpdate(deleteOb810Query);
                    }
                }
                mp = tpAction.getMap();
                if ((isTpoUserUpdated > 0) && ((isProtocolInserted > 0) || (isProtocolUpdated > 0) || (isProtocolinsertOrUpdateNoNeed > 0))) {
                    responseString = "<font color='green'>Updated successfully</font>";
                    MailManager.tpoDetails(partnerId, tpAction.getPartnerName(), tpAction.getContactName(), tpAction.getContactEmail(), tpAction.getPhoneNo(), tpAction.getCountry(), tpAction.getCommnProtocol(), tpAction.getTransferMode(), tpAction.getFilepath(), tpAction.getCertGroups(), mp, tpAction.isIb850(), tpAction.isIb855(), tpAction.isIb856(), tpAction.isIb810(), tpAction.isOb850(), tpAction.isOb855(), tpAction.isOb856(), tpAction.isOb810(), envFlag);
                } else {
                    responseString = "<font color='red'>Please try again!</font>";
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (callableStatement != null) {
                    callableStatement.close();
                    callableStatement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException se) {
                throw new ServiceLocatorException(se);
            }
        }
        return responseString;
    }

    @Override
    public ArrayList<TpOnboardingBean> tpoSearchProfile(int partnerId, TpOnboardingAction tpAction) {
        System.out.println("in service impl");
        System.out.println("commonProtocol is " + tpAction.getCommnProtocol());
        System.out.println("transferMode is " + tpAction.getTransferMode());
        //  if(commonProtocol.equals("-1") && transferMode.equals("null"))
        //{
       
        StringBuffer profileSearchQuery = new StringBuffer();
        
        profileSearchQuery.append("SELECT ID, PROTOCOL, TRANSFER_MODE, CREATED_BY, CREATED_TS FROM MSCVP.TPO_COMMUNICATION WHERE");
           if (tpAction.getCommnProtocol() != null && !"-1".equals(tpAction.getCommnProtocol().trim())) {
              profileSearchQuery.append(" PROTOCOL='" + tpAction.getCommnProtocol() + "' AND");
        }
        if (tpAction.getTransferMode() != null && !"".equals(tpAction.getTransferMode().trim())) {
            profileSearchQuery.append(" TRANSFER_MODE='" + tpAction.getTransferMode() + "' AND");
        }
        profileSearchQuery.append(" PARTNER_ID='" + partnerId + "'");
        System.out.println("Query is " + profileSearchQuery);
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.createStatement();
            resultSet = statement.executeQuery(profileSearchQuery.toString());
            tpoSearchProfileList = new ArrayList<TpOnboardingBean>();

            while (resultSet.next()) {
                TpOnboardingBean tpOnboardingBean = new TpOnboardingBean();
                tpOnboardingBean.setId(resultSet.getInt("ID"));
                tpOnboardingBean.setCommnProtocol(resultSet.getString("PROTOCOL"));
                tpOnboardingBean.setTransferMode(resultSet.getString("TRANSFER_MODE"));
                tpOnboardingBean.setCreayed_by(resultSet.getString("CREATED_BY"));
                tpOnboardingBean.setCreayed_ts(resultSet.getTimestamp("CREATED_TS"));
                tpoSearchProfileList.add(tpOnboardingBean);

            }
        } catch (Exception ex) {
            Logger.getLogger(TpOnboardingServiceImpl.class.getName()).log(Level.SEVERE, null, ex);
        }

        System.out.println("tpoSearchProfileList----------" + tpoSearchProfileList);
        return tpoSearchProfileList;
    }

    @Override
    public String tpoDeleteProfile(int communicationId) {
        String query = "DELETE FROM MSCVP.TPO_COMMUNICATION WHERE ID=" + communicationId;
        int n = 0;
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.createStatement();
            n = statement.executeUpdate(query);

            System.out.println("n is " + n);
        } catch (Exception e) {
            Logger.getLogger(TpOnboardingServiceImpl.class.getName()).log(Level.SEVERE, null, e);
        }
        if (n > 0) {
            return "success";
        } else {
            return "falied";
        }
    }

    @Override
    public TpOnboardingAction tpogetProfile(int Id, String commonprotocol) {
        TpOnboardingAction tpOnboardingAction = null;
        try {
            int partnerId = 0;
            System.out.println("id-------"+Id);
            System.out.println("commonprotocol-------"+commonprotocol);
           tpOnboardingAction=new TpOnboardingAction();
            connection = ConnectionProvider.getInstance().getConnection();
           
            String profileInfoQuery = "select TPO_FTP.COMMUNICATION_ID,TPO_FTP.PARTNER_ID,TPO_FTP.TRANSFER_MODE,TPO_FTP.FTP_METHOD, "
                    + "TPO_FTP.RECEIVING_PROTOCOL,TPO_FTP.FTP_HOST,TPO_FTP.FTP_PORT,TPO_FTP.FTP_USER_ID,TPO_FTP.FTP_PASSWORD,TPO_FTP.FTP_DIRECTORY,"
                    + "TPO_FTP.CONNECTION_METHOD,TPO_FTP.RESPONSE_TIMEOUT_SEC,TPO_COMMUNICATION.PROTOCOL,TPO_FTP.SSL_FLAG"
                    + " from TPO_FTP join TPO_COMMUNICATION on (TPO_FTP.COMMUNICATION_ID = TPO_COMMUNICATION.ID) where TPO_FTP.COMMUNICATION_ID ="+ Id + " "
                   + "and TPO_COMMUNICATION.PROTOCOL='"+commonprotocol+"'";
            System.out.println("profileInfoQuery------"+profileInfoQuery.toString());
            preparedStatement = connection.prepareStatement(profileInfoQuery.toString());
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next()) {
               tpOnboardingAction.setCommunicationId(Integer.toString(resultSet.getInt("COMMUNICATION_ID")));
               tpOnboardingAction.setId(resultSet.getInt("PARTNER_ID"));
               tpOnboardingAction.setTransferMode(resultSet.getString("TRANSFER_MODE"));
               tpOnboardingAction.setFtp_method(resultSet.getString("FTP_METHOD"));
               tpOnboardingAction.setFtp_recv_protocol(resultSet.getString("RECEIVING_PROTOCOL"));
               tpOnboardingAction.setFtp_host(resultSet.getString("FTP_HOST"));
               tpOnboardingAction.setFtp_port(resultSet.getString("FTP_PORT"));
               tpOnboardingAction.setFtp_userId(resultSet.getString("FTP_USER_ID"));
               tpOnboardingAction.setFtp_pwd(resultSet.getString("FTP_PASSWORD"));
               tpOnboardingAction.setFtp_directory(resultSet.getString("FTP_DIRECTORY"));
               tpOnboardingAction.setFtp_conn_method(resultSet.getString("CONNECTION_METHOD"));
               tpOnboardingAction.setFtp_resp_time(resultSet.getInt("RESPONSE_TIMEOUT_SEC"));
              tpOnboardingAction.setCommnProtocol(commonprotocol);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
           
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
            } catch (Exception sqle) {
                sqle.printStackTrace();
                
            }
        }
        System.out.println("tpOnboardingAction-----"+tpOnboardingAction.getCommnProtocol());
        System.out.println("tpOnboardingAction-----"+tpOnboardingAction.getTransferMode());
        System.out.println("tpOnboardingAction-----"+tpOnboardingAction.getFtp_conn_method());
        return tpOnboardingAction;
    }
}
