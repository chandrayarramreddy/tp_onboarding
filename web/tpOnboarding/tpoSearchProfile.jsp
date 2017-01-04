<%-- 
    Document   : tpoSearchProfile
    Created on : Dec 27, 2016, 4:45:23 AM
    Author     : miracle1
--%>
<%@page import="com.mss.ediscv.tpOnboarding.TpOnboardingBean"%>
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
        <link rel="stylesheet" href='<s:url value="/includes/plugins/datatables/dataTables.bootstrap.css"/>' type="text/css">

        <script language="JavaScript" src='<s:url value="/includes/js/tpOnbordingDeatails.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/GeneralAjax.js"/>'></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
        <script src='<s:url value="../includes/plugins/datatables/jquery.dataTables.min.js"/>'></script>
        <script src='<s:url value="../includes/plugins/datatables/dataTables.bootstrap.min.js"/>'></script>  

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

            #transferModeget{
                margin:5px;
            }

            #transferModeput{
                margin:5px;
            }




        
        </style>
    </head>
    <body class="home" onload="doOnLoad()">
         <script>
            function doOnLoad() {
                $("#manageProfiles").addClass("active");
            }
        </script>
        <div>
            <s:include value="../includes/template/header.jsp"/>
        </div> 
        <header id="head">
            <div class="container">
                <h3 > <b>Profile Search  </b></h3>
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
            <div id="profileDeleteMsg"></div>
            <s:form action="manageProfile" method="POST" enctype="multipart/form-data" name="searchTpOnboard" id="searchTpOnboard" theme="simple">

                <div id="site_content" class="jumbotron">
                    <div class="container">
                        <div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Protocol Name</label>
                                    <s:select headerKey="-1" headerValue="-- Select --" list="#@java.util.LinkedHashMap@{'FTP':'FTP/FTPS','AS2':'AS2','SFTP':'SFTP','HTTP':'HTTP/HTTPS','SMTP':'SMTP'}" tabindex="1" name="commnProtocol" id="commnProtocol" value="%{commnProtocol}"  cssClass="form-control" />         
                                </div>
                            </div>
                            <div class="col-sm-3">
                                <div class="form-group">
                                    <label>Transfer Mode :</label>
                                    <div class="col-sm-12" style="padding: 0">
                                        <s:radio name="transferMode" id="transferMode" list="{'get','put'}" value="%{transferMode}" onchange="gettransferModeSelection(this.value)" cssClass="from-control"  tabindex="2"></s:radio>&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </div>
<%--                                        <div>
                                            <s:hidden name="id" id="id" value="%{tpOnboardingBean.id}"></s:hidden>
                                            <s:hidden name="commnProtocol" id="commnProtocol" value="%{tpOnboardingBean.commnProtocol}"></s:hidden>
                                        </div>--%>


                                <div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="col-sm-1 pull-right">
                                            <s:reset   value="Reset" cssClass="btn btn-primary pull-right" tabindex="4"/>
                                        </div>
                                        <div class="col-sm-1 pull-right">
                                            <s:submit   value="Search" cssClass="btn btn-primary pull-right" tabindex="3"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="site_content" class="jumbotron">
                        <div class="container"> 
                            <s:if test="#session.tpoSearchProfileList != null"> 

                                <table id="profiletable" class="table table-bordered table-hover">
                                    <thead>
                                    <th>Communication&nbsp;id</th>
                                    <th>Protocol</th>
                                    <th>Transfer&nbsp;mode</th>
                                    <th>Created&nbsp;by</th>
                                    <th>Create&nbsp;date</th>
                                    <th>Edit</th>
                                    <th>Delete</th>
                                    </thead>
                                    <tbody>
                                        <%
                                            int id;
                                            String commnProtocol= "";
                                            java.util.List list = (java.util.List) session.getAttribute(AppConstants.TPO_SearchProfileList);
                                            System.out.println("list----------" + list.size());
                                            if (list.size() != 0) {
                                                TpOnboardingBean tpOnboardingBean;
                                        %>
                                        <%

                                            for (int i = 0; i < list.size(); i++) {
                                                tpOnboardingBean = (TpOnboardingBean) list.get(i);%>
                                        <tr>
                                            <td>
                                                <%
                                                    id = tpOnboardingBean.getId();
                                                    out.println(id);
                                                %>

                                            </td>

                                            <td>
                                                <%
                                                  commnProtocol=  tpOnboardingBean.getCommnProtocol();
                                                    out.println(commnProtocol);
                                                %>

                                            </td>

                                            <td>
                                                <%
                                                    out.println(tpOnboardingBean.getTransferMode());
                                                %>

                                            </td>
                                            <td>
                                                <%

                                                    out.println(tpOnboardingBean.getCreayed_by().toUpperCase());

                                                %>

                                            </td>  
                                            <td>
                                                <%
                                                    out.println(tpOnboardingBean.getCreayed_ts().toString().substring(0, tpOnboardingBean.getCreayed_ts().toString().lastIndexOf(":")));
                                                %>

                                            </td>
                                            <td>
                                                <s:url var="myUrl" action="../tpOnboarding/tpogetProfile.action">
                                                    <s:param name="id"><%=id%></s:param>
                                                    <s:param name="commnProtocol"><%=commnProtocol%></s:param>
                                                </s:url>
                                                <s:a href='%{#myUrl}' ><img src="../includes/images/Edit.gif" height="20px" width="20px"></s:a>



                                                </td>
                                            <%--  <td>
                                                  <% System.out.println("id----" + id);%>
                                                  <s:url var="myUrl" action="../tpOnboarding/tpoDeleteProfile.action">
                                                      <s:param name="communicationId"><%=id%></s:param>
                                                  </s:url>
                                                  
                                                  <s:a href='%{#myUrl}' ><img src="../includes/images/wrong.jpg"></s:a>

                                        </td>--%>
                                            <td>             
                                                <img src="../includes/images/wrong.jpg" height="20px" width="20px" onclick="return getDeleteProfile('<%=id%>')"> 
                                            </td>

                                        </tr>
                                        <%
                                            }
                                        } else {
                                        %>

                                        <%
                                            if (list.size() != 0) {
                                        %>
                                        <tr >
                                            <td align="right" colspan="28" style="background-color: white;">

                                            </td>
                                        </tr> 
                                    </tbody>
                                    <% }%>

                                    <%}%>
                                </table>

                            </s:if> 
                        </s:form>
                    </div>
                </div>
            </div>

        </div>

        <footer class="footer">
            <div class=" ">
                <s:include value="../includes/template/foot.jsp"/>
            </div>
        </footer>
        <script>
            $(function () {
                $('#profiletable').DataTable({
                    "paging": true,
                    "lengthChange": true,
                    "searching": true,
                    "ordering": true,
                    "info": true,
                    "autoWidth": false
                });
            });
        </script>
    </body>
</html>
