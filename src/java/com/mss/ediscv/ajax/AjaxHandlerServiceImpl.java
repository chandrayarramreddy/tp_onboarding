/*
 * AjaxHandlerServiceImpl.java
 *
 * Created on June 11, 2008, 12:57 AM
 *greensheetListSearch
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mss.ediscv.ajax;

import com.mss.ediscv.util.ConnectionProvider;
import com.mss.ediscv.util.ServiceLocatorException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import java.io.File;

import java.util.StringTokenizer;
import com.mss.ediscv.util.FileUtility;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import java.sql.Statement;

import com.mss.ediscv.util.DataSourceDataProvider;
import com.mss.ediscv.util.DateUtility;
import com.mss.ediscv.util.WildCardSql;
import java.sql.CallableStatement;
import java.sql.Types;
import java.util.Iterator;
import java.util.Map.Entry;
import org.json.JSONObject;

/**
 *
 * @author miracle
 */
public class AjaxHandlerServiceImpl implements AjaxHandlerService {

    /**
     *
     * Creating a reference variable for Connection
     */
    private Connection connection;
    /**
     *
     * Creating a reference variable for preparedStatement
     */
    private PreparedStatement preparedStatement;
    /**
     *
     * Creating a reference variable for Resultset
     */
    private ResultSet resultSet;
    /**
     *
     * Creating a reference variable for String Buffer
     */
    private StringBuffer stringBuffer;
    /**
     *
     * Creating a String queryString used to store SQL Query
     */
    private String queryString;
    /**
     *
     * Creating a boolean flag to return true or false
     */
    private boolean flag;
    /**
     *
     * Creating a String noRecords to replace spaces in Ajax response
     */
    private String noRecords = "no records";
    private HttpServletRequest httpServletRequest;
    /** Creates a new instance of AjaxHandlerServiceImpl */
    private StringBuffer queryStringBuffer;
    /**
     * Tp statement
     */
    private Statement statement;
    /**
     * Life cycle Beans
     * 
     */

    public AjaxHandlerServiceImpl() {
    }

    /**
     *
     * This method is used to get the Consultant Details
     * @param consultantMail
     * @return String
     * @throws com.mss.mirage.util.ServiceLocatorException
     */
   

