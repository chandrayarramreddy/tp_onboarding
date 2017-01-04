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
        <link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700"/>
        <link rel="stylesheet" href='<s:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/bootstrap.min.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/main.css"/>' type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/bootstrap-theme.css" />' media="screen" type="text/css"/>
        <script language="JavaScript" src='<s:url value="/includes/js/headroom.min.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/jQuery.headroom.min.js"/>'></script>
        <script language="JavaScript" src='<s:url value="/includes/js/template.js"/>'></script>
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
    <body onload="setStyle('Envelopes', 'oldEnvelopes');" class="home">
        <script type="text/javascript" src='<s:url value="/includes/js/wz_tooltip.js"/>'></script>
        <div>
            <s:include value="../includes/template/header.jsp"/>
        </div>
        <header id="head">
            <div class="container">
                <h3 > <b>Envelopes  </b></h3>
            </div>
        </header>  
        <div class="container">

            <%
                if (session.getAttribute(AppConstants.REQ_RESULT_MSG) != null) {
                    String reqponseString = session.getAttribute(AppConstants.REQ_RESULT_MSG).toString();
                    //request.getSession(false).removeAttriibute("responseString");
                    out.println(reqponseString);
                    session.setAttribute(AppConstants.REQ_RESULT_MSG, null);
                    //System.out.println("reqponseString-------"+reqponseString);
                    //TpOnboardingBean.po_date;
                }
            %>
            <s:form action="" method="POST" enctype="multipart/form-data" name="addTpOnboard" id="addTpOnboard" theme="simple">


                <div id="site_content" class="jumbotron">

                    <div class="container">
                        <div id="TransactionsDiv" > 
                            <h3 style="color: #2d8fc8">Transactions&nbsp;</h3>
                            <div>                                     
                                <div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label>Inbound&nbsp;Trans</label>
                                            <div class="lableLeft">
                                                <s:checkbox name="ib850" id="ib850" fieldValue="true" label="850" tabindex="59" />850&nbsp;
                                                <s:checkbox name="ib855" id="ib855" fieldValue="true" label="855" tabindex="60" />855&nbsp; 
                                                <s:checkbox name="ib856" id ="ib856" fieldValue="true" label="856" tabindex="61" />856&nbsp; 
                                                <s:checkbox name="ib810" id ="ib810" fieldValue="true" label="810" tabindex="62" />810&nbsp;  
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="form-group">
                                            <label>Outbound&nbsp;Trans</label>
                                            <div class="lableLeft">
                                                <s:checkbox name="ob850" id ="ob850" fieldValue="true" label="850" tabindex="63" />850&nbsp;
                                                <s:checkbox name="ob855" id="ob855" fieldValue="true" label="855" tabindex="64" />855&nbsp;
                                                <s:checkbox name="ob856" id="ob856" fieldValue="true" label="856" tabindex="65" />856&nbsp;
                                                <s:checkbox name="ob810" id="ob810" fieldValue="true"  label="810" tabindex="66" />810&nbsp;
                                            </div>      
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div></div>
                <div id="site_content" class="jumbotron">

                    <div class="container">
                        <%-- 850 Inbound   Start div--%>    
                        <div id="ibenvelop850" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibvalue850" id="ibvalue850" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibdirection" id="ibdirection" value="" readonly="true" /></h3>
                            <input type="hidden" name="IB850Transaction" id="IB850Transaction" value="%{IB850Transaction}"/>
                            <div id="resultMessage"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4><h4>SenderID:</h4></h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa850senderIdIB" id="isa850senderIdIB" value="%{isa850senderIdIB}" tabindex="67" onchange="fieldLengthValidator850IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs850senderIdIB" id="gs850senderIdIB" value="%{gs850senderIdIB}" tabindex="68" onchange="fieldLengthValidator850IB(this);"  onkeyup="IBsender850();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st850senderIdIB" id="st850senderIdIB" value="%{st850senderIdIB}" tabindex="69" onchange="fieldLengthValidator850IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa850RecIdIB" id="isa850RecIdIB" value="%{isa850RecIdIB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs850RecIdIB" id="gs850RecIdIB" value="%{gs850RecIdIB}" tabindex="71" cssClass="form-control" onclick="IBrecId850();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st850RecIdIB" id="st850RecIdIB" value="%{st850RecIdIB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa850VersionIB" id="isa850VersionIB" value="%{isa850VersionIB}" tabindex="73" onchange="fieldLengthValidator850IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs850VersionIB" id="gs850VersionIB" value="%{gs850VersionIB}" tabindex="74" onchange="fieldLengthValidator850IB(this);" onkeyup="IBversion850(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st850VersionIB" id="st850VersionIB" value="%{st850VersionIB}" tabindex="75" onchange="fieldLengthValidator850IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun850GroupIdIB" id="fun850GroupIdIB" value="%{fun850GroupIdIB}" tabindex="76" onchange="fieldLengthValidator850IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Responsible Agency Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res850AgecodeIB" id="res850AgecodeIB" placeholder="x" value="%{res850AgecodeIB}" tabindex="77" onchange="fieldLengthValidator850IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen850AckIB" id="gen850AckIB" tabindex="78" value="%{gen850AckIB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans850IdcodeIB" id="trans850IdcodeIB" value="%{trans850IdcodeIB}" tabindex="79" onchange="fieldLengthValidator850IB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%-- 850 Inbound  End div--%>
                        <%-- 855 Inbound   Start div--%>


                        <div id="ibenvelop855" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibvalue855" id="ibvalue855" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibdirection855" id="ibdirection855" value="" readonly="true" /></h3>
                            <input type="hidden" name="IB855Transaction" id="IB855Transaction" value="%{IB855Transaction}"/>
                            <div id="resultMessage855ib"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4><h4>SenderID:</h4></h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa855senderIdIB" id="isa855senderIdIB" value="%{isa855senderIdIB}" tabindex="67" onchange="fieldLengthValidator855IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs855senderIdIB" id="gs855senderIdIB" value="%{gs855senderIdIB}" tabindex="68" onchange="fieldLengthValidator855IB(this);"  onkeyup="IBsender855();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st855senderIdIB" id="st855senderIdIB" value="%{st855senderIdIB}" tabindex="69" onchange="fieldLengthValidator855IB(this);" />
                                    </div>
                                </div>
                            </div>




                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa855RecIdIB" id="isa855RecIdIB" value="%{isa855RecIdIB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs855RecIdIB" id="gs855RecIdIB" value="%{gs855RecIdIB}" tabindex="71" cssClass="form-control" onclick="IBrecId855();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st855RecIdIB" id="st855RecIdIB" value="%{st855RecIdIB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa855VersionIB" id="isa855VersionIB" value="%{isa855VersionIB}" tabindex="73" onchange="fieldLengthValidator855IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs855VersionIB" id="gs855VersionIB" value="%{gs855VersionIB}" tabindex="74" onchange="fieldLengthValidator855IB(this);" onkeyup="IBversion855(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st855VersionIB" id="st855VersionIB" value="%{st855VersionIB}" tabindex="75" onchange="fieldLengthValidator855IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun855GroupIdIB" id="fun855GroupIdIB" value="%{fun855GroupIdIB}" tabindex="76" onchange="fieldLengthValidator855IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Responsible Agency Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res855AgecodeIB" id="res855AgecodeIB" placeholder="x" value="%{res855AgecodeIB}" tabindex="77" onchange="fieldLengthValidator855IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen855AckIB" id="gen855AckIB" tabindex="78" value="%{gen855AckIB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans855IdcodeIB" id="trans855IdcodeIB" value="%{trans855IdcodeIB}" tabindex="79" onchange="fieldLengthValidator855IB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 855 Inbound  End div--%>

                        <%-- 856 Inbound   Start div--%>


                        <div id="ibenvelop856" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibvalue856" id="ibvalue856" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibdirection856" id="ibdirection856" value="" readonly="true" /></h3>
                            <input type="hidden" name="IB856Transaction" id="IB856Transaction" value="%{IB856Transaction}"/>
                            <div id="resultMessage856ib"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>SenderID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa856senderIdIB" id="isa856senderIdIB" value="%{isa856senderIdIB}" tabindex="67" onchange="fieldLengthValidator856IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs856senderIdIB" id="gs856senderIdIB" value="%{gs856senderIdIB}" tabindex="68" onchange="fieldLengthValidator856IB(this);"  onkeyup="IBsender856();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st856senderIdIB" id="st856senderIdIB" value="%{st856senderIdIB}" tabindex="69" onchange="fieldLengthValidator856IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa856RecIdIB" id="isa856RecIdIB" value="%{isa856RecIdIB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs856RecIdIB" id="gs856RecIdIB" value="%{gs856RecIdIB}" tabindex="71" cssClass="form-control" onclick="IBrecId856();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st856RecIdIB" id="st856RecIdIB" value="%{st856RecIdIB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa856VersionIB" id="isa856VersionIB" value="%{isa856VersionIB}" tabindex="73" onchange="fieldLengthValidator856IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs856VersionIB" id="gs856VersionIB" value="%{gs856VersionIB}" tabindex="74" onchange="fieldLengthValidator856IB(this);" onkeyup="IBversion856(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st856VersionIB" id="st856VersionIB" value="%{st856VersionIB}" tabindex="75" onchange="fieldLengthValidator856IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun856GroupIdIB" id="fun856GroupIdIB" value="%{fun856GroupIdIB}" tabindex="76" onchange="fieldLengthValidator856IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Responsible Agency Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res856AgecodeIB" id="res856AgecodeIB" placeholder="x" value="%{res856AgecodeIB}" tabindex="77" onchange="fieldLengthValidator856IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen856AckIB" id="gen856AckIB" tabindex="78" value="%{gen856AckIB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans856IdcodeIB" id="trans856IdcodeIB" value="%{trans856IdcodeIB}" tabindex="79" onchange="fieldLengthValidator856IB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%-- 856 Inbound   End div--%>
                        <%-- 810 Inbound   Start div--%>


                        <div id="ibenvelop810" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibvalue810" id="ibvalue810" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="ibdirection810" id="ibdirection810" value="" readonly="true" /></h3>
                            <input type="hidden" name="IB810Transaction" id="IB810Transaction" value="%{IB810Transaction}"/>
                            <div id="resultMessage810ib"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4><h4>SenderID:</h4></h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa810senderIdIB" id="isa810senderIdIB" value="%{isa810senderIdIB}" tabindex="67" onchange="fieldLengthValidator810IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs810senderIdIB" id="gs810senderIdIB" value="%{gs810senderIdIB}" tabindex="68" onchange="fieldLengthValidator810IB(this);"  onkeyup="IBsender810();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st810senderIdIB" id="st810senderIdIB" value="%{st810senderIdIB}" tabindex="69" onchange="fieldLengthValidator810IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa810RecIdIB" id="isa810RecIdIB" value="%{isa810RecIdIB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs810RecIdIB" id="gs810RecIdIB" value="%{gs810RecIdIB}" tabindex="71" cssClass="form-control" onclick="IBrecId810();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st810RecIdIB" id="st810RecIdIB" value="%{st810RecIdIB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa810VersionIB" id="isa810VersionIB" value="%{isa810VersionIB}" tabindex="73" onchange="fieldLengthValidator810IB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs810VersionIB" id="gs810VersionIB" value="%{gs810VersionIB}" tabindex="74" onchange="fieldLengthValidator810IB(this);" onkeyup="IBversion810(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st810VersionIB" id="st810VersionIB" value="%{st810VersionIB}" tabindex="75" onchange="fieldLengthValidator810IB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun810GroupIdIB" id="fun810GroupIdIB" value="%{fun810GroupIdIB}" tabindex="76" onchange="fieldLengthValidator810IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Responsible Agency Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res810AgecodeIB" id="res810AgecodeIB" placeholder="x" value="%{res810AgecodeIB}" tabindex="77" onchange="fieldLengthValidator810IB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen810AckIB" id="gen810AckIB" tabindex="78" value="%{gen810AckIB}" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans810IdcodeIB" id="trans810IdcodeIB" value="%{trans810IdcodeIB}" tabindex="79" onchange="fieldLengthValidator810IB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 810 Inbound   End div--%>
                        <%-- 850 outbound   End div--%>


                        <div id="obenvelop850" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obvalue850" id="obvalue850" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obdirection" id="obdirection" value="" readonly="true" /></h3>
                            <input type="hidden" name="OB850Transaction" id="OB850Transaction" value="%{OB850Transaction}"/>
                            <div id="resultMessage850ob"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>SenderID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa850senderIdOB" id="isa850senderIdOB" value="%{isa850senderIdOB}" tabindex="67" onchange="fieldLengthValidator850OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs850senderIdOB" id="gs850senderIdOB" value="%{gs850senderIdOB}" tabindex="68" onchange="fieldLengthValidator850OB(this);"  onkeyup="OBsender850();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st850senderIdOB" id="st850senderIdOB" value="%{st850senderIdOB}" tabindex="69" onchange="fieldLengthValidator850OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="isa850RecIdOB" id="isa850RecIdOB" value="%{isa850RecIdOB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs850RecIdOB" id="gs850RecIdOB" value="%{gs850RecIdOB}" tabindex="71" cssClass="form-control" onclick="OBrecId850();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st850RecIdOB" id="st850RecIdOB" value="%{st850RecIdOB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa850VersionOB" id="isa850VersionOB" value="%{isa850VersionOB}" tabindex="73" onchange="fieldLengthValidator850OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs850VersionOB" id="gs850VersionOB" value="%{gs850VersionOB}" tabindex="74" onchange="fieldLengthValidator850OB(this);" onkeyup="OBversion850(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st850VersionOB" id="st850VersionOB" value="%{st850VersionOB}" tabindex="75" onchange="fieldLengthValidator850OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun850GroupIdOB" id="fun850GroupIdOB" value="%{fun850GroupIdOB}" tabindex="76" onchange="fieldLengthValidator850OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4><h4>Responsible Agency Code:</h4></h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res850AgecodeOB" id="res850AgecodeOB" placeholder="x" value="%{res850AgecodeOB}" tabindex="77" onchange="fieldLengthValidator850OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen850AckOB" id="gen850AckOB" tabindex="78" value="%{gen850AckOB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans850IdcodeOB" id="trans850IdcodeOB" value="%{trans850IdcodeOB}" tabindex="79" onchange="fieldLengthValidator850OB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%-- 850 Outbound   End div--%>
                        <%-- 855 Outbound   Start div--%>


                        <div id="obenvelop855" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obvalue855" id="obvalue855" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obdirection855" id="obdirection855" value="" readonly="true" /></h3>
                            <input type="hidden" name="OB855Transaction" id="OB855Transaction" value="%{OB855Transaction}"/>
                            <div id="resultMessage855ob"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>SenderID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa855senderIdOB" id="isa855senderIdOB" value="%{isa855senderIdOB}" tabindex="67" onchange="fieldLengthValidator855OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs855senderIdOB" id="gs855senderIdOB" value="%{gs855senderIdOB}" tabindex="68" onchange="fieldLengthValidator855OB(this);"  onkeyup="OBsender855();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st855senderIdOB" id="st855senderIdOB" value="%{st855senderIdOB}" tabindex="69" onchange="fieldLengthValidator855OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa855RecIdOB" id="isa855RecIdOB" value="%{isa855RecIdOB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs855RecIdOB" id="gs855RecIdOB" value="%{gs855RecIdOB}" tabindex="71" cssClass="form-control" onclick="OBrecId855();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st855RecIdOB" id="st855RecIdOB" value="%{st855RecIdOB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa855VersionOB" id="isa855VersionOB" value="%{isa855VersionOB}" tabindex="73" onchange="fieldLengthValidator855OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs855VersionOB" id="gs855VersionOB" value="%{gs855VersionOB}" tabindex="74" onchange="fieldLengthValidator855OB(this);" onkeyup="OBversion855(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st855VersionOB" id="st855VersionOB" value="%{st855VersionOB}" tabindex="75" onchange="fieldLengthValidator855OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun855GroupIdOB" id="fun855GroupIdOB" value="%{fun855GroupIdOB}" tabindex="76" onchange="fieldLengthValidator855OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4><h4>Responsible Agency Code:</h4></h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res855AgecodeOB" id="res855AgecodeOB" placeholder="x" value="%{res855AgecodeOB}" tabindex="77" onchange="fieldLengthValidator855OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen855AckOB" id="gen855AckOB" tabindex="78" value="%{gen855AckOB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans855IdcodeOB" id="trans855IdcodeOB" value="%{trans855IdcodeOB}" tabindex="79" onchange="fieldLengthValidator855OB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 855 Outbound   End div--%>
                        <%-- 856 Outbound   Start div--%>


                        <div id="obenvelop856" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obvalue856" id="obvalue856" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obdirection856" id="obdirection856" value="" readonly="true" /></h3>
                            <input type="hidden" name="OB856Transaction" id="OB856Transaction" value="%{OB856Transaction}"/>
                            <div id="resultMessage856ob"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>SenderID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa856senderIdOB" id="isa856senderIdOB" value="%{isa856senderIdOB}" tabindex="67" onchange="fieldLengthValidator856OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs856senderIdOB" id="gs856senderIdOB" value="%{gs856senderIdOB}" tabindex="68" onchange="fieldLengthValidator856OB(this);"  onkeyup="OBsender856();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st856senderIdOB" id="st856senderIdOB" value="%{st856senderIdOB}" tabindex="69" onchange="fieldLengthValidator856OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa856RecIdOB" id="isa856RecIdOB" value="%{isa856RecIdOB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs856RecIdOB" id="gs856RecIdOB" value="%{gs856RecIdOB}" tabindex="71" cssClass="form-control" onclick="OBrecId856();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st856RecIdOB" id="st856RecIdOB" value="%{st856RecIdOB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa856VersionOB" id="isa856VersionOB" value="%{isa856VersionOB}" tabindex="73" onchange="fieldLengthValidator856OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs856VersionOB" id="gs856VersionOB" value="%{gs856VersionOB}" tabindex="74" onchange="fieldLengthValidator856OB(this);" onkeyup="OBversion856(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st856VersionOB" id="st856VersionOB" value="%{st856VersionOB}" tabindex="75" onchange="fieldLengthValidator856OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun856GroupIdOB" id="fun856GroupIdOB" value="%{fun856GroupIdOB}" tabindex="76" onchange="fieldLengthValidator856OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4><h4>Responsible Agency Code:</h4></h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res856AgecodeOB" id="res856AgecodeOB" placeholder="x" value="%{res856AgecodeOB}" tabindex="77" onchange="fieldLengthValidator856OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen856AckOB" id="gen856AckOB" tabindex="78" value="%{gen856AckOB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans856IdcodeOB" id="trans856IdcodeOB" value="%{trans856IdcodeOB}" tabindex="79" onchange="fieldLengthValidator856OB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <%-- 856 Outbound   End div--%>
                        <%-- 810 Outbound   Start div--%>


                        <div id="obenvelop810" style="display: none" >
                            <h3 style="color: #2d8fc8">Envelopes&nbsp;:</h3>
                            <h3 style="color: black">Transaction : &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obvalue810" id="obvalue810" value="" readonly="true" /></h3>
                            <h3 style="color: black">Direction &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;&nbsp;<s:textfield type="text" style="border: 0;cursor:default" name="obdirection810" id="obdirection810" value="" readonly="true" /></h3>
                            <input type="hidden" name="OB810Transaction" id="OB810Transaction" value="%{OB810Transaction}"/>
                            <div id="resultMessage810ob"></div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4><h4>SenderID:</h4></h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ISA</label>
                                        <s:textfield cssClass="form-control" name="isa810senderIdOB" id="isa810senderIdOB" value="%{isa810senderIdOB}" tabindex="67" onchange="fieldLengthValidator810OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>GS</label>
                                        <s:textfield cssClass="form-control" name="gs810senderIdOB" id="gs810senderIdOB" value="%{gs810senderIdOB}" tabindex="68" onchange="fieldLengthValidator810OB(this);"  onkeyup="OBsender810();" />
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <label>ST</label>
                                        <s:textfield cssClass="form-control" name="st810senderIdOB" id="st810senderIdOB" value="%{st810senderIdOB}" tabindex="69" onchange="fieldLengthValidator810OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>ReceiverID:</h4> </div> 
                                    </div></div>
                                <div class="col-sm-3">
                                    <div class="form-group">

                                        <s:select list="{'12345','123456'}" name="isa810RecIdOB" id="isa810RecIdOB" value="%{isa810RecIdOB}" tabindex="70" cssClass="form-control"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:select list="{'12345','123456'}" name="gs810RecIdOB" id="gs810RecIdOB" value="%{gs810RecIdOB}" tabindex="71" cssClass="form-control" onclick="OBrecId810();"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st810RecIdOB" id="st810RecIdOB" value="%{st810RecIdOB}" tabindex="72"  />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div><h4>Version:</h4> </div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="isa810VersionOB" id="isa810VersionOB" value="%{isa810VersionOB}" tabindex="73" onchange="fieldLengthValidator810OB(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="gs810VersionOB" id="gs810VersionOB" value="%{gs810VersionOB}" tabindex="74" onchange="fieldLengthValidator810OB(this);" onkeyup="OBversion810(this);"/>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="st810VersionOB" id="st810VersionOB" value="%{st810VersionOB}" tabindex="75" onchange="fieldLengthValidator810OB(this);" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Functional ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="fun810GroupIdOB" id="fun810GroupIdOB" value="%{fun810GroupIdOB}" tabindex="76" onchange="fieldLengthValidator810OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Responsible Agency Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="res810AgecodeOB" id="res810AgecodeOB" placeholder="x" value="%{res810AgecodeOB}" tabindex="77" onchange="fieldLengthValidator810OB(this);"/>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Generate An Acknowledgement:</h4></div>
                                    </div>                                  
                                </div> 
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:checkbox  name="gen810AckOB" id="gen810AckOB" tabindex="78" value="%{gen810AckOB}" />
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <div ><h4>Transaction Set ID Code:</h4></div>
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <div class="form-group">
                                        <s:textfield cssClass="form-control" name="trans810IdcodeOB" id="trans810IdcodeOB" value="%{trans810IdcodeOB}" tabindex="79" onchange="fieldLengthValidator810OB(this);"/>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <%-- 810 Outbound   End div--%>
                        <div class="col-sm-12">
                            
                            <div class="col-sm-1  pull-right">
                                <s:reset   value="Reset" cssClass="btn btn-primary pull-right" tabindex="172"/>
                            </div>
                            <div class="col-sm-1 pull-right">
                                <s:submit   value="Save" cssClass="btn btn-primary pull-right" tabindex="171" onclick="return check()"/>
                            </div>

                        </div>
                    </div>
                </div>
            </s:form>

        </div>
    </div>
</div>
</div>
</div> 
</div>        
</div>  



<footer class="footer">
    <div class=" ">
        <s:include value="../includes/template/foot.jsp"/>
    </div>
</footer>
<script type="text/javascript">
    $(function () {
        /*  Inbound function start*/
        $("#ib850").click(function () {
            // var divansferMode = document.forms["addTpOnboard"]["divansferMode"].value;
            // var protocol=document.getElementById("commnProtocol").value;
            // if((divansferMode == 'get') || (divansferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){

            if ($(this).is(":checked")) {
                document.getElementById('ibvalue850').value = '850';
                document.getElementById('ibdirection').value = 'Inbound';
                document.getElementById('trans850IdcodeIB').value = '850';
                document.getElementById('trans850IdcodeIB').readOnly = true;
                $("#ibenvelop850").show();
            } else {
                $("#ibenvelop850").hide();
            }
            //   }else{
            // document.getElementById("divansferModeMsg").style.display = "block";
            //  document.getElementById('divansferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            //   }
        });
        $("#ib855").click(function () {
            // var divansferMode = document.forms["addTpOnboard"]["divansferMode"].value;
            //  var protocol=document.getElementById("commnProtocol").value;
            //  if((divansferMode == 'get') || (divansferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('ibvalue855').value = '855';
                document.getElementById('ibdirection855').value = 'Inbound';
                document.getElementById('trans855IdcodeIB').value = '855';
                document.getElementById('trans855IdcodeIB').readOnly = true;
                $("#ibenvelop855").show();
            } else {
                $("#ibenvelop855").hide();
            }
            //  }else{
            //   document.getElementById("divansferModeMsg").style.display = "block";
            //   document.getElementById('divansferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            //  }
        });
        $("#ib856").click(function () {
            //  var divansferMode = document.forms["addTpOnboard"]["divansferMode"].value;
            //  var protocol=document.getElementById("commnProtocol").value;
            //  if((divansferMode == 'get') || (divansferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('ibvalue856').value = '856';
                document.getElementById('ibdirection856').value = 'Inbound';
                document.getElementById('trans856IdcodeIB').value = '856';
                document.getElementById('trans856IdcodeIB').readOnly = true;
                $("#ibenvelop856").show();
            } else {
                $("#ibenvelop856").hide();
            }
            //  }else{
            //  document.getElementById("divansferModeMsg").style.display = "block";
            // document.getElementById('divansferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            //   }

        });
        $("#ib810").click(function () {
            // var divansferMode = document.forms["addTpOnboard"]["divansferMode"].value;
            // var protocol=document.getElementById("commnProtocol").value;
            // if((divansferMode == 'get') || (divansferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('ibvalue810').value = '810';
                document.getElementById('ibdirection810').value = 'Inbound';
                document.getElementById('trans810IdcodeIB').value = '810';
                document.getElementById('trans810IdcodeIB').readOnly = true;
                $("#ibenvelop810").show();
            } else {
                $("#ibenvelop810").hide();
            }
            // }else{
            //  document.getElementById("transferModeMsg").style.display = "block";
            //   document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            // }
        });
        /*  Outbound function Start*/
        $("#ob850").click(function () {
            //   var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
            //   var protocol=document.getElementById("commnProtocol").value;
            //   if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('obvalue850').value = '850';
                document.getElementById('trans850IdcodeOB').value = '850';
                document.getElementById('trans850IdcodeOB').readOnly = true;
                document.getElementById('obdirection').value = 'Outbound';
                $("#obenvelop850").show();
            } else {
                $("#obenvelop850").hide();
            }
            // }else{
            //  document.getElementById("transferModeMsg").style.display = "block";
            //  document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            // }
        });
        $("#ob855").click(function () {
            //  var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
            //  var protocol=document.getElementById("commnProtocol").value;
            // if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('obvalue855').value = '855';
                document.getElementById('trans855IdcodeOB').value = '855';
                document.getElementById('trans855IdcodeOB').readOnly = true;
                document.getElementById('obdirection855').value = 'Outbound';
                $("#obenvelop855").show();
            } else {
                $("#obenvelop855").hide();
            }
            //   }else{
            //     document.getElementById("transferModeMsg").style.display = "block";
            //     document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            //  }
        });
        $("#ob856").click(function () {
            // var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
            //   var protocol=document.getElementById("commnProtocol").value;
            // if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('obvalue856').value = '856';
                document.getElementById('trans856IdcodeOB').value = '856';
                document.getElementById('trans856IdcodeOB').readOnly = true;
                document.getElementById('obdirection856').value = 'Outbound';
                $("#obenvelop856").show();
            } else {
                $("#obenvelop856").hide();
            }
            // }else{
            //   document.getElementById("transferModeMsg").style.display = "block";
            //  document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            // }
        });
        $("#ob810").click(function () {
            //    var transferMode = document.forms["addTpOnboard"]["transferMode"].value;
            //   var protocol=document.getElementById("commnProtocol").value;
            //  if((transferMode == 'get') || (transferMode == 'put') || (protocol == 'AS2') || (protocol == 'SMTP')){
            if ($(this).is(":checked")) {
                document.getElementById('obvalue810').value = '810';
                document.getElementById('trans810IdcodeOB').value = '810';
                document.getElementById('trans810IdcodeOB').readOnly = true;
                document.getElementById('obdirection810').value = 'Outbound';
                $("#obenvelop810").show();
            } else {
                $("#obenvelop810").hide();
            }
            //  }else{
            //   document.getElementById("transferModeMsg").style.display = "block";
            //document.getElementById('transferModeMsg').innerHTML = "<font color=red>Please select Transfer Mode.</font>";
            //  }
        });
        /*  Outbound function End*/
    });

    function check()
    {
        var ib850 = document.getElementById("ib850").checked;
        var ib855 = document.getElementById("ib855").checked;
        var ib856 = document.getElementById("ib856").checked;
        var ib810 = document.getElementById("ib810").checked;
        var ob850 = document.getElementById("ob850").checked;
        var ob855 = document.getElementById("ob855").checked;
        var ob856 = document.getElementById("ob856").checked;
        var ob810 = document.getElementById("ob810").checked;
        var x = true;
        if (ib850 == true)
        {
            x = checkib850();
            if (x == false)
                return false;
        }
        if (ib855 == true)
        {
            x = checkib855();
            if (x == false)
                return false;
        }
        if (ib856 == true)
        {
            x = checkib856();
            if (x == false)
                return false;
        }
        if (ib810 == true)
        {
            x = checkib810();
            if (x == false)
                return false;
        }
        if (ob850 == true)
        {
            x = checkob850();
            if (x == false)
                return false;
        }
        if (ob855 == true)
        {
            x = checkob855();
            if (x == false)
                return false;
        }
        if (ob856 == true)
        {
            x = checkob856();
            if (x == false)
                return false;
        }
        if (ob810 == true)
        {
            x = checkob810();
            if (x == false)
                return false;
        }
        return x;
    }


</script>
</body>
</html>