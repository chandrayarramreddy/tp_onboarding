<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@page import="com.mss.ediscv.util.AppConstants" %>
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
        <!-- Fixed navbar -->
        <div class="navbar navbar-inverse navbar-fixed-top headroom" >
            <div class="container">
                <div class="navbar-header">
                    <!-- Button for smallest screens -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
                    <a class="navbar-brand" href="index.html"><img src="http://www.miraclesoft.com/images/logo.png" alt="miraclesoft"></a>
                </div>
                <div class="navbar-collapse collapse">
                    <div class="row">
                        <ul class="nav navbar-nav pull-right">
                            <li>  <h2 class=" " style="color: rgb(255, 255, 255); margin: 13px;">TP On-boarding</h2> </li>
                        </ul>
                    </div>
                </div><!--/.nav-collapse -->
            </div>
        </div> 
        <!-- /.navbar -->
        <!-- Header -->
        <header id="head"  style="padding-top:63px">
            <div class="container">
                <h2 class="thin">Sign in</h2>
            </div>
        </header>
        <!-- /Header -->
        <!-- Intro -->
        <div class="container">
            <div class="row">
                <!-- Article main content -->
                <article class="col-xs-12 maincontent jumbotron" style="padding:0;margin:0">
                    <header class="page-header" style="margin:2px 2px 16px">
                    </header>
                    <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <h3 class="thin text-center">Sign in to your account</h3>
                                <div>
                                    <%if (request.getAttribute(AppConstants.REQ_ERROR_INFO) != null) {
                             out.println("<font size=2 color=red>" + request.getAttribute(AppConstants.REQ_ERROR_INFO).toString() + "</font>");
                         }%>
                                </div>
                                <hr>
                                <s:form action="tpoLoginCheck" method="post" name="tpLoginForm" id="tpLoginForm" theme="simple">
                                    <div class="top-margin">
                                        <label>Username/Email <span class="text-danger">*</span></label>
                                        <s:textfield cssClass="form-control" name="loginId" id="loginId"/>
                                    </div>
                                    <div class="top-margin">
                                        <label>Password <span class="text-danger">*</span></label>
                                        <s:password cssClass="form-control" name="password" id="password"/>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-xs-8">
                                        </div><!-- /.col -->
                                        <div class="col-xs-4">
                                            <!--                            <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>-->
                                            <s:submit value="Sign In" cssClass="btn btn-info btn-block btn-flat" onclick="checkboxstatus()"/>
                                        </div><!-- /.col -->
                                    </div>
                                </s:form>

                                <a href="" data-toggle="modal" data-target="#myModal">I forgot my password</a><br>
                                <div class="modal fade" id="myModal" data-backdrop="static" data-keyword="false" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header"  style="border:0">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h4 class="modal-title" id="myModalLabel">Reset Password</h4>
                                            </div>
                                            <div class="modal-body" style="margin-top: -15px; margin-bottom: -25px;">
                                                <div class="form-group has-feedback">
                                                    <s:textfield  cssClass="form-control" name="userid" id="userid" placeholder="User ID"/>
                                                    <i class="fa fa-user" style="position:absolute;right: 11px;top: 11px"></i>
                                                </div>
                                            </div>
                                            <div class="modal-footer" style="border:0;margin:0">
                                                <div class="row">
                                                    <!-- /.col -->
                                                    <div class="col-xs-2">
                                                        <button type="submit" class="btn btn-primary btn-block btn-flat" onclick="forgotpassword()">Submit</button>
                                                    </div><!-- /.col -->                          <div id="load" style="display: none">Processing... please wait</div>         <div class="col-xs-9">
                                                        <div id="msg" name="msg"></div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </article>
                <!-- /Article -->
            </div>
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

    </body>
</html>