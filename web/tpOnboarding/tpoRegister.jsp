<%@page import="com.mss.ediscv.util.AppConstants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport"    content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author"      content="TP On-boarding">
        <title>TP On-boarding</title>
        <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/bootstrap-theme.css"/>' media="screen" >
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/bootstrap.min.css"/>'>
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/main.css"/>'>
        <script>
            function doOnLoad() {
                $("#userAdd").addClass("active");
            }
        </script>
    </head>
    <body class="home" onload="doOnLoad()">
        <div>
            <s:include value="../includes/template/header.jsp"/>
        </div>
        <!-- Header -->
        <header id="head">
            <div class="container">
                <h2 class="thin">User Creation</h2>
            </div>
        </header>
        <!-- /Header -->
        <!-- Intro -->
        <div class="container">
            <!--  <h3>Trading Partner</h3> -->		
            <!-- Highlights - jumbotron -->
            <div class="jumbotron">
                <div class="container">
                    <%
                        if (session.getAttribute(AppConstants.REQ_RESULT_MSG) != null) {
                            String reqponseString = session.getAttribute(AppConstants.REQ_RESULT_MSG).toString();
                            out.println(reqponseString);
                            session.setAttribute(AppConstants.REQ_RESULT_MSG, null);
                        }
                    %>
                    <div id="loadingImage"></div>
                    <s:form action="tpoRegister" method="post" cssClass="contact-form" name="tporeg" id="tporeg" theme="simple">
                        <div id="tpResultMessage"></div>
                        <div id="tpRegisteValidation"></div>
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Partner <span class="text-danger">*</span></label>
                                    <s:select headerKey="-1" headerValue="--select--" cssClass="form-control" list="partnerNameList" name="regpartnerName" id="regpartnerName" value="%{regpartnerName}"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Contact Name<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="regcontactName" id="regcontactName" placeholder="Contact Name" value="%{regcontactName}" onchange="fieldLengthValidator(this);"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group ajax_img">
                                    <label>Email<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="regcontactEmail" id="regcontactEmail" placeholder="E-mail" value="%{regcontactEmail}" onchange="validateEmail(this);fieldLengthValidator(this);" onblur="isExistedUserEmail();"/><i id="correctImg1" style="display: none;"  class="fa fa-check"></i>
                                    <i id="wrongImg1" style="display: none;" class="fa fa-times"></i><i id="loadingImageEmailCheck" style="display: none;" class="fa fa-spinner"></i>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Password<span class="text-danger">*</span></label>
                                    <s:password cssClass="form-control" name="regpassword" id="regpassword" placeholder="Password"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Country<span class="text-danger">*</span></label>
                                    <s:select cssClass="form-control" list="#@java.util.LinkedHashMap@{'US':'USA','IN':'India','CN':'Canada','UK':'United Kingdom'}" name="regcountry" id="regcountry" value="%{country}" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Phone No.<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="regphoneNo" id="regphoneNo" placeholder="Phone No" value="%{regphoneNo}" onchange="fieldLengthValidator(this);"/>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-1 pull-right"> <s:submit value="Register" cssClass="btn btn-primary" onclick="return usrCreationValidation();" /></div>
                                <div class="col-md-1 pull-right"> <s:reset value="Reset" cssClass="btn btn-primary"/></div>
                            </div>
                        </div>
                    </s:form>
                </div>
            </div>
            <!-- /Highlights -->
        </div>
        <footer class="footer">
            <div class=" ">
                <s:include value="../includes/template/foot.jsp"/>
            </div>
        </footer>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script language="JavaScript" src='<s:url value="/includes/js/headroom.min.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/jQuery.headroom.min.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/template.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/GeneralAjax.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/tpOnbordingDeatails.js"/>'></script>
    </body>
</html>