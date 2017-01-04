<%@page import="com.mss.ediscv.tpOnboarding.TpOnboardingBean"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.mss.ediscv.util.AppConstants"%>
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
            .tooltip > i {
                color:#0174DF;
                font-size:16px;
            }
            .tooltip1 > i {
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
    <body>
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
                                    //TpOnboardingBean.po_date;
                                }
                            %>
                            <h3>Trading Partner</h3>     
                            <s:form action="addTpOnboard" method="POST" enctype="multipart/form-data" name="addTpOnboard" id="addTpOnboard" theme="simple">
                                <div>  <h3 style="color: blue">Trading Partner Information</h3>
                                    <div id="tpResultMessage"></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="lableLeft">Partner Name <font color="red">*</font></td><td>
                                                    <s:textfield cssClass="inputStyle" readonly="true" name="partnerName" id="partnerName" tabindex="1" value="%{#session.tpoPartnerName}" onchange="fieldLengthValidator(this);"/>
                                                </td><td class="lableLeft">Contact Name <font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" readonly="true" name="contactName" id="contactName" tabindex="2" value="%{#session.tpoContactName}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Email<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" readonly="true" name="contactEmail" id="contactEmail" tabindex="3" value="%{#session.tpoEmail}" onchange="validateEmail(this);fieldLengthValidator(this);"/>
                                                </td><td class="lableLeft">Phone No<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" readonly="true" name="phoneNo" id="phoneNo" tabindex="4" value="%{#session.tpoPhoneNo}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Address<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="address1" id="address1" tabindex="5" value="%{address1}" onchange="fieldLengthValidator(this);"/>
                                                </td><td class="lableLeft">City<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="city" id="city" tabindex="6" value="%{city}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">State<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="state" id="state" tabindex="7" value="%{state}" onchange="fieldLengthValidator(this);"/>
                                                </td><td class="lableLeft">Country<font color="red">*</font> </td><td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'US':'USA','IN':'India','CN':'Canada','UK':'United Kingdom'}" readonly="true" name="country" id="country" value="%{#session.tpoCountry}" tabindex="8" cssStyle="width : 143px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Zip&nbsp;or&nbsp;Postal&nbsp;Code<font color="red">*</font> </td><td>
                                                    <s:textfield cssClass="inputStyle" name="zipCode" id="zipCode" tabindex="9" value="%{zipCode}" onchange="fieldLengthValidator(this);"/>
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
                                                    <s:select headerKey="-1" headerValue="-- Select --" list="#@java.util.LinkedHashMap@{'FTP':'FTP/FTPS','AS2':'AS2','SFTP':'SFTP','HTTP':'HTTP/HTTPS','SMTP':'SMTP'}" name="commnProtocol" id="commnProtocol" value="%{commnProtocol}" tabindex="10" cssStyle="width : 143px" onchange="protocolsSelect(this.value)"/>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="transferModeDiv"  style="display: none">
                                    <h2 style="float:left">Transfer&nbsp;Mode&nbsp;:</h2>
                                    <div style="float:left;position:relative;left: 27px;top:14px">
                                         <input type="text" id="tempTransferMode" style="display:none"/>
                                        <s:radio name="transferMode" id="transferMode" list="{'get','put'}" value="%{tpOnboardingBean.transferMode}" onchange="gettransferModeSelection(this.value)"  tabindex="11"></s:radio>&nbsp;&nbsp;
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
                                                <td class="lableLeft">FTP&nbsp;Type </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'GET':'Get','PUT':'Put'}" name="ftp_method" id="ftp_method" value="%{ftp_method}" tabindex="12" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">Connection&nbsp;Type </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'ACTIVE':'Active','PASSIVE':'Passive'}" name="ftp_conn_method" id="ftp_conn_method" value="%{ftp_conn_method}" tabindex="13" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Receiving&nbsp;Protocol </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_recv_protocol" id="ftp_recv_protocol" tabindex="14" value="FTP"/>
                                                </td>
                                                <td class="lableLeft">Response&nbsp;Timeout&nbsp;(sec) </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_resp_time" id="ftp_resp_time" tabindex="15" value="%{ftp_resp_time}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;Host </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_host" id="ftp_host" tabindex="16" value="%{ftp_host}"/>
                                                </td>
                                                <td class="lableLeft">FTP&nbsp;Port </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_port" id="ftp_port" tabindex="17" value="%{ftp_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;User&nbsp;ID </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_userId" id="ftp_userId" tabindex="18" value="%{ftp_userId}"/>
                                                </td>
                                                <td class="lableLeft">FTP&nbsp;Password  </td>
                                                <td>
                                                    <s:password cssClass="inputStyle" name="ftp_pwd" id="ftp_pwd" tabindex="19" value="%{ftp_pwd}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">FTP&nbsp;Directory </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="ftp_directory" id="ftp_directory" tabindex="20" value="%{ftp_directory}"/>
                                                </td>
                                                <td class="lableLeft">SSL&nbsp;Required </td>
                                                <td>
                                                    <s:checkbox cssClass="inputStyle" name="ftp_ssl_req" id="ftp_ssl_req" tabindex="21" value="%{ftp_ssl_req}" onclick="sslRequired('ftp')"/>
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
                                                <td class="lableLeft">Connection&nbsp;Type </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'ACTIVE':'Active','PASSIVE':'Passive'}" name="sftp_conn_method" id="sftp_conn_method" value="%{sftp_conn_method}" tabindex="22" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">Authentication&nbsp;Type </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'Pwd_Only':'Password only','SSH_Public_Key':'SSH Public Key','pwd_and_public':'Password & Public Key'}" name="sftp_auth_method" id="sftp_auth_method" value="%{sftp_auth_method}" tabindex="23" cssStyle="width:143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">SSH&nbsp;Public&nbsp;key </td>
                                                <td class="lableLeft">My&nbsp;SSH&nbsp;Public&nbsp;Key </td>
                                                <td id="download" >
                                                    <%-- <s:textfield cssClass="button" name="sftp_public_key" id="sftp_public_key" tabindex="24" value="Download"/>--%>
                                                    <a href="../tpOnboarding/tpOnboardingDownloads.action">Download this file</a>
                                                </td>
                                                <td id="upload">
                                                    <%-- <s:file name="sftp_upload_public_key" id= "sftp_upload_public_key" label="sftp_upload_public_key" tabindex="25"/>--%>
                                                    <s:file name="upload" id= "attachmentFileNameSftp" label="sftp_upload_public_key" tabindex="25"/>
                                                </td>
                                            </tr>
                                            <!--                                            <tr id="upload">
                                                                                            <td></td>
                                                                                            <td class="lableLeft">Upload&nbsp;your&nbsp;SSH&nbsp;Public&nbsp;Key </td>
                                                                                            
                                                                                            <td></td>
                                                                                        </tr>-->
                                            <tr>
                                                <td class="lableLeft">Remote&nbsp;Host&nbsp;IP&nbsp;Address </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_host_ip" id="sftp_host_ip" tabindex="26" value="%{sftp_host_ip}"/>
                                                </td>
                                                <td class="lableLeft">Remote&nbsp;Port </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_remote_port" id="sftp_remote_port" tabindex="27" value="%{sftp_remote_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Remote&nbsp;UserId </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_remote_userId" id="sftp_remote_userId" tabindex="28" value="%{sftp_remote_userId}"/>
                                                </td>
                                                <td class="lableLeft">Remote&nbsp;Password </td>
                                                <td>
                                                    <s:password cssClass="inputStyle" name="sftp_remote_pwd" id="sftp_remote_pwd" tabindex="19" value="%{sftp_remote_pwd}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Type </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'GET':'Get','PUT':'Put'}" name="sftp_method" id="sftp_method" value="%{sftp_method}" tabindex="30" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">Directory </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="sftp_directory" id="sftp_directory" tabindex="31" value="%{sftp_directory}"/>
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
                                                <td class="lableLeft">Receiving&nbsp;Protocol </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_recv_protocol" id="http_recv_protocol" tabindex="32" value="HTTP"/>
                                                </td>
                                                <td class="lableLeft">Response&nbsp;Timeout&nbsp;(sec) </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_resp_time" id="http_resp_time" tabindex="33" value="%{http_resp_time}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">HTTP&nbsp;End&nbsp;Point </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_endpoint" id="http_endpoint" tabindex="34" value="%{http_endpoint}"/>
                                                </td>
                                                <td class="lableLeft">HTTP&nbsp;Port </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="http_port" id="http_port" tabindex="35" value="%{http_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">HTTP&nbsp;Mode </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'GET':'Get','POST':'Post'}" name="http_protocol_mode" id="http_protocol_mode" value="%{http_protocol_mode}" tabindex="36" cssStyle="width : 143px"/>
                                                </td>
                                                <td class="lableLeft">URL </td>
                                                 <td>
                                                    <s:textfield cssClass="inputStyle" name="http_url" id="http_url" tabindex="35" value="%{http_url}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">SSL&nbsp;Required </td>
                                                <td>
                                                    <s:checkbox cssClass="inputStyle" name="http_ssl_req" id="http_ssl_req" tabindex="37" value="%{http_ssl_req}" onclick="sslRequired('http')"/>
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
                                                <td class="lableLeft">Receiving&nbsp;Protocol </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_recv_protocol" id="smtp_recv_protocol" tabindex="38" value="SMTP"/>
                                                </td>
                                                <td class="lableLeft">SMTP&nbsp;Server&nbsp;Host </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_server_protocol" id="smtp_server_protocol" tabindex="39" value="%{smtp_server_protocol}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">SMTP&nbsp;Server&nbsp;Port </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_server_port" id="smtp_server_port" tabindex="40" value="%{smtp_server_port}" onchange="fieldLengthValidator(this);"/>
                                                </td>
                                                <td class="lableLeft">From&nbsp;email&nbsp;address </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_from_email" id="smtp_from_email" tabindex="41" value="%{smtp_from_email}" onchange="validateEmail(this);"/>
                                                </td></tr>
                                            <tr>
                                                <td class="lableLeft">To email&nbsp;address </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="smtp_to_email" id="smtp_to_email" tabindex="42" value="%{smtp_to_email}" onchange="validateEmail(this);"/>
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
                                                <td class="lableLeft">System&nbsp;Certificates </td>
                                                <td class="lableLeft">Upload&nbsp;Your&nbsp;System&nbsp;Certificate </td>
                                                <td>
                                                    <%-- <s:file name="as2_part_cert" id= "as2_part_cert" label="as2_part_cert" tabindex="44"/>--%>
                                                    <s:file name="upload" id= "attachmentFileNameAs2" label="as2_part_cert" tabindex="44"/>                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Organization&nbsp;Profiles </td>
                                                <td class="lableLeft">My&nbsp;Organization</td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_myOrgName" id="as2_myOrgName" tabindex="45" value="%{as2_myOrgName}" onkeyup="as2OrgProfileNames(this);" onblur="isExistedAS2PartnerProfileName();"/><img id="correctImg" style="display: none;" src="/<%=AppConstants.CONTEXT_PATH%>/includes/images/right.png" 
                                                         width="13" height="13" border="0"><img id="wrongImg" style="display: none;" src="/<%=AppConstants.CONTEXT_PATH%>/includes/images/wrong.jpg" width="13" height="13" border="0"><img id="loadingImageAjax" style="display: none;" width="16" height="16" border="0" src="<s:url value="/includes/images/ajax-loader.gif"/>">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Your&nbsp;Organization </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_partOrgName" id="as2_partOrgName" tabindex="46" value="%{as2_partOrgName}" onkeyup="as2PartnerProfileNames(this);"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Partner&nbsp;Profiles</td>
                                                <td class="lableLeft">My&nbsp;Partner&nbsp;Profile&nbsp;Name </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_myPartname" id="as2_myPartname" tabindex="47" value="%{as2_myPartname}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Your&nbsp;Partner&nbsp;Profile&nbsp;Name </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_yourPartname" id="as2_yourPartname" tabindex="48" value="%{as2_yourPartname}" readonly="true"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">AS2&nbsp;End&nbsp;Point </td>
                                                <td class="lableLeft">My&nbsp;End&nbsp;Point </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_myEndPoint" id="as2_myEndPoint" tabindex="49" value="%{as2_myEndPoint}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Your&nbsp;End&nbsp;Point </td>
                                                <td>
                                                    <s:textfield cssClass="inputStyle" name="as2_partendpoint" id="as2_partendpoint" tabindex="50" value="%{as2_partendpoint}"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td class="lableLeft">Store&nbsp;AS2&nbsp;Messages&nbsp;in </td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'MailBox':'MailBox','FSA':'FSA'}" name="as2_strMsg" id="as2_strMsg" value="%{as2_strMsg}" tabindex="51" cssStyle="width : 143px"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Wait&nbsp;For&nbsp;Synchronous&nbsp;MDN&nbsp;Process</td>
                                                <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'YES':'Yes','NO':'No'}" name="as2_waitForSync" id="as2_waitForSync" value="%{as2_waitForSync}" tabindex="52" cssStyle="width : 143px"/>
                                                </td>          
                                                 <td class="lableLeft fld_disable">SSL&nbsp;Required&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <s:checkbox cssClass="inputStyle" name="as2_ssl_req" id="as2_ssl_req" tabindex="53" value="%{as2_ssl_req}" onclick="sslRequired('as2')"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Payload&nbsp;Send&nbsp;Mode</td>
                                                   <td>
                                                    <s:select list="#@java.util.LinkedHashMap@{'SYNC':'SYNC','ASYNC':'ASYNC','NoMDN':'No MDN'}" name="as2_payloadSendMode" id="as2_payloadSendMode" value="%{as2_payloadSendMode}" tabindex="52" cssStyle="width : 143px"/>
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
                                                    <%--<s:textfield cssClass="button" name="ssl_sysStore" id="ssl_sysStore" tabindex="57" value="Download"/>--%>
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
                                                <td class="lableLeft">CA&nbsp;Certificates&nbsp;(Certificate&nbsp;Groups):</td>
                                                <td>
                                                    <%--  <s:file name="certGroups" id="certGroups" label="certGroups" tabindex="58"/>--%>
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
                                                <s:checkbox name="ib850" id="ib850" fieldValue="true" label="850" tabindex="59"/>850&nbsp;
                                                <s:checkbox name="ib855" id="ib855" fieldValue="true" label="855" tabindex="60"/>855&nbsp; 
                                                <s:checkbox name="ib856" id ="ib856" fieldValue="true" label="856" tabindex="61"/>856&nbsp; 
                                                <s:checkbox name="ib810" id ="ib810" fieldValue="true" label="810" tabindex="62"/>810&nbsp;  
                                            </td>
                                            <td class="lableLeft">Outbound&nbsp;Trans</td>
                                            <td class="lableLeft">
                                                <s:checkbox name="ob850" id ="ob850" fieldValue="true" label="850" tabindex="63"/>850&nbsp;
                                                <s:checkbox name="ob855" id="ob855" fieldValue="true" label="855" tabindex="64"/>855&nbsp;
                                                <s:checkbox name="ob856" id="ob856" fieldValue="true" label="856" tabindex="65"/>856&nbsp;
                                                <s:checkbox name="ob810" id="ob810" fieldValue="true"  label="810" tabindex="66"/>810&nbsp;
                                            </td>      
                                        </tr>
                                    </table>
                                </div>
                                <%-- 850 Inbound   Start div--%>    
                                <div id="ibenvelop850" style="display: none" >
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibvalue850" id="ibvalue850" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibdirection" id="ibdirection" value="" readonly="true" /></h3>
                                    <input type="hidden" name="IB850Transaction" id="IB850Transaction" value="%{IB850Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa850senderIdIB" id="isa850senderIdIB" value="%{isa850senderIdIB}" tabindex="67" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850senderIdIB" id="gs850senderIdIB" value="%{gs850senderIdIB}" tabindex="68" onchange="fieldLengthValidator850IB(this);"  onkeyup="IBsender850();" />
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850senderIdIB" id="st850senderIdIB" value="%{st850senderIdIB}" tabindex="69" onchange="fieldLengthValidator850IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td> 
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa850RecIdIB" id="isa850RecIdIB" value="%{isa850RecIdIB}" tabindex="70" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs850RecIdIB" id="gs850RecIdIB" value="%{gs850RecIdIB}" tabindex="71" cssStyle="width : 144px" onclick="IBrecId850();"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850RecIdIB" id="st850RecIdIB" value="%{st850RecIdIB}" tabindex="72"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa850VersionIB" id="isa850VersionIB" value="%{isa850VersionIB}" tabindex="73" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850VersionIB" id="gs850VersionIB" value="%{gs850VersionIB}" tabindex="74" onchange="fieldLengthValidator850IB(this);" onkeyup="IBversion850(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850VersionIB" id="st850VersionIB" value="%{st850VersionIB}" tabindex="75" onchange="fieldLengthValidator850IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun850GroupIdIB" id="fun850GroupIdIB" value="%{fun850GroupIdIB}" tabindex="76" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res850AgecodeIB" id="res850AgecodeIB" placeholder="x" value="%{res850AgecodeIB}" tabindex="77" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen850AckIB" id="gen850AckIB" tabindex="78" value="%{gen850AckIB}" />
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans850IdcodeIB" id="trans850IdcodeIB" value="%{trans850IdcodeIB}" tabindex="79" onchange="fieldLengthValidator850IB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 850 Inbound   End div--%>
                                <%-- 855 Inbound   Start div--%>
                                <div id="ibenvelop855" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibvalue855" id="ibvalue855" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibdirection855" id="ibdirection855" value="" readonly="true" /></h3>
                                    <input type="hidden" name="IB855Transaction" id="IB855Transaction" value="%{IB855Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa855senderIdIB" id="isa855senderIdIB" value="%{isa855senderIdIB}" tabindex="80" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855senderIdIB" id="gs855senderIdIB" value="%{gs855senderIdIB}" tabindex="81" onchange="fieldLengthValidator855IB(this);" onkeyup="IBsender855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855senderIdIB" id="st855senderIdIB" value="%{st855senderIdIB}" tabindex="82" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa855RecIdIB" id="isa855RecIdIB" value="%{isa855RecIdIB}" tabindex="83" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs855RecIdIB" id="gs855RecIdIB" value="%{gs855RecIdIB}" tabindex="84" cssStyle="width : 144px" onclick="IBrecId855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855RecIdIB" id="st855RecIdIB" value="%{st855RecIdIB}" tabindex="85" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa855VersionIB" id="isa855VersionIB" value="%{isa855VersionIB}" tabindex="86" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855VersionIB" id="gs855VersionIB" value="%{gs855VersionIB}" tabindex="87" onchange="fieldLengthValidator855IB(this);" onkeyup="IBversion855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855VersionIB" id="st855VersionIB" value="%{st855VersionIB}" tabindex="88" onchange="fieldLengthValidator855IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun855GroupIdIB" id="fun855GroupIdIB" value="%{fun855GroupIdIB}" tabindex="89" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res855AgecodeIB" id="res855AgecodeIB" placeholder="X" value="%{res855AgecodeIB}" tabindex="90" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen855AckIB" id="gen855AckIB" tabindex="91" value="%{gen855AckIB}" onchange="" />
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans855IdcodeIB" id="trans855IdcodeIB" value="%{trans855IdcodeIB}" tabindex="92" onchange="fieldLengthValidator855IB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 855 Inbound   End div--%>

                                <%-- 856 Inbound   Start div--%>
                                <div id="ibenvelop856" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibvalue856" id="ibvalue856" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibdirection856" id="ibdirection856" value="" readonly="true" /></h3>
                                    <input type="hidden" name="IB856Transaction" id="IB856Transaction" value="%{IB856Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa856senderIdIB" id="isa856senderIdIB" value="%{isa856senderIdIB}" tabindex="93" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856senderIdIB" id="gs856senderIdIB" value="%{gs856senderIdIB}" tabindex="94" onchange="fieldLengthValidator856IB(this);" onkeyup="IBsender856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856senderIdIB" id="st856senderIdIB" value="%{st856senderIdIB}" tabindex="95" onchange="fieldLengthValidator856IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa856RecIdIB" id="isa856RecIdIB" value="%{isa856RecIdIB}" tabindex="96" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs856RecIdIB" id="gs856RecIdIB" value="%{gs856RecIdIB}" tabindex="97" cssStyle="width : 144px" onclick="IBrecId856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856RecIdIB" id="st856RecIdIB" value="%{st856RecIdIB}" tabindex="98" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa856VersionIB" id="isa856VersionIB" value="%{isa856VersionIB}" tabindex="99" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856VersionIB" id="gs856VersionIB" value="%{gs856VersionIB}" tabindex="100" onchange="fieldLengthValidator856IB(this);" onkeyup="IBversion856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856VersionIB" id="st856VersionIB" value="%{st856VersionIB}" tabindex="101" onchange="fieldLengthValidator856IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun856GroupIdIB" id="fun856GroupIdIB" value="%{fun856GroupIdIB}" tabindex="102" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res856AgecodeIB" id="res856AgecodeIB" placeholder="X" value="%{res856AgecodeIB}" tabindex="103" onchange="fieldLengthValidator856IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen856AckIB" id="gen856AckIB" tabindex="104" value="%{gen856AckIB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans856IdcodeIB" id="trans856IdcodeIB" value="%{trans856IdcodeIB}" tabindex="105" onchange="fieldLengthValidator856IB(this);" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 856 Inbound   End div--%>
                                <%-- 810 Inbound   Start div--%>
                                <div id="ibenvelop810" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibvalue810" id="ibvalue810" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="ibdirection810" id="ibdirection810" value="" readonly="true" /></h3>
                                    <input type="hidden" name="IB810Transaction" id="IB810Transaction" value="%{IB810Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa810senderIdIB" id="isa810senderIdIB" value="%{isa810senderIdIB}" tabindex="106" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810senderIdIB" id="gs810senderIdIB" value="%{gs810senderIdIB}" tabindex="107" onchange="fieldLengthValidator810IB(this);" onkeyup="IBsender810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810senderIdIB" id="st810senderIdIB" value="%{st810senderIdIB}" tabindex="108" onchange="fieldLengthValidator810IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa810RecIdIB" id="isa810RecIdIB" value="%{isa810RecIdIB}" tabindex="109" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs810RecIdIB" id="gs810RecIdIB" value="%{gs810RecIdIB}" tabindex="110" cssStyle="width : 144px" onclick="IBrecId810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810RecIdIB" id="st810RecIdIB" value="%{st810RecIdIB}" tabindex="111"  />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa810VersionIB" id="isa810VersionIB" value="%{isa810VersionIB}" tabindex="112" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810VersionIB" id="gs810VersionIB" value="%{gs810VersionIB}" tabindex="113" onchange="fieldLengthValidator810IB(this);" onkeyup="IBversion810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810VersionIB" id="st810VersionIB" value="%{st810VersionIB}" tabindex="114" onchange="fieldLengthValidator810IB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun810GroupIdIB" id="fun810GroupIdIB" value="%{fun810GroupIdIB}" tabindex="115" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res810AgecodeIB" id="res810AgecodeIB" placeholder="X" value="%{res810AgecodeIB}" tabindex="116" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen810AckIB" id="gen810AckIB" tabindex="117" value="%{gen810AckIB}" onchange="()"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans810IdcodeIB" id="trans810IdcodeIB" value="%{trans810IdcodeIB}" tabindex="118" onchange="fieldLengthValidator810IB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 810 Inbound   End div--%>
                                <%-- 850 outbound   End div--%>
                                <div id="obenvelop850" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue850" id="obvalue850" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection" id="obdirection" value="" readonly="true" /></h3>
                                    <input type="hidden" name="OB850Transaction" id="OB850Transaction" value="%{OB850Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa850senderIdOB" id="isa850senderIdOB" value="%{isa850senderIdOB}" tabindex="119" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850senderIdOB" id="gs850senderIdOB" value="%{gs850senderIdOB}" tabindex="120" onchange="fieldLengthValidator850OB(this);" onkeyup="OBsender850(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850senderIdOB" id="st850senderIdOB" value="%{st850senderIdOB}" tabindex="121" onchange="fieldLengthValidator850OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa850RecIdOB" id="isa850RecIdOB" value="%{isa850RecIdOB}" tabindex="122" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs850RecIdOB" id="gs850RecIdOB" value="%{gs850RecIdOB}" tabindex="123" cssStyle="width : 144px" onclick="OB850recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850RecIdOB" id="st850RecIdOB" value="%{st850RecIdOB}" tabindex="124" /> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa850VersionOB" id="isa850VersionOB" value="%{isa850VersionOB}" tabindex="125" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs850VersionOB" id="gs850VersionOB" value="%{gs850VersionOB}" tabindex="126" onchange="fieldLengthValidator850OB(this);" onkeyup="OBversion850(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st850VersionOB" id="st850VersionOB" value="%{st850VersionOB}" tabindex="127" onchange="fieldLengthValidator850OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun850GroupIdOB" id="fun850GroupIdOB" value="%{fun850GroupIdOB}" tabindex="128" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res850AgecodeOB" id="res850AgecodeOB" placeholder="X" value="%{res850AgecodeOB}" tabindex="129" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen850AckOB" id="gen850AckOB" tabindex="130" value="%{gen850AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans850IdcodeOB" id="trans850IdcodeOB" value="%{trans850IdcodeOB}" tabindex="131" onchange="fieldLengthValidator850OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 850 Outbound   End div--%>
                                <%-- 855 Outbound   Start div--%>
                                <div id="obenvelop855" style="display: none">
                                    <h2 style="color: blue">Envelops&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue855" id="obvalue855" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection855" id="obdirection855" value="" readonly="true" /></h3>
                                    <input type="hidden" name="OB855Transaction" id="OB855Transaction" value="%{OB855Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa855senderIdOB" id="isa855senderIdOB" value="%{isa855senderIdOB}" tabindex="132" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855senderIdOB" id="gs855senderIdOB" value="%{gs855senderIdOB}" tabindex="133" onchange="fieldLengthValidator855OB(this);" onkeyup="OBsender855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855senderIdOB" id="st855senderIdOB" value="%{st855senderIdOB}" tabindex="134" onchange="fieldLengthValidator855OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa855RecIdOB" id="isa855RecIdOB" value="%{isa855RecIdOB}" tabindex="135" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs855RecIdOB" id="gs855RecIdOB" value="%{gs855RecIdOB}" tabindex="136" cssStyle="width : 144px" onclick="OB855recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855RecIdOB" id="st855RecIdOB" value="%{st855RecIdOB}" tabindex="137" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa855VersionOB" id="isa855VersionOB" value="%{isa855VersionOB}" tabindex="138" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs855VersionOB" id="gs855VersionOB" value="%{gs855VersionOB}" tabindex="139" onchange="fieldLengthValidator855OB(this);" onkeyup="OBversion855(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st855VersionOB" id="st855VersionOB" value="%{st855VersionOB}" tabindex="140" onchange="fieldLengthValidator855OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun855GroupIdOB" id="fun855GroupIdOB" value="%{fun855GroupIdOB}" tabindex="141" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res855AgecodeOB" id="res855AgecodeOB" placeholder="X" value="%{res855AgecodeOB}" tabindex="142" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen855AckOB" id="gen855AckOB" tabindex="143" value="%{gen855AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans855IdcodeOB" id="trans855IdcodeOB" value="%{trans855IdcodeOB}" tabindex="144" onchange="fieldLengthValidator855OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 855 Outbound   End div--%>
                                <%-- 856 Outbound   Start div--%>
                                <div id="obenvelop856" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue856" id="obvalue856" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection856" id="obdirection856" value="" readonly="true" /></h3>
                                    <input type="hidden" name="OB856Transaction" id="OB856Transaction" value="%{OB856Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa856senderIdOB" id="isa856senderIdOB" value="%{isa856senderIdOB}" tabindex="143" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856senderIdOB" id="gs856senderIdOB" value="%{gs856senderIdOB}" tabindex="146" onchange="fieldLengthValidator856OB(this);" onkeyup="OBsender856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856senderIdOB" id="st856senderIdOB" value="%{st856senderIdOB}" tabindex="147" onchange="fieldLengthValidator856OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa856RecIdOB" id="isa856RecIdOB" value="%{isa856RecIdOB}" tabindex="148" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs856RecIdOB" id="gs856RecIdOB" value="%{gs856RecIdOB}" tabindex="149" cssStyle="width : 144px" onclick="OB856recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856RecIdOB" id="st856RecIdOB" value="%{st856RecIdOB}" tabindex="150" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa856VersionOB" id="isa856VersionOB" value="%{isa856VersionOB}" tabindex="151" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs856VersionOB" id="gs856VersionOB" value="%{gs856VersionOB}" tabindex="152" onchange="fieldLengthValidator856OB(this);" onkeyup="OBversion856(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st856VersionOB" id="st856VersionOB" value="%{st856VersionOB}" tabindex="153" onchange="fieldLengthValidator856OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun856GroupIdOB" id="fun856GroupIdOB" value="%{fun856GroupIdOB}" tabindex="154" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res856AgecodeOB" id="res856AgecodeOB" placeholder="X" value="%{res856AgecodeOB}" tabindex="155" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen856AckOB" id="gen856AckOB" tabindex="156" value="%{gen856AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans856IdcodeOB" id="trans856IdcodeOB" value="%{trans856IdcodeOB}" tabindex="157" onchange="fieldLengthValidator856OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 856 Outbound   End div--%>
                                <%-- 810 Outbound   Start div--%>
                                <div id="obenvelop810" style="display: none">
                                    <h2 style="color: blue">Envelopes&nbsp;:</h2>
                                    <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obvalue810" id="obvalue810" value="" readonly="true" /></h3>
                                    <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;" name="obdirection810" id="obdirection810" value="" readonly="true" /></h3>
                                    <input type="hidden" name="OB810Transaction" id="OB810Transaction" value="%{OB810Transaction}"/>
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
                                                <s:textfield cssClass="inputStyle" name="isa810senderIdOB" id="isa810senderIdOB" value="%{isa810senderIdOB}" tabindex="158" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810senderIdOB" id="gs810senderIdOB" value="%{gs810senderIdOB}" tabindex="159" onchange="fieldLengthValidator810OB(this);" onkeyup="OBsender810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810senderIdOB" id="st810senderIdOB" value="%{st810senderIdOB}" tabindex="160" onchange="fieldLengthValidator810OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">ReceiverID </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="isa810RecIdOB" id="isa810RecIdOB" value="%{isa810RecIdOB}" tabindex="161" cssStyle="width : 144px"/>
                                            </td>
                                            <td>
                                                <s:select list="{'12345','123456'}" name="gs810RecIdOB" id="gs810RecIdOB" value="%{gs810RecIdOB}" tabindex="162" cssStyle="width : 144px" onclick="OB810recId(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810RecIdOB" id="st810RecIdOB" value="%{st810RecIdOB}" tabindex="163"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Version </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="isa810VersionOB" id="isa810VersionOB" value="%{isa810VersionOB}" tabindex="164" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="gs810VersionOB" id="gs810VersionOB" value="%{gs810VersionOB}" tabindex="165" onchange="fieldLengthValidator810OB(this);" onkeyup="OBversion810(this);"/>
                                            </td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="st810VersionOB" id="st810VersionOB" value="%{st810VersionOB}" tabindex="166" onchange="fieldLengthValidator810OB(this);" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Functional ID Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="fun810GroupIdOB" id="fun810GroupIdOB" value="%{fun810GroupIdOB}" tabindex="167" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Responsible Agency Code:</td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="res810AgecodeOB" id="res810AgecodeOB" placeholder="X" value="%{res810AgecodeOB}" tabindex="168" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Generate An Acknowledgement</td>
                                            <td></td>                                  
                                            <td>
                                                <s:checkbox cssClass="inputStyle" name="gen810AckOB" id="gen810AckOB" tabindex="169" value="%{gen810AckOB}" onchange=""/>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <tr>
                                            <td class="lableLeft">Transaction Set ID Code:</td>
                                            <td></td>
                                            <td></td>
                                            <td>
                                                <s:textfield cssClass="inputStyle" name="trans810IdcodeOB" id="trans810IdcodeOB" value="%{trans810IdcodeOB}" tabindex="170" onchange="fieldLengthValidator810OB(this);"/>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <%-- 810 Outbound   End div--%>
                                <div>

                                    <s:submit   value="Submit" cssClass="button" tabindex="171" onclick="return check()"/>
                                    <s:reset   value="Reset" cssClass="button" tabindex="172"/>
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
    </div>  
    <footer> 
        <p><font color="white">&#169 2016 Miracle Software Systems, Inc. All rights reserved</font></p>
    </footer>
    <script type="text/javascript"> 
        $(function () {
            /*  Inbound function start*/
            $("#ib850").click(function () {
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
                var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
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
        
        function check()
        {
            //alert('hiii');
            var partnerName = document.getElementById("partnerName").value;
            var contactName = document.getElementById("contactName").value;
            var contactEmail = document.getElementById("contactEmail").value;
            var phoneNo = document.getElementById("phoneNo").value;
            var address1 = document.getElementById("address1").value;
            var city = document.getElementById("city").value;
            var state = document.getElementById("state").value;
            var country = document.getElementById("country").value;
            var zipCode = document.getElementById("zipCode").value;
            document.getElementById('tpResultMessage').innerHTML = "";
            var commnProtocol =document.getElementById('commnProtocol').value;
            if(((partnerName==null)||(partnerName=="")) || ((contactName==null)||(contactName=="")) || ((contactEmail==null)||(contactEmail=="")) || ((phoneNo==null)||(phoneNo=="")) || ((address1==null)||(address1=="")) || ((city==null)||(city=="")) || ((state==null)||(state=="")) || ((country==null)||(country=="")) || ((zipCode==null)||(zipCode=="")) || ((commnProtocol=="-1"))){
                document.getElementById('protocolmsg').innerHTML = "<font color=red>Please Enter all amndetory fields in partner details</font>";
                return false;
            }
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
       
       
    </script>
</body>
</html>
