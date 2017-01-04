<%-- 
    Document   : tpoSearchEnvelope
    Created on : 27 Dec, 2016, 7:05:38 PM
    Author     : miracle
--%>

<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="com.mss.ediscv.util.AppConstants"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Miracle TP On-boarding portal</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta http-equiv="pragma" content="no-cache" />
        <meta http-equiv="cache-control" content="no-cache" />
           <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"/>
        <link rel="stylesheet" href='<s:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>' type="text/css"/>
         <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/bootstrap.min.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/main.css"/>' type="text/css"/>
         <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/build.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/bootstrap-theme.css" />' media="screen" type="text/css"/>
      
 
        <script language="JavaScript" src='<s:url value="/includes/js/tpOnbordingDeatails.js"/>'></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <style>
            .contact-form{ margin-top:15px;}
            .contact-form .textarea{ min-height:84px; resize:none;}
            .form-control{ 
                box-shadow:none; border-color:#eee;  
                background-color: #fff;
                background-image: none;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
                color: #555;
                display: block;
                font-size: 13px;
                height: 34px;

                width: 100%;
            }
            .form-control:focus{ box-shadow:none; border-color:#2D8FC8;}
            .form-control-feedback{ line-height:50px;}
            .main-btn{ background:#2D8FC8; border-color:#2D8FC8; color:#fff;}
            .main-btn:hover{ background:#00a491;color:#fff;}
            .form-control-feedback {
                line-height: 50px;
                top: 0px;
            }

            .menu_tab i{
                color: #5584ff;
                margin-right: 15px;
            }

        </style>
    </head>
    <body class="home">
        <div>
            <s:include value="../includes/template/header.jsp"/>
        </div> 
        <header id="head">
            <div class="container">
                <h3 > <b>Envelope Search  </b></h3>
            </div>
        </header>     

        <div class="container">


            <%
                if (session.getAttribute(AppConstants.REQ_RESULT_MSG) != null) {
                    String reqponseString = session.getAttribute(AppConstants.REQ_RESULT_MSG).toString();
                    //request.getSession(false).removeAttribute("responseString");
                    out.println(reqponseString);
                    session.setAttribute(AppConstants.REQ_RESULT_MSG, null);
                    //System.out.println("reqponseString-------"+reqponseString);
                    //TpOnboardingBean.po_date;addTpOnboard
                }
            %>
            <s:form action="" method="" enctype="multipart/form-data" name="" id="" theme="simple">

                <div id="site_content" class="jumbotron">
                    <div class="container">
                        <div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Transactions</label>
                                    <s:select headerKey="-1" headerValue="-- Select --" list="#@java.util.LinkedHashMap@{'850':'850','855':'855','856':'856','810':'810'}" tabindex="1" name="" id="" value="{}"  cssClass="form-control" />         
                                </div>
                            </div>
                                <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Direction</label>
                                    <s:select headerKey="-1" headerValue="-- Select --" list="#@java.util.LinkedHashMap@{'Inbound':'Inbound','Outbound':'Outbound'}" tabindex="1" name="" id="" value="{}"  cssClass="form-control" />         
                                </div>
                            </div>
                        </div>
                        <div>
                            <div class="row">
                                <div class="col-md-12">
                                    <s:submit   value="Search" cssClass="btn btn-primary pull-right" tabindex="3"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </s:form>
        </div>
        <div class="container">
            <div id="site_content" class="jumbotron">
                <div class="container">
                    <table id="" class="table table-bordered table-hover">
                        <thead>
                        <th>SenderID</th>
                        <th>ReceiverID</th>
                        <th>Version</th>
                        <th>Functional Code</th>
                        <th>Transaction set</th>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>

                </div>
            </div>
        </div>
    </body>
    <footer class="footer">
        <div class=" ">
            <s:include value="../includes/template/foot.jsp"/>
        </div>
    </footer>
</html>

