<%@page import="com.mss.ediscv.util.AppConstants"%>
<%@page import="com.mss.ediscv.tpOnboarding.TpOnboardingBean"%>
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
                $("#partnerInfo").addClass("active");
                $('#saveButton').attr('disabled', true);
                $('#country').attr('disabled', true);
            }
            function enableEdit(){
                $('#saveButton').attr('disabled', false);
                $('#editButton').attr('disabled', true);
                document.getElementById("phoneNo").readOnly = false;
                document.getElementById("address1").readOnly = false;
                document.getElementById("city").readOnly = false;
                document.getElementById("state").readOnly = false;
                $('#country').attr('disabled', false);
                document.getElementById("zipCode").readOnly = false;
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
                <h2 class="thin">Trading Partner Information</h2>
            </div>
        </header>
        <!-- /Header -->
        <!-- Intro -->
        <div class="container">
            <!-- <h3>Trading Partner</h3> -->		
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
                    <s:form action="updatePartnerInfo" method="post" cssClass="contact-form"  name="partnerInfo" id="partnerInfo" theme="simple">
                        <div id="tpResultMessage"></div>
                        <div class="row">
                            <div class="col-sm-3">
                                <div class="form-group ajax_img">
                                    <label>Partner Name<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="partnerName" id="partnerName" value="%{tpOnboardingBean.partnerName}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Phone No.<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="phoneNo" id="phoneNo" value="%{tpOnboardingBean.phoneNo}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Address<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="address1" id="address1" value="%{tpOnboardingBean.address1}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>City<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="city" id="city" value="%{tpOnboardingBean.city}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>State<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="state" id="state" value="%{tpOnboardingBean.state}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Country<span class="text-danger">*</span></label>
                                    <s:select cssClass="form-control" list="#@java.util.LinkedHashMap@{'US':'USA','IN':'India','CN':'Canada','UK':'United Kingdom'}" name="country" id="country" value="%{tpOnboardingBean.country}" />
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Zip Code<span class="text-danger">*</span></label>
                                    <s:textfield cssClass="form-control" name="zipCode" id="zipCode" value="%{tpOnboardingBean.zipCode}" onchange="fieldLengthValidator(this);" readOnly="true"/>
                                </div>
                            </div>

                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="col-md-1 pull-right"><s:submit id="saveButton" value="Save" cssClass="btn btn-primary" onClick="return check()"/></div>
                                <div class="col-md-1 pull-right"><input id="editButton" type="button" value="Edit" class="btn btn-primary" onClick="enableEdit();"/></div>
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
        <script type="text/javascript">
   
             
            function check()
            {
                var phoneNo=document.getElementById("phoneNo").value;
                var address1=document.getElementById("address1").value;
                var city=document.getElementById("city").value;
                var state=document.getElementById("state").value;
                var country=document.getElementById("country").value;
                var zipCode=document.getElementById("zipCode").value;
                if(phoneNo=="")
                {
                    document.getElementById("tpResultMessage").innerHTML="<font style='color:red'>Please enter phone number</font>";
                    return false;
                }else if(address1=="")
                {
                    document.getElementById("tpResultMessage").innerHTML="<font style='color:red'>Please enter address</font>";
                    return false;
                }
                else if(city==""){
                    document.getElementById("tpResultMessage").innerHTML="<font style='color:red'>Please enter city</font>";
                    return false;
                }
                else if(state=="")
                {
                    document.getElementById("tpResultMessage").innerHTML="<font style='color:red'>Please enter state</font>";
                    return false;
                }
                else if(zipCode=="")
                {
                    document.getElementById("tpResultMessage").innerHTML="<font style='color:red'>Please enter zip code</font>";
                    return false;
                }
                else
                    return true;
            }
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script language="JavaScript" src='<s:url value="/includes/js/headroom.min.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/jQuery.headroom.min.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/template.js"></s:url>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/GeneralAjax.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/tpOnbordingDeatails.js"/>'></script>
    </body>
</html>