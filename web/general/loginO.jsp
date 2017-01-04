<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.mss.ediscv.util.AppConstants" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Miracle TP Onboarding portal</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href='<s:url value="/includes/css/style.css"/>' type="text/css">
        <link rel="stylesheet" href='<s:url value="/includes/css/jquery-ui.css"/>' type="text/css">
        <link rel="stylesheet" href='<s:url value="/includes/css/footerstyle.css"/>' type="text/css"/>
        <script language="JavaScript" src='<s:url value="/includes/js/jquery-1.9.1.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/jquery-ui.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/modernizr-1.5.min.js"/>'></script>
    </head>
    <body>
        <div id="wrapper">
            <div id="main">
                <header>
                    <div id="logo">
                        <s:include value="/includes/template/tpohead.jsp"/>  
                    </div>
                    <nav>
                        <ul class="sf-menu" id="nav">
                            <li class="current"><a href="#">Login</a></li>
                          <li><a href="<s:url action="../general/index"/>">Home</a></li>
                        
                        </ul>
                    </nav>
                </header>
                <div id="site_content">
                    <div class="content">
                        <div class="content_item">
                            <h3>Login Page</h3>
                            <div style="alignment-adjust:central;" >
                                <%if (request.getAttribute(AppConstants.REQ_ERROR_INFO) != null) {
                                        out.println("<font size=2 color=red>" + request.getAttribute(AppConstants.REQ_ERROR_INFO).toString() + "</font>");
                                    }%>
                                <table>
                                    <tbody>
                                        <s:form action="tpoLoginCheck" method="post" name="tpLoginForm" id="tpLoginForm" theme="simple">
                                            <tr>
                                                <td class="lableLeft">User ID </td>
                                                <td>
                                                    <s:textfield cssClass="passwordStyle" name="loginId" id="loginId" onkeypress="return handleEnter(this,event);" tabindex="1"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="lableLeft">Password</td>
                                                <td>
                                                    <s:password cssClass="passwordStyle" name="password" id="password" tabindex="2"/>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="background-color: white;">
                                                    <s:submit value="sign In" cssClass="button"/>
                                                </td>
                                            </tr>
                                        </s:form>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        <footer> 
            <p><font color="white">&#169 2013 Miracle Software Systems, Inc. All rights reserved</font></p>
        </footer>
    </body>
</html>
