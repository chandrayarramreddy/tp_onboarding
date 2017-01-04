<%@page import="com.mss.ediscv.tpOnboarding.TpOnboardingBean"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.mss.ediscv.util.AppConstants"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Miracle TP On-boarding portal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
        <link rel="stylesheet" href='<s:url value="/includes/css/style.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/jquery-ui.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/dhtmlxcalendar.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/dhtmlxcalendar_omega.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/footerstyle.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>' type="text/css"/>
        <script language="JavaScript" src='<s:url value="/includes/js/jquery-1.9.1.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/jquery-ui.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/GridNavigation.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/generalValidations.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/GeneralAjax.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/modernizr-1.5.min.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/dhtmlxcalendar.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/dbgridDisplay.js"/>'></script>
        <script language="JavaScript"
        src='<s:url value="/includes/js/tpOnbordingDeatails.js"/>'></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <style>
            .fld_disable input{
                -webkit-user-select: none;  /* Chrome all / Safari all */
                -moz-user-select: none;     /* Firefox all */
                -ms-user-select: none;      /* IE 10+ */
                user-select: none;     
            }
            .tab_head td{
                background: transparent;   
                text-align: center;
            }
            .tab_head{
                background: #88e2f8;
            }
            .tooltip > i{
                color:#0174DF;
                font-size:16px;
            }
            .tooltip1 > i{
                color:#0174DF;
                font-size:16px;
            }
            .tooltip {
                position: relative;
                display: inline-block;
            }
            .tooltip .tooltiptext {
                visibility: hidden;
                width: 250px;
                background-color: black;
                color: #fff;
                text-align: center;
                border-radius: 6px;
                padding: 5px 0;
                top:23px;
                left:-32px;
                /* Position the tooltip */
                position: absolute;
                z-index: 1;
            }
            .tooltip:hover .tooltiptext {
                visibility: visible;
            }
            .loadingImg {
                width: 100%;
                height: 100%;
                top: 0px;
                left: 0px;
                position: fixed;
                display: block;
                opacity: 0.7;
                background-color: #9999C2;
                z-index: 99;
                text-align: center;
            }

            #LoadingContent {
                position: absolute;
                top: 50%;
                left: 50%;
                z-index: 100;
            }
            #LoadingContent > img{
                width:150px;
            }
        </style>
    </head>
    <body onload="displaydiv()">

        <script type="text/javascript" src='<s:url value="/includes/js/wz_tooltip.js"/>'></script>
        <div id="wrapper">
            <div id="main">
                <header>
                    <div id="logo"><s:include value="/includes/template/tpohead.jsp"/></div>

                </header>
                <div id="site_content">
                    <div id="sidebar_container"></div>
                    <div class="content" >
                        <div class="content_item" id="searchdiv">
                            <%
                                if (session.getAttribute(AppConstants.REQ_RESULT_MSG) != null) {
                                    String reqponseString = session.getAttribute(AppConstants.REQ_RESULT_MSG).toString();
                                    //request.getSession(false).removeAttribute("responseString");
                                    out.println(reqponseString);
                                    session.setAttribute(AppConstants.REQ_RESULT_MSG, null);
                                    //System.out.println("reqponseString-------"+reqponseString);
                                }

                            %>
                            <h3>Trading Partner</h3>     
                            <s:form action="updateTpOnboard" method="POST" enctype="multipart/form-data" name="updateTpOnboard" id="updateTpOnboard" theme="simple">
                                <div>  <h3 style="color: blue">Trading Partner Information</h3>
                                    <div id="tpResultMessage"></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="lableLeft">Partner Name <font color="red">*</font></td><td>
                                                    <s:textfield cssClass="inputStyle" name="partnerName" id="partnerName" tabindex="1" value="%{tpOnboardingBean.partnerName}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                                </td><td class="lableLeft">Contact Name <font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="contactName" id="contactName" tabindex="2" value="%{tpOnboardingBean.contactName}" onchange="fieldLengthValidator(this);"  readOnly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Email<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="contactEmail" id="contactEmail" tabindex="3" value="%{tpOnboardingBean.contactEmail}" onchange="validateEmail(this);fieldLengthValidator(this);"  readOnly="true"/>
                                                </td><td class="lableLeft">Phone No<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="phoneNo" id="phoneNo" tabindex="4" value="%{tpOnboardingBean.phoneNo}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Address<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="address1" id="address1" tabindex="5" value="%{tpOnboardingBean.address1}" onchange="fieldLengthValidator(this);"/>
                                                </td><td class="lableLeft">City<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="city" id="city" tabindex="6" value="%{tpOnboardingBean.city}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">State<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="state" id="state" tabindex="7" value="%{tpOnboardingBean.state}" onchange="fieldLengthValidator(this);"/>
                                                </td><td class="lableLeft">Country<font color="red">*</font> </td><td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'US':'USA','IN':'India','CN':'Canada','UK':'United Kingdom'}" name="country" id="country" value="%{tpOnboardingBean.country}" tabindex="8" cssStyle="width : 143px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Zip&nbsp;or&nbsp;Postal&nbsp;Code<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="zipCode" id="zipCode" tabindex="9" value="%{tpOnboardingBean.zipCode}" onchange="fieldLengthValidator(this);"/>
                                                </td></tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div>
                                    <h3 style="color: blue">Communications</h3>
                                    <div id="protocolmsg"></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="lableLeft">Protocol</td>
                                                <td>
                                                    <s:select headerKey="-1" headerValue="-- Select --" list="#@java.util.LinkedHashMap@{'FTP':'FTP/FTPS','AS2':'AS2','SFTP':'SFTP','HTTP':'HTTP/HTTPS','SMTP':'SMTP'}" name="commnProtocol" id="commnProtocol" value="%{tpOnboardingBean.commnProtocol}" tabindex="10" cssStyle="width : 143px" onchange="protocolsSelectwithoutvalidation(this.value)"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="transferModeDiv"  style="display: none">
                                    <h2 style="float:left">Transfer&nbsp;Mode&nbsp;:</h2>
                                    <div style="float:left;position:relative;left: 27px;top:14px">
                                        <input type="text" id="tempTransferMode" style="display:none"/>
                                        <s:radio name="transferMode" id="transferMode" list="{'get','put'}" value="%{tpOnboardingBean.transferMode}" onchange="gettransferModeSelection(this.value)" tabindex="11"></s:radio>&nbsp;&nbsp;
                                            <div class="tooltip"><i class="fa fa-question-circle-o"></i>
                                                <span class="tooltiptext">get&nbsp;:&nbsp;Partner&nbsp;Server <br>put&nbsp;:&nbsp;Your&nbsp;Server </span>
                                            </div>
                                        </div>
                                    <%--  <div style="float:left;position:relative;left: 27px;top:14px">
                                          <input type = "radio" name ="transferMode" id ="transferMode1" value="%{tpOnboardingBean.transferMode}" onchange="transferModeSelection(this.value)"/>&nbsp; &nbsp;get 
                                      </div>

                                    <div style="float:left;position:relative;left: 47px;top:14px">

                                        <input type = "radio" name ="transferMode"  id ="transferMode2" value="%{tpOnboardingBean.transferMode}" onchange="transferModeSelection(this.value)"/>&nbsp; &nbsp;put
                                        <div class="tooltip"><i class="fa fa-question-circle-o"></i>
                                            <span class="tooltiptext">get&nbsp;:&nbsp;Partner&nbsp;Server <br>put&nbsp;:&nbsp;Your&nbsp;Server </span>
                                        </div>
                                    </div> --%>
                                </div>
                                <div id="loaderdiv" class="loadingImg" style="display: none">
                                    <span id ="LoadingContent" > <img src="<s:url value="/includes/images/Loader2.gif"/>"   ></span>
                                </div>
                                <div id="transferModeMsg" style="display: none;position: relative;right: 226px;bottom: 11px;"></div>
                                <div id="ftpDiv" style="display: none;clear:both">
                                    <div id="protocolmsgFtp"></div>
                                    <h2 style="color: blue">Server&nbsp;Details :</h2>
                                    <h3>FTP : </h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;Type <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'GET':'Get','PUT':'Put'}" name="ftp_method" id="ftp_method" value="%{tpOnboardingBean.ftp_method}" tabindex="12" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">Connection&nbsp;Type <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'ACTIVE':'Active','PASSIVE':'Passive'}" name="ftp_conn_method" id="ftp_conn_method" value="%{tpOnboardingBean.ftp_conn_method}" tabindex="13" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Receiving&nbsp;Protocol <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_recv_protocol" id="ftp_recv_protocol" value="%{tpOnboardingBean.ftp_recv_protocol}" tabindex="14"/>
                                                </td>
                                                <td class="lableLeft">Response&nbsp;Timeout&nbsp;(sec) <font color="red">*</font> </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_resp_time" id="ftp_resp_time" tabindex="15" value="%{tpOnboardingBean.ftp_resp_time}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;Host <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_host" id="ftp_host" tabindex="16" value="%{tpOnboardingBean.ftp_host}"/>
                                                </td>
                                                <td class="lableLeft">FTP&nbsp;Port <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_port" id="ftp_port" tabindex="17" value="%{tpOnboardingBean.ftp_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;User&nbsp;ID <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_userId" id="ftp_userId" tabindex="18" value="%{tpOnboardingBean.ftp_userId}"/>
                                                </td>
                                                <td class="lableLeft">FTP&nbsp;Password  <font color="red">*</font></td>
                                                <td>
                                                    <s:password cssClass="inputStyle" name="ftp_pwd" id="ftp_pwd" tabindex="19" value="%{tpOnboardingBean.ftp_pwd}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;Directory <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_directory" id="ftp_directory" tabindex="20" value="%{tpOnboardingBean.ftp_directory}"/>
                                                </td>
                                                <td class="lableLeft">SSL&nbsp;Required </td>
                                                <td>
                                                    <s:checkbox cssClass="inputStyle" name="ftp_ssl_req" id="ftp_ssl_req" tabindex="21" value="%{ftp_ssl_req}" onclick="sslRequiredForGetDetails('ftp')"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="sftpDiv" style="display: none;clear:both">
                                    <div id="protocolmsgSftp"></div>
                                    <h2 style="color: blue">Server&nbsp;Details :</h2>
                                    <h3>SFTP : </h3>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="lableLeft">Connection&nbsp;Type <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'ACTIVE':'Active','PASSIVE':'Passive'}" name="sftp_conn_method" id="sftp_conn_method" value="%{tpOnboardingBean.sftp_conn_method}" tabindex="22" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">Authentication&nbsp;Type <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'Pwd_Only':'Password only','SSH_Public_Key':'SSH Public Key','pwd_and_public':'Password & Public Key'}" name="sftp_auth_method" id="sftp_auth_method" value="%{tpOnboardingBean.sftp_auth_method}" tabindex="23" cssStyle="width:143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">SSH&nbsp;Public&nbsp;key </td>
                                                <td class="lableLeft">My&nbsp;SSH&nbsp;Public&nbsp;Key <font color="red">*</font></td>
                                                <td id="download">
                                                    <%-- <s:textfield cssClass="button" name="sftp_public_key" id="sftp_public_key" tabindex="24" value="Download"/>--%>
                                                    <a href="../tpOnboarding/tpOnboardingDownloads.action">Download this file</a>
                                                </td>
                                                <td id="upload">
                                                    <s:file name="upload" id= "attachmentFileNameSftp" label="sftp_upload_public_key" tabindex="25"/>
                                                </td>
                                            </tr>
                                            <!--                                            <tr>
                                                                                            <td></td>
                                                                                            <td class="lableLeft">Upload&nbsp;your&nbsp;SSH&nbsp;Public&nbsp;Key </td>
                                                                                            
                                                                                        </tr>-->
                                            <tr>
                                                <td class="lableLeft">Remote&nbsp;Host&nbsp;IP&nbsp;Address <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_host_ip" id="sftp_host_ip" tabindex="26" value="%{tpOnboardingBean.sftp_host_ip}"/>
                                                </td>
                                                <td class="lableLeft">Remote&nbsp;Port <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_remote_port" id="sftp_remote_port" tabindex="27" value="%{tpOnboardingBean.sftp_remote_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Remote&nbsp;UserId <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_remote_userId" id="sftp_remote_userId" tabindex="28" value="%{tpOnboardingBean.sftp_remote_userId}"/>
                                                </td>
                                                <td class="lableLeft">Remote&nbsp;Password <font color="red">*</font></td>
                                                <td>
                                                    <s:password cssClass="inputStyle" name="sftp_remote_pwd" id="sftp_remote_pwd" tabindex="19" value="%{tpOnboardingBean.sftp_remote_pwd}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Type <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'GET':'Get','PUT':'Put'}" name="sftp_method" id="sftp_method" value="%{tpOnboardingBean.sftp_method}" tabindex="30" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">Directory <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_directory" id="sftp_directory" tabindex="31" value="%{tpOnboardingBean.sftp_directory}"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="httpDiv" style="display: none;clear:both">
                                    <div id="protocolmsgHttp"></div>
                                    <h2 style="color: blue">Server&nbsp;Details :</h2>
                                    <h3>HTTP : </h3>
                                    <table>   
                                        <tbody>  
                                            <tr>
                                                <td class="lableLeft">Receiving&nbsp;Protocol <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_recv_protocol" id="http_recv_protocol" value="%{tpOnboardingBean.http_recv_protocol}" tabindex="32"/>
                                                </td>
                                                <td class="lableLeft">Response&nbsp;Timeout&nbsp;(sec) <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_resp_time" id="http_resp_time" tabindex="33" value="%{tpOnboardingBean.http_resp_time}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">HTTP&nbsp;End&nbsp;Point <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_endpoint" id="http_endpoint" tabindex="34" value="%{tpOnboardingBean.http_endpoint}"/>
                                                </td>
                                                <td class="lableLeft">HTTP&nbsp;Port <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_port" id="http_port" tabindex="35" value="%{tpOnboardingBean.http_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">HTTP&nbsp;Mode </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'GET':'Get','POST':'Post'}" name="http_protocol_mode" id="http_protocol_mode" value="%{tpOnboardingBean.http_protocol_mode}" tabindex="36" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">URL </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_url" id="http_url" value="%{tpOnboardingBean.http_url}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">SSL&nbsp;Required </td>
                                                <td>
                                                    <s:checkbox cssClass="inputStyle" name="http_ssl_req" id="http_ssl_req" tabindex="37" value="%{http_ssl_req}" onclick="sslRequiredForGetDetails('http')"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="smtpDiv" style="display: none;clear:both">
                                    <div id="protocolmsgSmtp"></div>
                                    <h2 style="color: blue">Server&nbsp;Details :</h2>
                                    <h3>SMTP : </h3>
                                    <table>   
                                        <tbody>  
                                        <tbody>  
                                            <tr>
                                                <td class="lableLeft">Receiving&nbsp;Protocol <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_recv_protocol" id="smtp_recv_protocol" value="%{tpOnboardingBean.smtp_recv_protocol}" tabindex="38"/>
                                                </td>
                                                <td class="lableLeft">SMTP&nbsp;Server&nbsp;Host <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_server_protocol" id="smtp_server_protocol" tabindex="39" value="%{tpOnboardingBean.smtp_server_protocol}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">SMTP&nbsp;Server&nbsp;Port <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_server_port" id="smtp_server_port" tabindex="40" value="%{tpOnboardingBean.smtp_server_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                                <td class="lableLeft">From&nbsp;email&nbsp;address <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_from_email" id="smtp_from_email" tabindex="41" value="%{tpOnboardingBean.smtp_from_email}" onchange="validateEmail(this);"/>
                                                </td></tr>
                                            <tr>
                                                <td class="lableLeft">To email&nbsp;address <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_to_email" id="smtp_to_email" tabindex="42" value="%{tpOnboardingBean.smtp_to_email}" onchange="validateEmail(this);"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="loadingImage"></div>
                                <div id="as2Div" style="display: none;clear:both">
                                    <div id="protocolmsgAs2"></div>
                                    <h2 style="color: blue">Server&nbsp;Details :</h2>
                                    <h3>AS2 : </h3>
                                    <table>   
                                        <tbody>  
                                            <tr>
                                                <td class="lableLeft">System&nbsp;Certificates <font color="red">*</font></td>
                                                <td class="lableLeft">Upload&nbsp;Your&nbsp;System&nbsp;Certificate <font color="red">*</font></td>
                                                <td>
                                                    <%-- <s:file name="as2_part_cert" id= "as2_part_cert" label="as2_part_cert" tabindex="44"/>--%>
                                                    <s:file name="upload" id= "attachmentFileNameAs2" label="as2_part_cert" tabindex="44"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Organization&nbsp;Profiles <font color="red">*</font></td>
                                                <td class="lableLeft">My&nbsp;Organization <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_myOrgName" id="as2_myOrgName" tabindex="45" value="%{tpOnboardingBean.as2_myOrgName}" onkeyup="as2OrgProfileNames(this);" onblur="isExistedAS2PartnerProfileName();"/><img id="correctImg" style="display: none;" src="/<%=AppConstants.CONTEXT_PATH%>/includes/images/right.png" 
                                                         width="13" height="13" border="0"><img id="wrongImg" style="display: none;" src="/<%=AppConstants.CONTEXT_PATH%>/includes/images/wrong.jpg" width="13" height="13" border="0"><img id="loadingImageAjax" style="display: none;" width="16" height="16" border="0" src="<s:url value="/includes/images/ajax-loader.gif"/>">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Your&nbsp;Organization <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_partOrgName" id="as2_partOrgName" tabindex="46" value="%{tpOnboardingBean.as2_partOrgName}" onkeyup="as2PartnerProfileNames(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Partner&nbsp;Profiles <font color="red">*</font></td>
                                                <td class="lableLeft">My&nbsp;Partner&nbsp;Profile&nbsp;Name <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_myPartname" id="as2_myPartname" tabindex="47" value="%{tpOnboardingBean.as2_myPartname}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Your&nbsp;Partner&nbsp;Profile&nbsp;Name <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_yourPartname" id="as2_yourPartname" tabindex="48" value="%{tpOnboardingBean.as2_yourPartname}" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">AS2&nbsp;End&nbsp;Point <font color="red">*</font></td>
                                                <td class="lableLeft">My&nbsp;End&nbsp;Point <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_myEndPoint" id="as2_myEndPoint" tabindex="49" value="%{tpOnboardingBean.as2_myEndPoint}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Your&nbsp;End&nbsp;Point <font color="red">*</font></td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_partendpoint" id="as2_partendpoint" tabindex="50" value="%{tpOnboardingBean.as2_partendpoint}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Store&nbsp;AS2&nbsp;Messages&nbsp;in <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'MailBox':'MailBox','FSA':'FSA'}" name="as2_strMsg" id="as2_strMsg" value="%{tpOnboardingBean.as2_strMsg}" tabindex="51" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Wait&nbsp;For&nbsp;Synchronous&nbsp;MDN&nbsp;Process <font color="red">*</font></td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'YES':'Yes','NO':'No'}" name="as2_waitForSync" id="as2_waitForSync" value="%{tpOnboardingBean.as2_waitForSync}" tabindex="52" cssStyle="width : 143px"/>
                                                </td>
                                                 <td class="lableLeft fld_disable">SSL&nbsp;Required&nbsp;&nbsp;&nbsp;&nbsp; 
                                                    <s:checkbox cssClass="inputStyle" name="as2_ssl_req" id="as2_ssl_req" tabindex="53" value="%{tpOnboardingBean.as2_ssl_req}" onclick="sslRequiredForGetDetails('as2')" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Payload&nbsp;Send&nbsp;Mode</td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'SYNC':'SYNC','ASYNC':'ASYNC','NoMDN':'No MDN'}" name="as2_payloadSendMode" id="as2_payloadSendMode" value="%{tpOnboardingBean.as2_payloadSendMode}" tabindex="52" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="sslDiv" style="display: none">
                                    <h3>SSL : </h3>
                                    <table>  
                                        <tbody>  
                                            <tr>
                                                <td class="lableLeft">SSL&nbsp;Priority:</td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'MUST':'Must','NONE':'None'}" name="ssl_priority" id="ssl_priority" value="%{ssl_priority}" tabindex="54" cssStyle="width : 143px" onchange="sslPriorityChange(this.value)"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Cipher&nbsp;Strength:</td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'STRONG':'Strong','NONE':'None'}" name="ssl_cipher_stergth" id="ssl_cipher_stergth" value="%{ssl_cipher_stergth}" tabindex="56" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">CA&nbsp;Certificates&nbsp;(Certificate&nbsp;Groups):</td>
                                                <td>
                                                    <a href="../tpOnboarding/tpOnboardingDownloads.action">Download this file</a>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div id="sslDiv2" style="display: none">
                                    <div id="protocolmsgSsl"></div>
                                    <h3>SSL : </h3>
                                    <table>  
                                        <tbody>  
                                            <tr>
                                                <td class="lableLeft">SSL&nbsp;Priority:</td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'MUST':'Must','NONE':'None'}" name="ssl_priority2" id="ssl_priority2" value="%{ssl_priority2}" tabindex="54" cssStyle="width : 143px" onchange="sslPriorityChange(this.value)"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Cipher&nbsp;Strength:</td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'STRONG':'Strong','NONE':'None'}" name="ssl_cipher_stergth2" id="ssl_cipher_stergth2" value="%{ssl_cipher_stergth2}" tabindex="56" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">CA&nbsp;Certificates&nbsp;(Certificate&nbsp;Groups): <font color="red">*</font></td>
                                                <td>
                                                    <s:file name="upload1" id= "attachmentFileName" label="certGroups" tabindex="58"/> 
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>                

                                <div id="transactionsDiv" style="display: none;clear:both"> 
                                    <h3 style="color: blue">Transactions&nbsp;</h3>
                                    <table>                                     
                                        <tr>
                                            <td class="lableLeft">Inbound&nbsp;Trans</td>
                                            <td class="lableLeft">
                                                <s:checkbox name="ib850" id="ib850" value="%{tpOnboardingBean.ib850}" label="850" tabindex="59"/>850&nbsp;
                                                <s:checkbox name="ib855" id="ib855" value="%{tpOnboardingBean.ib855}" label="855" tabindex="60"/>855&nbsp; 
                                                <s:checkbox name="ib856" id="ib856" value="%{tpOnboardingBean.ib856}" label="856" tabindex="61"/>856&nbsp; 
                                                <s:checkbox name="ib810" id="ib810" value="%{tpOnboardingBean.ib810}" label="810" tabindex="62"/>810&nbsp;  
                                            </td>
                                            <td class="lableLeft">Outbound&nbsp;Trans</td>
                                            <td class="lableLeft">
                                                <s:checkbox name="ob850" id="ob850" value="%{tpOnboardingBean.ob850}" label="850" tabindex="63"/>850&nbsp;
                                                <s:checkbox name="ob855" id="ob855" value="%{tpOnboardingBean.ob855}" label="855" tabindex="64"/>855&nbsp;
                                                <s:checkbox name="ob856" id="ob856" value="%{tpOnboardingBean.ob856}" label="856" tabindex="65"/>856&nbsp;
                                                <s:checkbox name="ob810" id="ob810" value="%{tpOnboardingBean.ob810}" label="810" tabindex="66"/>810&nbsp;
                                            </td>      
                                        </tr>
                                    </table>
                                </div>
                                <%-- 850 Inbound   Start div--%>    
                                <div id="ibenvelop850" style="display: none" >
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibvalue850" id="ibvalue850" value="%{tpOnboardingBean.ibvalue850}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibdirection" id="ibdirection" value="%{tpOnboardingBean.ibdirection}" readonly="true" /></h3>
                                    <input type="hidden" name="IB850Transaction" id="IB850Transaction" value="%{tpOnboardingBean.IB850Transaction}"/>
                                    <div id="resultMessage"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa850senderIdIB" id="isa850senderIdIB" value="%{tpOnboardingBean.isa850senderIdIB}" tabindex="67" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850senderIdIB" id="gs850senderIdIB" value="%{tpOnboardingBean.gs850senderIdIB}" tabindex="68" onchange="fieldLengthValidator850IB(this);"  onkeyup="IBsender850();" />
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850senderIdIB" id="st850senderIdIB" value="%{tpOnboardingBean.st850senderIdIB}" tabindex="69" onchange="fieldLengthValidator850IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td> 
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa850RecIdIB" id="isa850RecIdIB" value="%{tpOnboardingBean.isa850RecIdIB}" tabindex="70" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs850RecIdIB" id="gs850RecIdIB" value="%{tpOnboardingBean.gs850RecIdIB}" tabindex="71" cssStyle="width : 144px" onclick="IBrecId850();"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850RecIdIB" id="st850RecIdIB" value="%{tpOnboardingBean.st850RecIdIB}" tabindex="72"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa850VersionIB" id="isa850VersionIB" value="%{tpOnboardingBean.isa850VersionIB}" tabindex="73" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850VersionIB" id="gs850VersionIB" value="%{tpOnboardingBean.gs850VersionIB}" tabindex="74" onchange="fieldLengthValidator850IB(this);" onkeyup="IBversion850(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850VersionIB" id="st850VersionIB" value="%{tpOnboardingBean.st850VersionIB}" tabindex="75" onchange="fieldLengthValidator850IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun850GroupIdIB" id="fun850GroupIdIB" value="%{tpOnboardingBean.fun850GroupIdIB}" tabindex="76" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res850AgecodeIB" id="res850AgecodeIB" placeholder="x" value="%{tpOnboardingBean.res850AgecodeIB}" tabindex="77" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen850AckIB" id="gen850AckIB" tabindex="78" value="%{tpOnboardingBean.gen850AckIB}" />
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans850IdcodeIB" id="trans850IdcodeIB" value="%{tpOnboardingBean.trans850IdcodeIB}" tabindex="79" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 850 Inbound   End div--%>
                                <%-- 855 Inbound   Start div--%>
                                <div id="ibenvelop855" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibvalue855" id="ibvalue855" value="%{tpOnboardingBean.ibvalue855}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibdirection855" id="ibdirection855" value="%{tpOnboardingBean.ibdirection855}" readonly="true" /></h3>
                                    <input type="hidden" name="IB855Transaction" id="IB855Transaction" value="%{tpOnboardingBean.IB855Transaction}"/>
                                    <div id="resultMessage855ib"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa855senderIdIB" id="isa855senderIdIB" value="%{tpOnboardingBean.isa855senderIdIB}" tabindex="80" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855senderIdIB" id="gs855senderIdIB" value="%{tpOnboardingBean.gs855senderIdIB}" tabindex="81" onchange="fieldLengthValidator855IB(this);" onkeyup="IBsender855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855senderIdIB" id="st855senderIdIB" value="%{tpOnboardingBean.st855senderIdIB}" tabindex="82" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa855RecIdIB" id="isa855RecIdIB" value="%{tpOnboardingBean.isa855RecIdIB}" tabindex="83" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs855RecIdIB" id="gs855RecIdIB" value="%{tpOnboardingBean.gs855RecIdIB}" tabindex="84" cssStyle="width : 144px" onclick="IBrecId855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855RecIdIB" id="st855RecIdIB" value="%{tpOnboardingBean.st855RecIdIB}" tabindex="85" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa855VersionIB" id="isa855VersionIB" value="%{tpOnboardingBean.isa855VersionIB}" tabindex="86" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855VersionIB" id="gs855VersionIB" value="%{tpOnboardingBean.gs855VersionIB}" tabindex="87" onchange="fieldLengthValidator855IB(this);" onkeyup="IBversion855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855VersionIB" id="st855VersionIB" value="%{tpOnboardingBean.st855VersionIB}" tabindex="88" onchange="fieldLengthValidator855IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun855GroupIdIB" id="fun855GroupIdIB" value="%{tpOnboardingBean.fun855GroupIdIB}" tabindex="89" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res855AgecodeIB" id="res855AgecodeIB" placeholder="X" value="%{tpOnboardingBean.res855AgecodeIB}" tabindex="90" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen855AckIB" id="gen855AckIB" tabindex="91" value="%{tpOnboardingBean.gen855AckIB}" onchange="" />
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans855IdcodeIB" id="trans855IdcodeIB" value="%{tpOnboardingBean.trans855IdcodeIB}" tabindex="92" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 855 Inbound   End div--%>

                                <%-- 856 Inbound   Start div--%>
                                <div id="ibenvelop856" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibvalue856" id="ibvalue856" value="%{tpOnboardingBean.ibvalue856}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibdirection856" id="ibdirection856" value="%{tpOnboardingBean.ibdirection856}" readonly="true" /></h3>
                                    <input type="hidden" name="IB856Transaction" id="IB856Transaction" value="%{tpOnboardingBean.IB856Transaction}"/>
                                    <div id="resultMessage856ib"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa856senderIdIB" id="isa856senderIdIB" value="%{tpOnboardingBean.isa856senderIdIB}" tabindex="93" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856senderIdIB" id="gs856senderIdIB" value="%{tpOnboardingBean.gs856senderIdIB}" tabindex="94" onchange="fieldLengthValidator856IB(this);" onkeyup="IBsender856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856senderIdIB" id="st856senderIdIB" value="%{tpOnboardingBean.st856senderIdIB}" tabindex="95" onchange="fieldLengthValidator856IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa856RecIdIB" id="isa856RecIdIB" value="%{tpOnboardingBean.isa856RecIdIB}" tabindex="96" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs856RecIdIB" id="gs856RecIdIB" value="%{tpOnboardingBean.gs856RecIdIB}" tabindex="97" cssStyle="width : 144px" onclick="IBrecId856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856RecIdIB" id="st856RecIdIB" value="%{tpOnboardingBean.st856RecIdIB}" tabindex="98" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa856VersionIB" id="isa856VersionIB" value="%{tpOnboardingBean.isa856VersionIB}" tabindex="99" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856VersionIB" id="gs856VersionIB" value="%{tpOnboardingBean.gs856VersionIB}" tabindex="100" onchange="fieldLengthValidator856IB(this);" onkeyup="IBversion856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856VersionIB" id="st856VersionIB" value="%{tpOnboardingBean.st856VersionIB}" tabindex="101" onchange="fieldLengthValidator856IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun856GroupIdIB" id="fun856GroupIdIB" value="%{tpOnboardingBean.fun856GroupIdIB}" tabindex="102" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res856AgecodeIB" id="res856AgecodeIB" placeholder="X" value="%{tpOnboardingBean.res856AgecodeIB}" tabindex="103" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen856AckIB" id="gen856AckIB" tabindex="104" value="%{tpOnboardingBean.gen856AckIB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans856IdcodeIB" id="trans856IdcodeIB" value="%{tpOnboardingBean.trans856IdcodeIB}" tabindex="105" onchange="fieldLengthValidator856IB(this);" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 856 Inbound   End div--%>
                                <%-- 810 Inbound   Start div--%>
                                <div id="ibenvelop810" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibvalue810" id="ibvalue810" value="%{tpOnboardingBean.ibvalue810}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibdirection810" id="ibdirection810" value="%{tpOnboardingBean.ibdirection810}" readonly="true" /></h3>
                                    <input type="hidden" name="IB810Transaction" id="IB810Transaction" value="%{tpOnboardingBean.IB810Transaction}"/>
                                    <div id="resultMessage810ib"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa810senderIdIB" id="isa810senderIdIB" value="%{tpOnboardingBean.isa810senderIdIB}" tabindex="106" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810senderIdIB" id="gs810senderIdIB" value="%{tpOnboardingBean.gs810senderIdIB}" tabindex="107" onchange="fieldLengthValidator810IB(this);" onkeyup="IBsender810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810senderIdIB" id="st810senderIdIB" value="%{tpOnboardingBean.st810senderIdIB}" tabindex="108" onchange="fieldLengthValidator810IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa810RecIdIB" id="isa810RecIdIB" value="%{tpOnboardingBean.isa810RecIdIB}" tabindex="109" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs810RecIdIB" id="gs810RecIdIB" value="%{tpOnboardingBean.gs810RecIdIB}" tabindex="110" cssStyle="width : 144px" onclick="IBrecId810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810RecIdIB" id="st810RecIdIB" value="%{tpOnboardingBean.st810RecIdIB}" tabindex="111"  />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa810VersionIB" id="isa810VersionIB" value="%{tpOnboardingBean.isa810VersionIB}" tabindex="112" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810VersionIB" id="gs810VersionIB" value="%{tpOnboardingBean.gs810VersionIB}" tabindex="113" onchange="fieldLengthValidator810IB(this);" onkeyup="IBversion810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810VersionIB" id="st810VersionIB" value="%{tpOnboardingBean.st810VersionIB}" tabindex="114" onchange="fieldLengthValidator810IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun810GroupIdIB" id="fun810GroupIdIB" value="%{tpOnboardingBean.fun810GroupIdIB}" tabindex="115" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res810AgecodeIB" id="res810AgecodeIB" placeholder="X" value="%{tpOnboardingBean.res810AgecodeIB}" tabindex="116" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen810AckIB" id="gen810AckIB" tabindex="117" value="%{tpOnboardingBean.gen810AckIB}" onchange="()"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans810IdcodeIB" id="trans810IdcodeIB" value="%{tpOnboardingBean.trans810IdcodeIB}" tabindex="118" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 810 Inbound   End div--%>
                                <%-- 850 outbound   End div--%>
                                <div id="obenvelop850" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue850" id="obvalue850" value="%{tpOnboardingBean.obvalue850}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection" id="obdirection" value="%{tpOnboardingBean.obdirection}" readonly="true" /></h3>
                                    <input type="hidden" name="OB850Transaction" id="OB850Transaction" value="%{tpOnboardingBean.OB850Transaction}"/>
                                    <div id="resultMessage850ob"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa850senderIdOB" id="isa850senderIdOB" value="%{tpOnboardingBean.isa850senderIdOB}" tabindex="119" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850senderIdOB" id="gs850senderIdOB" value="%{tpOnboardingBean.gs850senderIdOB}" tabindex="120" onchange="fieldLengthValidator850OB(this);" onkeyup="OBsender850(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850senderIdOB" id="st850senderIdOB" value="%{tpOnboardingBean.st850senderIdOB}" tabindex="121" onchange="fieldLengthValidator850OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa850RecIdOB" id="isa850RecIdOB" value="%{tpOnboardingBean.isa850RecIdOB}" tabindex="122" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs850RecIdOB" id="gs850RecIdOB" value="%{tpOnboardingBean.gs850RecIdOB}" tabindex="123" cssStyle="width : 144px" onclick="OB850recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850RecIdOB" id="st850RecIdOB" value="%{tpOnboardingBean.st850RecIdOB}" tabindex="124" /> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa850VersionOB" id="isa850VersionOB" value="%{tpOnboardingBean.isa850VersionOB}" tabindex="125" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850VersionOB" id="gs850VersionOB" value="%{tpOnboardingBean.gs850VersionOB}" tabindex="126" onchange="fieldLengthValidator850OB(this);" onkeyup="OBversion850(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850VersionOB" id="st850VersionOB" value="%{tpOnboardingBean.st850VersionOB}" tabindex="127" onchange="fieldLengthValidator850OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun850GroupIdOB" id="fun850GroupIdOB" value="%{tpOnboardingBean.fun850GroupIdOB}" tabindex="128" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res850AgecodeOB" id="res850AgecodeOB" placeholder="X" value="%{tpOnboardingBean.res850AgecodeOB}" tabindex="129" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen850AckOB" id="gen850AckOB" tabindex="130" value="%{tpOnboardingBean.gen850AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans850IdcodeOB" id="trans850IdcodeOB" value="%{tpOnboardingBean.trans850IdcodeOB}" tabindex="131" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 850 Outbound   End div--%>
                                <%-- 855 Outbound   Start div--%>
                                <div id="obenvelop855" style="display: none">
                                    <h2 style="color: blue">Envelops&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue855" id="obvalue855" value="%{tpOnboardingBean.obvalue855}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection855" id="obdirection855" value="%{tpOnboardingBean.obdirection855}" readonly="true" /></h3>
                                    <input type="hidden" name="OB855Transaction" id="OB855Transaction" value="%{tpOnboardingBean.OB855Transaction}"/>
                                    <div id="resultMessage855ob"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa855senderIdOB" id="isa855senderIdOB" value="%{tpOnboardingBean.isa855senderIdOB}" tabindex="132" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855senderIdOB" id="gs855senderIdOB" value="%{tpOnboardingBean.gs855senderIdOB}" tabindex="133" onchange="fieldLengthValidator855OB(this);" onkeyup="OBsender855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855senderIdOB" id="st855senderIdOB" value="%{tpOnboardingBean.st855senderIdOB}" tabindex="134" onchange="fieldLengthValidator855OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa855RecIdOB" id="isa855RecIdOB" value="%{tpOnboardingBean.isa855RecIdOB}" tabindex="135" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs855RecIdOB" id="gs855RecIdOB" value="%{tpOnboardingBean.gs855RecIdOB}" tabindex="136" cssStyle="width : 144px" onclick="OB855recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855RecIdOB" id="st855RecIdOB" value="%{tpOnboardingBean.st855RecIdOB}" tabindex="137" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa855VersionOB" id="isa855VersionOB" value="%{tpOnboardingBean.isa855VersionOB}" tabindex="138" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855VersionOB" id="gs855VersionOB" value="%{tpOnboardingBean.gs855VersionOB}" tabindex="139" onchange="fieldLengthValidator855OB(this);" onkeyup="OBversion855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855VersionOB" id="st855VersionOB" value="%{tpOnboardingBean.st855VersionOB}" tabindex="140" onchange="fieldLengthValidator855OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun855GroupIdOB" id="fun855GroupIdOB" value="%{tpOnboardingBean.fun855GroupIdOB}" tabindex="141" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res855AgecodeOB" id="res855AgecodeOB" placeholder="X" value="%{tpOnboardingBean.res855AgecodeOB}" tabindex="142" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen855AckOB" id="gen855AckOB" tabindex="143" value="%{tpOnboardingBean.gen855AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans855IdcodeOB" id="trans855IdcodeOB" value="%{tpOnboardingBean.trans855IdcodeOB}" tabindex="144" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 855 Outbound   End div--%>
                                <%-- 856 Outbound   Start div--%>
                                <div id="obenvelop856" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue856" id="obvalue856" value="%{tpOnboardingBean.obvalue856}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection856" id="obdirection856" value="%{tpOnboardingBean.obdirection856}" readonly="true" /></h3>
                                    <input type="hidden" name="OB856Transaction" id="OB856Transaction" value="%{tpOnboardingBean.OB856Transaction}"/>
                                    <div id="resultMessage856ob"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa856senderIdOB" id="isa856senderIdOB" value="%{tpOnboardingBean.isa856senderIdOB}" tabindex="143" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856senderIdOB" id="gs856senderIdOB" value="%{tpOnboardingBean.gs856senderIdOB}" tabindex="146" onchange="fieldLengthValidator856OB(this);" onkeyup="OBsender856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856senderIdOB" id="st856senderIdOB" value="%{tpOnboardingBean.st856senderIdOB}" tabindex="147" onchange="fieldLengthValidator856OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa856RecIdOB" id="isa856RecIdOB" value="%{tpOnboardingBean.isa856RecIdOB}" tabindex="148" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs856RecIdOB" id="gs856RecIdOB" value="%{tpOnboardingBean.gs856RecIdOB}" tabindex="149" cssStyle="width : 144px" onclick="OB856recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856RecIdOB" id="st856RecIdOB" value="%{tpOnboardingBean.st856RecIdOB}" tabindex="150" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa856VersionOB" id="isa856VersionOB" value="%{tpOnboardingBean.isa856VersionOB}" tabindex="151" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856VersionOB" id="gs856VersionOB" value="%{tpOnboardingBean.gs856VersionOB}" tabindex="152" onchange="fieldLengthValidator856OB(this);" onkeyup="OBversion856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856VersionOB" id="st856VersionOB" value="%{tpOnboardingBean.st856VersionOB}" tabindex="153" onchange="fieldLengthValidator856OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun856GroupIdOB" id="fun856GroupIdOB" value="%{tpOnboardingBean.fun856GroupIdOB}" tabindex="154" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res856AgecodeOB" id="res856AgecodeOB" placeholder="X" value="%{tpOnboardingBean.res856AgecodeOB}" tabindex="155" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen856AckOB" id="gen856AckOB" tabindex="156" value="%{tpOnboardingBean.gen856AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans856IdcodeOB" id="trans856IdcodeOB" value="%{tpOnboardingBean.trans856IdcodeOB}" tabindex="157" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 856 Outbound   End div--%>
                                <%-- 810 Outbound   Start div--%>
                                <div id="obenvelop810" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue810" id="obvalue810" value="%{tpOnboardingBean.obvalue810}" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection810" id="obdirection810" value="%{tpOnboardingBean.obdirection810}" readonly="true" /></h3>
                                    <input type="hidden" name="OB810Transaction" id="OB810Transaction" value="%{tpOnboardingBean.OB810Transaction}"/>
                                    <div id="resultMessage810ob"></div>
                                    <table>
                                        <tr class="tab_head">
                                            <td></td>
                                            <td class="alignright"><b>ISA</b></td>
                                            <td class="alignright"><b>GS</b></td>
                                            <td class="alignright"><b>ST</b></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">SenderId </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa810senderIdOB" id="isa810senderIdOB" value="%{tpOnboardingBean.isa810senderIdOB}" tabindex="158" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810senderIdOB" id="gs810senderIdOB" value="%{tpOnboardingBean.gs810senderIdOB}" tabindex="159" onchange="fieldLengthValidator810OB(this);" onkeyup="OBsender810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810senderIdOB" id="st810senderIdOB" value="%{tpOnboardingBean.st810senderIdOB}" tabindex="160" onchange="fieldLengthValidator810OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa810RecIdOB" id="isa810RecIdOB" value="%{tpOnboardingBean.isa810RecIdOB}" tabindex="161" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs810RecIdOB" id="gs810RecIdOB" value="%{tpOnboardingBean.gs810RecIdOB}" tabindex="162" cssStyle="width : 144px" onclick="OB810recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810RecIdOB" id="st810RecIdOB" value="%{tpOnboardingBean.st810RecIdOB}" tabindex="163"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa810VersionOB" id="isa810VersionOB" value="%{tpOnboardingBean.isa810VersionOB}" tabindex="164" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810VersionOB" id="gs810VersionOB" value="%{tpOnboardingBean.gs810VersionOB}" tabindex="165" onchange="fieldLengthValidator810OB(this);" onkeyup="OBversion810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810VersionOB" id="st810VersionOB" value="%{tpOnboardingBean.st810VersionOB}" tabindex="166" onchange="fieldLengthValidator810OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun810GroupIdOB" id="fun810GroupIdOB" value="%{tpOnboardingBean.fun810GroupIdOB}" tabindex="167" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res810AgecodeOB" id="res810AgecodeOB" placeholder="X" value="%{tpOnboardingBean.res810AgecodeOB}" tabindex="168" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen810AckOB" id="gen810AckOB" tabindex="169" value="%{tpOnboardingBean.gen810AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans810IdcodeOB" id="trans810IdcodeOB" value="%{tpOnboardingBean.trans810IdcodeOB}" tabindex="170" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 810 Outbound   End div--%>
                                <div>

                                    <s:submit   value="Update" cssClass="button" tabindex="171" onclick="return check()"/>
                                    <s:submit   value="Cancel" cssClass="button" tabindex="172" onclick="cancel()"/>
                                </div>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div> 
            <script type="text/javascript">
                var pager = new Pager('results', 10); 
                pager.init(); 
                pager.showPageNav('pager', 'pageNavPosition'); 
                pager.showPage(1);
            </script>
        </div>         
        <footer> 
            <p><font color="white">&#169 2016 Miracle Software Systems, Inc. All rights reserved</font></p>
        </footer>
        <script type="text/javascript"> 
        
            $(function () {
                /*  Inbound function start*/
                $("#ib850").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('ibvalue850').value='850';
                            document.getElementById('ibdirection').value='Inbound';
                            document.getElementById('trans850IdcodeIB').value='850';
                            document.getElementById('trans850IdcodeIB').readOnly = true;
                            $("#ibenvelop850").show();
                        } else {
                            $("#ibenvelop850").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                $("#ib855").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('ibvalue855').value='855';
                            document.getElementById('ibdirection855').value='Inbound';
                            document.getElementById('trans855IdcodeIB').value='855';
                            document.getElementById('trans855IdcodeIB').readOnly = true;
                            $("#ibenvelop855").show();
                        } else {
                            $("#ibenvelop855").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                $("#ib856").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('ibvalue856').value='856';
                            document.getElementById('ibdirection856').value='Inbound';
                            document.getElementById('trans856IdcodeIB').value='856';
                            document.getElementById('trans856IdcodeIB').readOnly = true;
                            $("#ibenvelop856").show();
                        } else {
                            $("#ibenvelop856").hide();
                        }}else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                
                });
                $("#ib810").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('ibvalue810').value='810';
                            document.getElementById('ibdirection810').value='Inbound';
                            document.getElementById('trans810IdcodeIB').value='810';
                            document.getElementById('trans810IdcodeIB').readOnly = true;
                            $("#ibenvelop810").show();
                        } else {
                            $("#ibenvelop810").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                /*  Outbound function Start*/
                $("#ob850").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('obvalue850').value='850';
                            document.getElementById('trans850IdcodeOB').value='850';
                            document.getElementById('trans850IdcodeOB').readOnly = true;
                            document.getElementById('obdirection').value='Outbound';
                            $("#obenvelop850").show();
                        } else {
                            $("#obenvelop850").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                $("#ob855").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('obvalue855').value='855';
                            document.getElementById('trans855IdcodeOB').value='855';
                            document.getElementById('trans855IdcodeOB').readOnly = true;
                            document.getElementById('obdirection855').value='Outbound';
                            $("#obenvelop855").show();
                        } else {
                            $("#obenvelop855").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                $("#ob856").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('obvalue856').value='856';
                            document.getElementById('trans856IdcodeOB').value='856';
                            document.getElementById('trans856IdcodeOB').readOnly = true;
                            document.getElementById('obdirection856').value='Outbound';
                            $("#obenvelop856").show();
                        } else {
                            $("#obenvelop856").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                $("#ob810").click(function () {
                    var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                    var protocol=document.getElementById("commnProtocol").value;
                    if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
                        if ($(this).is(":checked")) {
                            document.getElementById('obvalue810').value='810';
                            document.getElementById('trans810IdcodeOB').value='810';
                            document.getElementById('trans810IdcodeOB').readOnly = true;
                            document.getElementById('obdirection810').value='Outbound';
                            $("#obenvelop810").show();
                        } else {
                            $("#obenvelop810").hide();
                        }
                    }else{
                        document.getElementById("transferModeMsg").style.display = "block";
                        document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
                    }
                });
                /*  Outbound function End*/
            });
       
            function check(){
                var commnProtocol =document.getElementById('commnProtocol').value;
                if(commnProtocol == 'FTP'){
                    ftpValidate=validateFTP();
                    if(ftpValidate==false)
                        return false;
                }else if(commnProtocol == 'SFTP'){
                    sftpValidate=validateSFTP();
                    if(sftpValidate==false)
                        return false;
                }else if(commnProtocol == 'HTTP'){
                    httpValidate=validateHTTP();
                    if(httpValidate==false)
                        return false;
                }else if(commnProtocol == 'SMTP'){
                    smtpValidate=validateSMTP();
                    if(smtpValidate==false)
                        return false;
                }else if(commnProtocol == 'AS2'){
                    as2Validate=validateAS2();
                    if(as2Validate==false)
                        return false;
                }
                var ib850=document.getElementById("ib850").checked;
                var ib855=document.getElementById("ib855").checked;
                var ib856=document.getElementById("ib856").checked;
                var ib810=document.getElementById("ib810").checked;
                var ob850=document.getElementById("ob850").checked;
                var ob855=document.getElementById("ob855").checked;
                var ob856=document.getElementById("ob856").checked;
                var ob810=document.getElementById("ob810").checked;
                var x=true;
                if(ib850==true)
                {
                    x=checkib850();
                    if(x==false)
                        return false;
                }
                if(ib855==true)
                {
                    x=checkib855();
                    if(x==false)
                        return false;
                }
                if(ib856==true)
                {
                    x=checkib856();
                    if(x==false)
                        return false;
                }
                if(ib810==true)
                {
                    x=checkib810();
                    if(x==false)
                        return false;
                }
                if(ob850==true)
                {
                    x=checkob850();
                    if(x==false)
                        return false;
                }
                if(ob855==true)
                {
                    x=checkob855();
                    if(x==false)
                        return false;
                }
                if(ob856==true)
                {
                    x=checkob856();
                    if(x==false)
                        return false;
                }
                if(ob810==true)
                {
                    x=checkob810();
                    if(x==false)
                        return false;
                }
                return x;
            }

       
            function displaydiv(){ 
                //alert("displaydiv");
                //var transferMode = document.forms["updateTpOnboard"]["transferMode"].value;
                fireEvent(document.getElementById("commnProtocol"),'change');
                //fireEvent(transferMode,'change');
            }
 
            function fireEvent(obj, evt){
                //alert("fireevt --"+obj+" -- "+evt);
                var fireOnThis = obj;
                if( document.createEvent ) {
                    var evObj = document.createEvent('MouseEvents');
                    evObj.initEvent( evt, true, false );
                    fireOnThis.dispatchEvent( evObj );
                }
                else if( document.createEventObject ) { //IE
                    var evObj = document.createEventObject();
                    fireOnThis.fireEvent( 'on' + evt, evObj );
                } 
            } 
            
            function cancel(){
                //alert("inside cancel");
                window.location="./tpoSuccess.action";
            }
        </script>
    </body>
</html>