    public String getProtocolDetails(String transferMode, String protocol, String partnerName) throws ServiceLocatorException {
        stringBuffer = new StringBuffer();
        Statement statement = null;
        ResultSet resultSet = null;
        JSONObject subJson = null;
        int partnerId = 0;
        int i = 0;
        String empty = "";
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.createStatement();

            String partnerIdQuery = "SELECT max(ID) as partnerId FROM MSCVP.TPO_USER WHERE PARTNER_NAME ='" + partnerName + "'";
            statement = connection.createStatement();
            resultSet = statement.executeQuery(partnerIdQuery);
            if (resultSet.next()) {
                partnerId = resultSet.getInt("partnerId");
            }

            if ("FTP".equalsIgnoreCase(protocol)) {
                String ftpTransferModeQuery = "";
                String ftpSslQuery = "";
                String ftp_ssl_req = "";
                subJson = new JSONObject();
                if ("get".equalsIgnoreCase(transferMode)) {
                    i = 1;
                    ftpTransferModeQuery = "SELECT ID,PARTNER_ID,PARTNER_NAME,FTP_METHOD,RECEIVING_PROTOCOL,FTP_HOST,FTP_PORT,"
                            + "FTP_USER_ID,FTP_PASSWORD,FTP_DIRECTORY,CONNECTION_METHOD,RESPONSE_TIMEOUT_SEC,TRANSFER_MODE,"
                            + "SSL_FLAG,CREATED_BY,CREATED_TS,MODIFIED_BY,MODIFIED_TS "
                            + "FROM MSCVP.TPO_FTP WHERE  RECEIVING_PROTOCOL = 'FTP' AND ID = 1 AND TRANSFER_MODE = 'get'";
                    resultSet = statement.executeQuery(ftpTransferModeQuery);
                    if (resultSet.next()) {
                        subJson.put("FTP_METHOD", resultSet.getString("FTP_METHOD"));
                        subJson.put("CONNECTION_METHOD", resultSet.getString("CONNECTION_METHOD"));
                        subJson.put("RECEIVING_PROTOCOL", resultSet.getString("RECEIVING_PROTOCOL"));
                        subJson.put("RESPONSE_TIMEOUT_SEC", resultSet.getInt("RESPONSE_TIMEOUT_SEC"));
                        subJson.put("FTP_HOST", resultSet.getString("FTP_HOST"));
                        subJson.put("FTP_PORT", resultSet.getString("FTP_PORT"));
                        subJson.put("FTP_USER_ID", resultSet.getString("FTP_USER_ID"));
                        subJson.put("FTP_PASSWORD", resultSet.getString("FTP_PASSWORD"));
                        subJson.put("FTP_DIRECTORY", resultSet.getString("FTP_DIRECTORY"));
                        ftp_ssl_req = resultSet.getString("SSL_FLAG");
                        subJson.put("SSL_REQUIRED_FLAG", ftp_ssl_req);
                    }
                    if ("true".equalsIgnoreCase(ftp_ssl_req)) {
                        ftpSslQuery = "SELECT ID, PROTOCOL, SSL_PRIORITY, KEY_CERTIFICATE_PASSPHRASE, CIPHER_STRENGTH, KEY_CERTIFICATE, CA_CERTIFICATES, TP_FLAG,PARTNER_ID,TRANSFER_MODE FROM MSCVP.TPO_SSL WHERE TRANSFER_MODE = 'get' AND PROTOCOL = 'FTP' AND ID = 1";
                        resultSet = statement.executeQuery(ftpSslQuery);
                        if (resultSet.next()) {
                            subJson.put("SSL_PRIORITY", resultSet.getString("SSL_PRIORITY"));
                            subJson.put("KEY_CERTIFICATE_PASSPHRASE", resultSet.getString("KEY_CERTIFICATE_PASSPHRASE"));
                            subJson.put("CIPHER_STRENGTH", resultSet.getString("CIPHER_STRENGTH"));
                        }
                    }
                } else if ("put".equalsIgnoreCase(transferMode)) {
                    String isFTPexist = "SELECT count(ID) AS FTP_COUNT FROM MSCVP.TPO_FTP WHERE RECEIVING_PROTOCOL = 'FTP' AND TRANSFER_MODE = 'put' AND PARTNER_ID = " + partnerId;
                    resultSet = statement.executeQuery(isFTPexist);
                    if (resultSet.next()) {
                        i = resultSet.getInt("FTP_COUNT");
                    }
                    if (i > 0) {
                        ftpTransferModeQuery = "SELECT ID,PARTNER_ID,PARTNER_NAME,FTP_METHOD,RECEIVING_PROTOCOL,FTP_HOST,FTP_PORT,"
                                + "FTP_USER_ID,FTP_PASSWORD,FTP_DIRECTORY,CONNECTION_METHOD,RESPONSE_TIMEOUT_SEC,TRANSFER_MODE,"
                                + "SSL_FLAG,CREATED_BY,CREATED_TS,MODIFIED_BY,MODIFIED_TS "
                                + "FROM MSCVP.TPO_FTP WHERE RECEIVING_PROTOCOL = 'FTP' AND TRANSFER_MODE = 'put' AND PARTNER_ID = " + partnerId;
                        resultSet = statement.executeQuery(ftpTransferModeQuery);
                        if (resultSet.next()) {
                            subJson.put("FTP_METHOD", resultSet.getString("FTP_METHOD"));
                            subJson.put("CONNECTION_METHOD", resultSet.getString("CONNECTION_METHOD"));
                            subJson.put("RECEIVING_PROTOCOL", resultSet.getString("RECEIVING_PROTOCOL"));
                            subJson.put("RESPONSE_TIMEOUT_SEC", resultSet.getInt("RESPONSE_TIMEOUT_SEC"));
                            subJson.put("FTP_HOST", resultSet.getString("FTP_HOST"));
                            subJson.put("FTP_PORT", resultSet.getString("FTP_PORT"));
                            subJson.put("FTP_USER_ID", resultSet.getString("FTP_USER_ID"));
                            subJson.put("FTP_PASSWORD", resultSet.getString("FTP_PASSWORD"));
                            subJson.put("FTP_DIRECTORY", resultSet.getString("FTP_DIRECTORY"));
                            ftp_ssl_req = resultSet.getString("SSL_FLAG");
                            subJson.put("SSL_REQUIRED_FLAG", ftp_ssl_req);
                        }
                        if ("true".equalsIgnoreCase(ftp_ssl_req)) {
                            ftpSslQuery = "SELECT ID, PROTOCOL, SSL_PRIORITY, KEY_CERTIFICATE_PASSPHRASE, CIPHER_STRENGTH, KEY_CERTIFICATE, CA_CERTIFICATES, TP_FLAG,PARTNER_ID,TRANSFER_MODE FROM MSCVP.TPO_SSL WHERE TRANSFER_MODE = 'put' AND PROTOCOL = 'FTP' AND PARTNER_ID = " + partnerId;
                            resultSet = statement.executeQuery(ftpSslQuery);
                            if (resultSet.next()) {
                                subJson.put("SSL_PRIORITY", resultSet.getString("SSL_PRIORITY"));
                                subJson.put("KEY_CERTIFICATE_PASSPHRASE", resultSet.getString("KEY_CERTIFICATE_PASSPHRASE"));
                                subJson.put("CIPHER_STRENGTH", resultSet.getString("CIPHER_STRENGTH"));
                            }
                        }
                    } else {
                        empty = "";
                    }

                }
            } else if ("SFTP".equalsIgnoreCase(protocol)) {
                String sftpTransferModeQuery = "";
                if ("get".equalsIgnoreCase(transferMode)) {
                    i = 1;
                    sftpTransferModeQuery = "SELECT ID,PARTNER_ID,CONN_METHOD,MY_SSH_PUB_KEY,UPL_YOUR_SSH_PUB_KEY,REMOTE_HOST_IP_ADD,"
                            + "REMOTE_USERID,METHOD,AUTH_METHOD,REMOTE_PORT,REMOTE_PWD,DIRECTORY,TRANSFER_MODE,CREATED_BY,"
                            + "CREATED_TS,MODIFIED_BY,MODIFIED_TS FROM MSCVP.TPO_SFTP WHERE ID = 1 AND TRANSFER_MODE = 'get'";
                    resultSet = statement.executeQuery(sftpTransferModeQuery);
                    if (resultSet.next()) {
                        subJson = new JSONObject();
                        subJson.put("CONN_METHOD", resultSet.getString("CONN_METHOD"));
                        subJson.put("AUTH_METHOD", resultSet.getString("AUTH_METHOD"));
                        //subJson.put("MY_SSH_PUB_KEY", resultSet.getString("MY_SSH_PUB_KEY"));
                        // subJson.put("UPL_YOUR_SSH_PUB_KEY", resultSet.getInt("UPL_YOUR_SSH_PUB_KEY"));
                        subJson.put("REMOTE_HOST_IP_ADD", resultSet.getString("REMOTE_HOST_IP_ADD"));
                        subJson.put("REMOTE_PORT", resultSet.getString("REMOTE_PORT"));
                        subJson.put("REMOTE_USERID", resultSet.getString("REMOTE_USERID"));
                        subJson.put("REMOTE_PWD", resultSet.getString("REMOTE_PWD"));
                        subJson.put("METHOD", resultSet.getString("METHOD"));
                        subJson.put("DIRECTORY", resultSet.getString("DIRECTORY"));
                    }
                } else if ("put".equalsIgnoreCase(transferMode)) {
                    String isSFTPexist = "SELECT count(ID) AS SFTP_COUNT FROM MSCVP.TPO_SFTP WHERE TRANSFER_MODE = 'put' AND PARTNER_ID = " + partnerId;
                    resultSet = statement.executeQuery(isSFTPexist);
                    if (resultSet.next()) {
                        i = resultSet.getInt("SFTP_COUNT");
                    }
                    if (i > 0) {
                        sftpTransferModeQuery = "SELECT ID,PARTNER_ID,CONN_METHOD,MY_SSH_PUB_KEY,UPL_YOUR_SSH_PUB_KEY,REMOTE_HOST_IP_ADD,"
                                + "REMOTE_USERID,METHOD,AUTH_METHOD,REMOTE_PORT,REMOTE_PWD,DIRECTORY,TRANSFER_MODE,CREATED_BY,"
                                + "CREATED_TS,MODIFIED_BY,MODIFIED_TS FROM MSCVP.TPO_SFTP WHERE TRANSFER_MODE = 'put' AND PARTNER_ID = " + partnerId;
                        resultSet = statement.executeQuery(sftpTransferModeQuery);
                        if (resultSet.next()) {
                            subJson = new JSONObject();
                            subJson.put("CONN_METHOD", resultSet.getString("CONN_METHOD"));
                            subJson.put("AUTH_METHOD", resultSet.getString("AUTH_METHOD"));
                            //subJson.put("MY_SSH_PUB_KEY", resultSet.getString("MY_SSH_PUB_KEY"));
                            // subJson.put("UPL_YOUR_SSH_PUB_KEY", resultSet.getInt("UPL_YOUR_SSH_PUB_KEY"));
                            subJson.put("REMOTE_HOST_IP_ADD", resultSet.getString("REMOTE_HOST_IP_ADD"));
                            subJson.put("REMOTE_PORT", resultSet.getString("REMOTE_PORT"));
                            subJson.put("REMOTE_USERID", resultSet.getString("REMOTE_USERID"));
                            subJson.put("REMOTE_PWD", resultSet.getString("REMOTE_PWD"));
                            subJson.put("METHOD", resultSet.getString("METHOD"));
                            subJson.put("DIRECTORY", resultSet.getString("DIRECTORY"));
                        }
                    } else {
                        empty = "";
                    }

                }
            } else if ("HTTP".equalsIgnoreCase(protocol)) {
                String httpTransferModeQuery = "";
                String http_ssl_req = "";
                String httpSslQuery = "";
                subJson = new JSONObject();
                if ("put".equalsIgnoreCase(transferMode)) {
                    i = 1;
                    httpTransferModeQuery = "SELECT ID, PARTNER_ID, RECEIVING_PROTOCOL, HTTP_END_POINT, HTTP_MODE, RESPONSE_TIMEOUT_SEC, HTTP_PORT, "
                            + "SSL_FLAG, TRANSFER_MODE, CREATED_BY, CREATED_TS, MODIFIED_BY, MODIFIED_TS,URL "
                            + "FROM MSCVP.TPO_HTTP WHERE ID = 1 AND TRANSFER_MODE = 'put'";
                    resultSet = statement.executeQuery(httpTransferModeQuery);
                    if (resultSet.next()) {
                        subJson.put("RECEIVING_PROTOCOL", resultSet.getString("RECEIVING_PROTOCOL"));
                        subJson.put("RESPONSE_TIMEOUT_SEC", resultSet.getString("RESPONSE_TIMEOUT_SEC"));
                        subJson.put("HTTP_END_POINT", resultSet.getString("HTTP_END_POINT"));
                        subJson.put("HTTP_PORT", resultSet.getInt("HTTP_PORT"));
                        subJson.put("HTTP_MODE", resultSet.getString("HTTP_MODE"));
                        http_ssl_req = resultSet.getString("SSL_FLAG");
                        subJson.put("SSL_REQUIRED", http_ssl_req);
                    }
                    if ("true".equalsIgnoreCase(http_ssl_req)) {
                        httpSslQuery = "SELECT ID, PROTOCOL, SSL_PRIORITY, KEY_CERTIFICATE_PASSPHRASE, CIPHER_STRENGTH, KEY_CERTIFICATE, CA_CERTIFICATES, TP_FLAG,PARTNER_ID,TRANSFER_MODE FROM MSCVP.TPO_SSL WHERE TRANSFER_MODE = 'put' AND PROTOCOL = 'HTTP' AND ID = 3";
                        resultSet = statement.executeQuery(httpSslQuery);
                        if (resultSet.next()) {
                            subJson.put("SSL_PRIORITY", resultSet.getString("SSL_PRIORITY"));
                            subJson.put("KEY_CERTIFICATE_PASSPHRASE", resultSet.getString("KEY_CERTIFICATE_PASSPHRASE"));
                            subJson.put("CIPHER_STRENGTH", resultSet.getString("CIPHER_STRENGTH"));
                        }
                    }
                } else if ("get".equalsIgnoreCase(transferMode)) {
                    String isHTTPexist = "SELECT count(ID) AS HTTP_COUNT FROM MSCVP.TPO_HTTP WHERE TRANSFER_MODE = 'get' AND PARTNER_ID = " + partnerId;
                    resultSet = statement.executeQuery(isHTTPexist);
                    if (resultSet.next()) {
                        i = resultSet.getInt("HTTP_COUNT");
                    }
                    if (i > 0) {
                        httpTransferModeQuery = "SELECT ID, PARTNER_ID, RECEIVING_PROTOCOL, HTTP_END_POINT, HTTP_MODE, RESPONSE_TIMEOUT_SEC, HTTP_PORT, "
                                + "SSL_FLAG, TRANSFER_MODE, CREATED_BY, CREATED_TS, MODIFIED_BY, MODIFIED_TS,URL "
                                + "FROM MSCVP.TPO_HTTP WHERE TRANSFER_MODE = 'get' AND PARTNER_ID = " + partnerId;
                        resultSet = statement.executeQuery(httpTransferModeQuery);
                        if (resultSet.next()) {
                            subJson.put("RECEIVING_PROTOCOL", resultSet.getString("RECEIVING_PROTOCOL"));
                            subJson.put("RESPONSE_TIMEOUT_SEC", resultSet.getString("RESPONSE_TIMEOUT_SEC"));
                            subJson.put("HTTP_END_POINT", resultSet.getString("HTTP_END_POINT"));
                            subJson.put("HTTP_PORT", resultSet.getInt("HTTP_PORT"));
                            subJson.put("HTTP_MODE", resultSet.getString("HTTP_MODE"));
                            subJson.put("URL", resultSet.getString("URL"));
                            http_ssl_req = resultSet.getString("SSL_FLAG");
                            subJson.put("SSL_REQUIRED", http_ssl_req);
                        }
                        if ("true".equalsIgnoreCase(http_ssl_req)) {
                            httpSslQuery = "SELECT ID, PROTOCOL, SSL_PRIORITY, KEY_CERTIFICATE_PASSPHRASE, CIPHER_STRENGTH, KEY_CERTIFICATE, CA_CERTIFICATES, TP_FLAG,PARTNER_ID,TRANSFER_MODE FROM MSCVP.TPO_SSL WHERE TRANSFER_MODE = 'get' AND PROTOCOL = 'HTTP' AND PARTNER_ID = " + partnerId;
                            resultSet = statement.executeQuery(httpSslQuery);
                            if (resultSet.next()) {
                                subJson.put("SSL_PRIORITY", resultSet.getString("SSL_PRIORITY"));
                                subJson.put("KEY_CERTIFICATE_PASSPHRASE", resultSet.getString("KEY_CERTIFICATE_PASSPHRASE"));
                                subJson.put("CIPHER_STRENGTH", resultSet.getString("CIPHER_STRENGTH"));
                            }
                        }
                    } else {
                        empty = "";
                    }

                }
            } else if ("SMTP".equalsIgnoreCase(protocol)) {
                String isSMTPexist = "SELECT count(ID) AS SMTP_COUNT FROM MSCVP.TPO_SMTP WHERE PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(isSMTPexist);
                if (resultSet.next()) {
                    i = resultSet.getInt("SMTP_COUNT");
                }
                if (i > 0) {
                    String smtpTransferModeQuery = "SELECT ID,PARTNER_ID,RECEIVING_PROTOCOL,SMTP_SERVER_PORT,TO_EMAIL_ADDRESS,SMTP_SERVER_HOST,"
                            + "FROM_EMAIL_ADDRESS,TRANSFER_MODE,CREATED_BY,CREATED_TS,MODIFIED_BY,MODIFIED_TS "
                            + "FROM MSCVP.TPO_SMTP WHERE PARTNER_ID = " + partnerId;
                    resultSet = statement.executeQuery(smtpTransferModeQuery);
                    if (resultSet.next()) {
                        subJson = new JSONObject();
                        subJson.put("RECEIVING_PROTOCOL", resultSet.getString("RECEIVING_PROTOCOL"));
                        subJson.put("SMTP_SERVER_HOST", resultSet.getString("SMTP_SERVER_HOST"));
                        subJson.put("SMTP_SERVER_PORT", resultSet.getString("SMTP_SERVER_PORT"));
                        subJson.put("FROM_EMAIL_ADDRESS", resultSet.getString("FROM_EMAIL_ADDRESS"));
                        subJson.put("TO_EMAIL_ADDRESS", resultSet.getString("TO_EMAIL_ADDRESS"));
                    }
                } else {
                    empty = "";
                }
            } else if ("AS2".equalsIgnoreCase(protocol)) {
                String as2_ssl_req = "";
                String as2SslQuery = "";
                subJson = new JSONObject();
                String isSMTPexist = "SELECT count(ID) AS AS2_COUNT FROM MSCVP.TPO_AS2 WHERE PARTNER_ID = " + partnerId;
                resultSet = statement.executeQuery(isSMTPexist);
                if (resultSet.next()) {
                    i = resultSet.getInt("AS2_COUNT");
                }
                if (i > 0) {
                    String as2TransferModeQuery = "SELECT ID,PARTNER_ID,DWL_MY_SYS_CERT,UPL_YOUR_SYS_CERT,MY_ORG,YOUR_ORG,MY_PART_PRO_NAME,YOUR_PART_PRO_NAME,"
                            + "MY_END_POINT,YOUR_END_POINT,STR_AS2_MSG_IN,WAIT_FOR_SYNC_MDN_PROC,SSL_FLAG,CREATED_BY,CREATED_TS,MODIFIED_BY,"
                            + "MODIFIED_TS,TRANSFER_MODE FROM MSCVP.TPO_AS2 WHERE PARTNER_ID =  " + partnerId;
                    resultSet = statement.executeQuery(as2TransferModeQuery);
                    if (resultSet.next()) {
                        //subJson.put("DWL_MY_SYS_CERT", resultSet.getString("DWL_MY_SYS_CERT"));
                        //subJson.put("UPL_YOUR_SYS_CERT", resultSet.getString("UPL_YOUR_SYS_CERT"));
                        subJson.put("MY_ORG", resultSet.getString("MY_ORG"));
                        subJson.put("YOUR_ORG", resultSet.getString("YOUR_ORG"));
                        subJson.put("MY_PART_PRO_NAME", resultSet.getString("MY_PART_PRO_NAME"));
                        subJson.put("YOUR_PART_PRO_NAME", resultSet.getString("YOUR_PART_PRO_NAME"));
                        subJson.put("MY_END_POINT", resultSet.getString("MY_END_POINT"));
                        subJson.put("YOUR_END_POINT", resultSet.getString("YOUR_END_POINT"));
                        subJson.put("STR_AS2_MSG_IN", resultSet.getString("STR_AS2_MSG_IN"));
                        subJson.put("TRANSFER_MODE", resultSet.getString("TRANSFER_MODE"));
                        subJson.put("WAIT_FOR_SYNC_MDN_PROC", resultSet.getString("WAIT_FOR_SYNC_MDN_PROC"));
                        // subJson.put("SSL_REQ", resultSet.getString("SSL_FLAG"));
                        as2_ssl_req = resultSet.getString("SSL_FLAG");
                        subJson.put("SSL_REQ", as2_ssl_req);
                    }
                    if ("true".equalsIgnoreCase(as2_ssl_req)) {
                        as2SslQuery = "SELECT ID, PROTOCOL, SSL_PRIORITY, KEY_CERTIFICATE_PASSPHRASE, CIPHER_STRENGTH, KEY_CERTIFICATE, CA_CERTIFICATES, TP_FLAG,PARTNER_ID,TRANSFER_MODE FROM MSCVP.TPO_SSL WHERE PROTOCOL = 'AS2' AND PARTNER_ID =  " + partnerId;
                        resultSet = statement.executeQuery(as2SslQuery);
                        if (resultSet.next()) {
                            subJson.put("SSL_PRIORITY", resultSet.getString("SSL_PRIORITY"));
                            subJson.put("KEY_CERTIFICATE_PASSPHRASE", resultSet.getString("KEY_CERTIFICATE_PASSPHRASE"));
                            subJson.put("CIPHER_STRENGTH", resultSet.getString("CIPHER_STRENGTH"));
                        }
                    }
                } else {
                    empty = "";
                }
            }

        } catch (Exception sqe) {
            sqe.printStackTrace();
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                    resultSet = null;
                }
                if (statement != null) {
                    statement.close();
                    statement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException sqle) {
            }
        }
        if (i > 0) {
            return subJson.toString();
        } else {
            return empty;
        }
    }

    public String isExistedPartnerName(String partnerName) throws ServiceLocatorException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String responseString = "";
        try {
            queryString = "SELECT NAME FROM TPO_PARTNERS where REPLACE(UPPER(NAME),' ','')=REPLACE(UPPER('" + partnerName + "'),' ','') ";
            // queryString = "SELECT PARTNER_NAME FROM TPO_USER where PARTNER_NAME='"+ partnerName +"'";
            System.out.println("queryString----" + queryString);
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.prepareStatement(queryString);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                responseString = "No";
            } else {
                responseString = "Yes";
            }
        } catch (Exception sqe) {
            sqe.printStackTrace();
            responseString = "<font size='2' color='red'>Error!</font>";
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                    resultSet = null;
                }
                if (statement != null) {
                    statement.close();
                    statement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException sqle) {
            }
        }
        return responseString;
    }

    public String isExistedUserEmail(String email) throws ServiceLocatorException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String responseString = "";
        try {
            //  queryString = "SELECT EMAIL FROM TPO_USER where REPLACE(UPPER(EMAIL),' ','')=REPLACE(UPPER('" + email + "'),' ','')  ";
            queryString = "SELECT EMAIL FROM TPO_USER where EMAIL='" + email + "'";
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.prepareStatement(queryString);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                responseString = "No";
            } else {
                responseString = "Yes";
            }
        } catch (Exception sqe) {
            sqe.printStackTrace();
            responseString = "<font size='2' color='red'>Error!</font>";
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                    resultSet = null;
                }
                if (statement != null) {
                    statement.close();
                    statement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException sqle) {
            }
        }
        return responseString;
    }

    public String isExistedAS2PartnerProfileName(String name,String partnerName) throws ServiceLocatorException {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        String responseString = "";
        int partnerId = DataSourceDataProvider.getInstance().getTPOPartnerId(partnerName);
        try {
            queryString = "SELECT MY_ORG FROM TPO_AS2 where (REPLACE(UPPER(MY_ORG),' ','')=REPLACE(UPPER('" + name + "'),' ','')) AND PARTNER_ID != "+partnerId;
            System.out.println("queryString::"+queryString);
            connection = ConnectionProvider.getInstance().getConnection();
            statement = connection.prepareStatement(queryString);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                responseString = "No";
            } else {
                responseString = "Yes";
            }
        } catch (Exception sqe) {
            sqe.printStackTrace();
            responseString = "<font size='2' color='red'>Error!</font>";
        } finally {
            try {
                if (resultSet != null) {
                    resultSet.close();
                    resultSet = null;
                }
                if (statement != null) {
                    statement.close();
                    statement = null;
                }
                if (connection != null) {
                    connection.close();
                    connection = null;
                }
            } catch (SQLException sqle) {
            }
        }
        return responseString;
    }
    
      public String doAddTpoPartner(AjaxHandlerAction ajaxHandlerAction,String loginId) throws ServiceLocatorException {
        Connection connection = null;
        Statement statement = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        int insertedRows = 0;
        String responseString = "";
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            System.out.println("pName:"+ajaxHandlerAction.getAddpartnerName()+" phno:"+ajaxHandlerAction.getAddphoneNo());
            System.out.println("add:"+ajaxHandlerAction.getAddaddress1()+" city:"+ajaxHandlerAction.getAddcity());
            System.out.println("state:"+ajaxHandlerAction.getAddstate()+" country:"+ajaxHandlerAction.getAddcountry());
            System.out.println("zip:"+ajaxHandlerAction.getAddzipCode()+" loginId:"+loginId);
            System.out.println("Timestamp:"+(DateUtility.getInstance().getCurrentDB2Timestamp()));

            queryString = "INSERT INTO MSCVP.TPO_PARTNERS (NAME, PHONE_NO, ADDRESS, CITY, STATE, COUNTRY, ZIPCODE,"
                    + " CREATED_BY, CREATED_TS) VALUES (?,?,?,?,?,?,?,?,?)";
            preparedStatement = connection.prepareStatement(queryString);
            preparedStatement.setString(1, ajaxHandlerAction.getAddpartnerName());
            preparedStatement.setString(2, ajaxHandlerAction.getAddphoneNo());
            preparedStatement.setString(3, ajaxHandlerAction.getAddaddress1());
            preparedStatement.setString(4, ajaxHandlerAction.getAddcity());
            preparedStatement.setString(5, ajaxHandlerAction.getAddstate());
            preparedStatement.setString(6, ajaxHandlerAction.getAddcountry());
            preparedStatement.setString(7, ajaxHandlerAction.getAddzipCode());
            preparedStatement.setString(8, loginId);
            preparedStatement.setTimestamp(9, DateUtility.getInstance().getCurrentDB2Timestamp());
            insertedRows = preparedStatement.executeUpdate();
            if (insertedRows > 0) {
                responseString = "<font size='2' color='green'>Partner added successfully</font>";
            } else {
                responseString = "<font size='2' color='red'>Error occured while adding partner!</font>";
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } catch (ServiceLocatorException sle) {
            sle.printStackTrace();
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
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
        return responseString;
    }
      
       public String getDeleteProfile(int id) throws ServiceLocatorException {
        int count = 0;
        String responseString = "";
        try {
            connection = ConnectionProvider.getInstance().getConnection();
            String query = "DELETE FROM MSCVP.TPO_COMMUNICATION WHERE ID='" + id + "'";
            preparedStatement = connection.prepareStatement(query);
            count = preparedStatement.executeUpdate();
            if (count > 0) {
                responseString = "<font color='red'>Profile deleted '" +id + "' sucessfully</font>";
            } else {
                responseString = "<font color='red'>Profile deleted '" + id + "' filaed</font>";
            }
        } catch (SQLException e) {
            //  e.printStackTrace();
        } catch (Exception ex) {
            //System.out.println("hi"+ex.getMessage());
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
                throw new ServiceLocatorException(se);
            }
        }
        return responseString;
    }

    /**
     * This method is used to get the Consultant Resumes
     * @param consultantId
     * @return String
     * @throws com.mss.mirage.util.ServiceLocatorException
     */
    public HttpServletRequest getHttpServletRequest() {
        return httpServletRequest;
    }

    public void setHttpServletRequest(HttpServletRequest httpServletRequest) {
        this.httpServletRequest = httpServletRequest;
    }
}
