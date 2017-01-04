<%-- 
    Document   : template
    Created on : Mar 12, 2013, 2:14:50 AM
    Author     : Nagireddy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
    <head>
        <title>PLS : Pro1.0</title>
        <meta name="description" content="website description" />
        <meta name="keywords" content="website keywords, website keywords" />
        <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
        <link rel="stylesheet" href='<s:url value="/includes/css/style_1.css"/>'
              type="text/css"/>

        <link rel="stylesheet" href='<s:url value="/includes/css/jquery-ui.css"/>'
              type="text/css"/>

        <link rel="stylesheet" href='<s:url value="/includes/css/helpText.css"/>' type="text/css"/>

        <link rel="stylesheet" href='<s:url value="/includes/css/dhtmlxcalendar.css"/>'
              type="text/css"/>
        <link rel="stylesheet" href='<s:url value="/includes/css/dhtmlxcalendar_omega.css"/>' type="text/css"/>

        <script type="text/JavaScript" src="<s:url value="/includes/js/DateValidation.js"/>"></script>
        <script language="JavaScript"  src='<s:url value="/includes/js/jquery-1.9.1.js"></s:url>'></script>
        <script language="JavaScript"  src='<s:url value="/includes/js/jquery-ui.js"/>'></script>
        <script type="text/JavaScript"  src='<s:url value="/includes/js/overlay.js"/>'></script>

        <script type="text/JavaScript" src="<s:url value="/includes/js/CalendarTime.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/AppConstants.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/GeneralAjax.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/tpvalidations.js"/>"></script>
        <script type="text/JavaScript" src="<s:url value="/includes/js/common.js"/>"></script>
        <script language="JavaScript"
        src='<s:url value="/includes/js/dhtmlxcalendar.js"/>'></script>

        <script>
            $(function() {
                $( document ).tooltip();
            });
        </script>

        <script>
            var myCalendar;
            function doOnLoad() {
                myCalendar = new dhtmlXCalendarObject(["OriginpnetDate","OriginplntDate","DestinationpnetDate","DestinationplntDate","FinancialInformationGateArrival","FinancialInformationGateAdmitted","FinancialInformationLoaded","FinancialInformationActualPU","FinancialInformationActualDelivery","FinancialInformationFreightBillRecieved"]);
                myCalendar.setSkin('omega');
                myCalendar.setDateFormat("%m/%d/%Y");
                myCalendar.hideTime();
            }
        </script>

        <script>
            $(function() {
                $( "#datepicker" ).datepicker();
                $( "#datepickerfrom" ).datepicker();
            });

        </script>

        <script type="text/javascript"> 
            $(function() {
                $('#attach_box').click(function() {
                    $('#sec_box').show();
                    return false;
                });        
            });
            $(function() {
                $('#detail_link').click(function() {
                    $('#detail_box').show();
                    return false;
                });        
            });
        </script>

    </head>

    <body onload="doOnLoad();">





        <div id="wrapper">      




            <!--  <div id="main">-->
            <header>
                <div id="logo">
                    <s:include value="/includes/template/head.jsp"/>       
                    <h3 class="head_title"><b>PLS PRO 1.0 </b></h3>
                    <gcse:search></gcse:search>



                </div>


            </header>
            <div id="site_content">


                <!-- overlay starting -->



                <!-- Community textfield overy start-->    



                <div id="orginloadoverlay1"></div>

                <div id="orginloadpecialBox1">

                    <table style="width: 100%;">

                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Commodity</span> 





                                <span style="float: right;">  <a  href="#" onmousedown="commiditytoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td >Commodity</td>
                                            <td> <s:textarea rows="8" cols="48" name="commidity" class="selectBoxOverlay"/> </td>

                                        </tr>


                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>
                <!--          commidity textfield overy end            -->   
                <!-- Orgin textfield overy start-->    



                <div id="orginloadoverlay"></div>

                <div id="orginloadpecialBox">

                    <table style="width: 100%;">
                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Origin</span> 





                                <span style="float: right;">  <a  href="#" onmousedown="origintoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td >Look&nbsp;Up&nbsp;Location</td>
                                            <td> <s:textarea rows="8" cols="48" name="commidity" class="selectBoxOverlay"/> </td>

                                        </tr>


                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>
                <!--           Orgin textfield overy end            --> 
                <!-- Add&Dock textfield overy start-->    



                <div id="adddockloadoverlay"></div>

                <div id="adddockloadpecialBox">

                    <table style="width: 100%;">
                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Add&nbsp;Dock</span> 





                                <span style="float: right;">  <a  href="#" onmousedown="adddocktoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td >Dock&nbsp;Name</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Percentage</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>           
                                            <td >Scheduled</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Remove&nbsp;Desk</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>

                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>
                <!--         orgin  Add&Dock textfield overy end            -->

                <!-- dstinatio Add&Dock textfield overy start-->    



                <div id="adddockloadoverlay1"></div>

                <div id="adddockloadpecialBox1">

                    <table style="width: 100%;">
                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Add&nbsp;Dock</span> 

                                <span style="float: right;">  <a  href="#" onmousedown="destadddocktoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td >Dock&nbsp;Name</td>
                                            <td> <s:textfield rows="8" cols="8" name="dockname" class="selectBoxOverlay"/> </td>
                                            <td >Percentage</td>
                                            <td> <s:textfield rows="8" cols="8" name="perctange" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>           
                                            <td >Scheduled</td>
                                            <td> <s:textfield rows="8" cols="8" name="schduled" class="selectBoxOverlay"/> </td>
                                            <td >Unload&nbsp;Contact</td> 
                                            <td> <s:textfield rows="8" cols="8" name="unloadcontact" class="selectBoxOverlay"/> </td>
                                        </tr> 
                                        <tr>
                                            <td >Unload&nbsp;#</td> 
                                            <td> <s:textfield rows="8" cols="8" name="unload" class="selectBoxOverlay"/> </td>            
                                            <td >Remove&nbsp;Desk</td> 
                                            <td> <s:textfield rows="8" cols="8" name="removedesk" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>
                <!--           destinigation textfield overy end            -->

                <!-- Add&Meterials textfield overy start-->
                <div id="addmeterailoverlay"></div>

                <div id="addmeterailpecialBox">

                    <table style="width: 100%;">
                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Add&nbsp;Materials</span> 





                                <span style="float: right;">  <a  href="#" onmousedown="addmeterialstoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td >Weight</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Pieces</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>           
                                            <td >Bill&nbsp;of&nbsp;Loading</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Po&nbsp;Number</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td >Release&nbsp;Id</td>  
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Shop&nbsp;Order</td> 
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Customer&nbsp;Part#</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Pick&nbsp;Up</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td >Drop&nbspOff</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td >Remove&nbsp;Meterial</td> 
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>


                                            <!--                                        </div>-->

                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>
                <!--           Add&Meterials textfield overy end            -->

                <!-- Add&Notifiction textfield overy start-->
                <div id="addmeterailoverlay"></div>

                <div id="profilespecialBox">

                    <table style="width: 100%;">
                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Add&nbsp;Notifiction</span> 

                                <span style="float: right;">  <a  href="#" onmousedown="addnotificatiotoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td>
                                                Email
                                            </td>
                                            <td> <s:textfield  name="commidity" class="selectBoxOverlay"/> </td>
                                            <td>
                                                Method
                                            </td>
                                            <td> <s:textfield  name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Initial&nbsp;Message</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td>Award/Unaward</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>

                                        </tr>
                                        <tr>
                                            <td>Schedule</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td>Gate&nbsp;Arrival</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Confirm/Pick&nbsp;Up</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td>Gate&nbsp;Destination</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Confirm&nbsp;Delive</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td>BOL&nbsp;At&nbsp;Award</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>
                                            <td>BOL&nbsp;At&nbsp;Pick&nbsp;Up</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>
                                            <td>Remove</td>
                                            <td> <s:textfield rows="8" cols="8" name="commidity" class="selectBoxOverlay"/> </td>


                                        </tr>
                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>

                <!--           Add&Notifiction textfield overy end            -->
                <!-- Copy&Load textfield overy start-->    



                <div id="copyloadoverlay"></div>

                <div id="copyloadpecialBox">

                    <table style="width: 100%;">

                        <tr class="overlayHeader">
                            <td><span class="overlayHeaderFonts" style="font-weight: bold;color: white;">Copy&nbsp;This&nbsp;Load</span> 





                                <span style="float: right;">  <a  href="#" onmousedown="copyLoadtoggleOverlay()" style="color:#869fa3;font-family: myHeaderFonts;">CLOSE</a> </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="" name="addnoti">
                                    <table style="width: 100%;">

                                        <tr>
                                            <td >ShipmentNumber</td>
                                            <td> <s:textfield rows="8" cols="8" name="shipnum" class="selectBoxOverlay"/> </td>
                                            <td >Weight</td>
                                            <td> <s:textfield rows="8" cols="8" name="weight" class="selectBoxOverlay"/> </td>
                                        </tr>
                                        <tr>           
                                            <td >Remove&nbsp;Copy</td>
                                            <td> <s:textfield rows="8" cols="8" name="removecopy" class="selectBoxOverlay"/> </td>

                                        </tr>

                                        <tr>

                                            <td colspan="3" align="right">
                                                <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                                <input type="button" name="save" value="save" class="uploadButton" onclick=""/>


                                                <!--                                        </div>-->
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>

                <!--           Copy&Load textfield overy end            -->

                <!-- Cancel overlay-->
                <div id="cancelOverlay"></div>

                <div id="cancelspecialBox">

                    <table style="width: 100%;">

                        <tr class="overlayHeader">
                            <td class="td_extend">

                                <span id="headTitle" class="overlayHeaderFonts" style="font-weight: bold;color: white;">Load&nbsp;Modification</span> 





                                <span style="float: right;font-weight: bold;color: white;">  &nbsp;&nbsp;&nbsp; </span>
                                <br><br>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <s:form action="#" name="addnoti" >
                                    <s:hidden name="instanceId" id="instanceId" value="%{instanceId}"/>
                                    <s:hidden name="docBusId" id="docBusId" value="%{docBusId}"/>

                                    <table style="width: 100%;">

                                        <tr>
                                            <td colspan="3">Comments<font color="red">*</font></td>
                                        </tr>
                                        <tr>
                                            <td> <s:textarea rows="3" cols="95" style='width: 445px; height: 45px;' value="" name="cancelReason" cssClass="inputTextarea1" onchange="fieldLengthValidator(this);"  id="cancelReason"/> </td>
                                        </tr>
                                        <tr>  
                                            <td colspan="3"> <input type="checkbox" name="cancelFlag" id="cancelFlag"/> <label id="checkBoxMsg"> Do you want to save this Load.</label></td>
                                        </tr>


                                        <tr>

                                            <td colspan="3" align="right">
                                                <input type="button" name="save" value="Confirm" onclick="loadSubmission();" class="button">
                                                <input type="button"  Class="button" onclick="saveSubmitToggleOverlay('no');" value="Cancel" >                                  </div>
                                            </td>
                                        </tr>
                                    </table>
                                </s:form>

                            </td>    
                        </tr>

                    </table>
                </div>
                <!-- Cancel overlay end-->
                <!-- overlay starting end -->
                <div id="sidebar_container">


                    <div id="detail_box" style="display: none;"> 
                        <div class="sidebar">
                            <h3>Detail Information</h3>
                            <div class="sidebar_item">
                                <h4>Detail 1</h4>
                                <h5>Detail 2</h5>
                                <h5>Detail 2</h5>
                            </div>
                        </div>


                        <div class="sidebar_base"></div>
                    </div>


                </div>

                <div class="content">
                    <div class="content_item">
                        <!-- heading for the content -->
                        <%
                            if (session.getAttribute("resultMessage") != null) {
                                out.print(session.getAttribute("resultMessage"));
                                session.removeAttribute("resultMessage");
                            }
                        %>
                        <div>
                            <h3 style="background:#006B3F; margin-left: -2%;width:150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Create/Edit Load</h3>
                            <div>

                                <!-- end of the heading tag -->
                                <!-- content div start -->
                                <div style="alignment-adjust:central;" >
                                    <s:form action="#" method="post" name="plsForm1" id="plsForm1" theme="simple">
                                        <s:hidden name="instanceId" id="instanceId" value="%{instanceId}"/>
                                        <s:hidden name="docBusId" id="docBusId" value="%{docBusId}"/>
                                        <s:hidden name="version" id="version" value="%{version}"/>
                                        <s:hidden name="file_path" id="file_path" value="%{file_path}"/>

                                        <s:hidden name="cancelReason"  id="cancelReason1" value=""/>
                                        <s:hidden name="operationType"  id="operationType" value=""/>




                                        <table>
                                            <!-- basic info start -->
                                            <tr><td colspan="8">

                                                    <div>

                                                        <table style="width: 800px" border="0">


                                                            <tr>
                                                                <td class="lable_red">Customer </td>
                                                                <td> 
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_customer" id="h_customer" value="%{h_customer}" tabindex="1"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_customer" id="s_customer" value="%{logisticsLoadTenderingXml.s_customer}" tabindex="1" readonly="true" />
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td class="lable_red">Location </td>
                                                                <td>
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_location" id="h_location" value="%{h_location}" tabindex="2"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_location" id="s_location" value="%{logisticsLoadTenderingXml.s_location}" tabindex="2"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td class="lable_red">Bill&nbsp;To </td>
                                                                <td>
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_bill" id="h_bill" value="%{h_bill}" tabindex="3"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_bill" id="s_bill" value="%{logisticsLoadTenderingXml.s_bill}" tabindex="3"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td>Created&nbsp;By </td>
                                                                <td> 
                                                                    <%-- <s:property value="%{createdBy}"/> --%>
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_createdBy" id="h_createdBy" value="%{h_createdBy}" tabindex="4"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="s_createdBy" id="s_createdBy" value="%{s_createdBy}" tabindex="4"/>
                                                                </td>

                                                            </tr>


                                                            <tr>
                                                                <td>Load&nbsp;Type </td>
                                                                <td> 
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_load" id="h_load" value="%{h_load}" tabindex="5"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="s_load" id="s_load" value="%{s_load}" tabindex="5"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td>Freight&nbsp;Terms </td>
                                                                <td> 
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_frieghtterms" id="h_frieghtterms" value="%{h_frieghtterms}" tabindex="6"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="s_frieghtterms" id="s_frieghtterms" value="%{s_frieghtterms}" tabindex="6"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td class="lable_red">Equipment&nbsp;Type </td>
                                                                <td> 
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_equipment" id="h_equipmenttype" value="%{h_equipmenttype}" tabindex="7"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="s_equipment" id="s_equipmenttype" value="%{s_equipmenttype}" tabindex="7"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td>Posted&nbsp;By </td>
                                                                <td> 
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_PostedBy" id="h_PostedBy" value="%{h_PostedBy}" tabindex="8"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="s_PostedBy" id="s_PostedBy" value="%{s_PostedBy}" tabindex="8"/>
                                                                    <%-- <s:property value="%{postedBy}"/> --%>
                                                                </td>

                                                            </tr>

                                                            <tr>
                                                                <td class="lable_red">Commodity </td>
                                                                <td> 

                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_commodity" id="h_commodity" value="%{h_commodity}" tabindex="9"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_commodity" id="s_commodity" value="%{logisticsLoadTenderingXml.s_commodity}" tabindex="9"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>

                                                                <td class="lable_red">Weight </td>
                                                                <td>
                                                                    <%--<s:hidden cssClass="inputstyle130" name="h_weight" id="h_weight" value="%{h_weight}" tabindex="10"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_weight" id="s_weight" value="%{logisticsLoadTenderingXml.s_weight}" tabindex="10"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td class="lable_red">Total&nbsp;Pieces </td>
                                                                <td> 
                                                                    <%--<s:hidden name="h_totalpices" id="h_totalpices" cssClass="inputstyle130"  value="%{h_totalpices}" tabindex="11"/>--%>
                                                                    <s:textfield name="logisticsLoadTenderingXml.s_totalpices" id="s_totalpices" cssClass="inputstyle130"  value="%{logisticsLoadTenderingXml.s_totalpices}" tabindex="11"/>
                                                                </td>

                                                            </tr>


                                                            <tr>

                                                                <td>Shipment# </td>
                                                                <td>
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_shipment" id="h_shipment" value="%{h_shipment}" tabindex="12" />--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_shipment" id="s_shipment" value="%{logisticsLoadTenderingXml.s_shipment}" tabindex="12" readonly="true"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td colspan="4"></td>
                                                                <td>Load&nbsp;Id </td>
                                                                <td>
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_loadid" id="h_loadid" value="%{h_loadid}" tabindex="13"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="s_loadid" id="s_loadid" value="%{s_loadid}" tabindex="13" readonly="true"/>
                                                                </td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td></td><td></td>
                                                                <td>Status</td>

                                                                <td>  
                                                                    <%--<s:hidden  cssClass="inputstyle130" name="h_status" id="h_status" value="%{h_status}" tabindex="14"/>--%>
                                                                    <s:textfield  cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_status" id="s_status" value="%{logisticsLoadTenderingXml.s_status}" tabindex="14"/>
                                                                </td>


                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <br/>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </div>


                                                </td></tr>
                                            <!-- basic info END -->
                                            <tr><td style="color: #D14514"><b>Load Information</b></td></tr>
                                            <tr><td>
                                                    <div style=" border: 2px solid  #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;" class=" ">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <label for="Priority" >Priority</label> 
                                                                </td>

                                                                <td>
                                                                    <s:textfield  cssClass="inputstyle130" label="Priority"  name="logisticsLoadTenderingXml.s_LoadInformationPriority" value="%{logisticsLoadTenderingXml.s_LoadInformationPriority}" id="logisticsLoadTenderingXml.s_LoadInformationPriority" tabindex="15"/>
                                                                    <%--<s:hidden  cssClass="inputstyle130" label="Priority" name="h_LoadInformationPriority" id="h_LoadInformationPriority" tabindex="15"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Hazmat" >Hazmat</label> 
                                                                </td>

                                                                <td>
                                                                    <s:checkbox name="LoadInformationHazmat" id="LoadInformationHazmat" fieldValue="true" tabindex="16"/>


                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Premium">Premium</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationPremium" id="LoadInformationPremium" fieldValue="true" tabindex="17" />


                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Master BOL">Master BOL</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield  cssClass="inputstyle130" label="Master BOL" name="logisticsLoadTenderingXml.s_LoadInformationMasterBOL" value="%{logisticsLoadTenderingXml.s_LoadInformationMasterBOL}" id="logisticsLoadTenderingXml.s_LoadInformationMasterBOL" tabindex="18" />
                                                                    <%--<s:hidden  cssClass="inputstyle130" label="Master BOL" name="h_LoadInformationMasterBOL" id="h_LoadInformationMasterBOL" tabindex="18" />--%>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Commodity Desc" >Commodity Desc</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130" label="Commodity Desc" name="logisticsLoadTenderingXml.s_LoadInformationCommodityDesc" value="%{logisticsLoadTenderingXml.s_LoadInformationCommodityDesc}" id="s_LoadInformationCommodityDesc" tabindex="19" />
                                                                    <%--<s:hidden cssClass="inputstyle130" label="Commodity Desc" name="h_LoadInformationCommodityDesc" id="h_LoadInformationCommodityDesc" tabindex="19"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Redioactive" >Redioactive</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationRedioactive" id="LoadInformationRedioactive" fieldValue="true" label="Redioactive" tabindex="20"/>


                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Shipper Premium Available" >Shipper&nbsp;Premium&nbsp;Available</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationShipperPremiumAvailable" id="LoadInformationShipperPremiumAvailable" fieldValue="true" label="Shipper Premium Available" tabindex="21"/>

                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Ref #">Ref #</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_LoadInformationRef" value="%{logisticsLoadTenderingXml.s_LoadInformationRef}" id="s_LoadInformationRef" tabindex="22"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationRef" id="h_LoadInformationRef" tabindex="22" />--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Frieght Charge To">Freight&nbsp;Charge&nbsp;To</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield  cssClass="inputstyle130"  name="s_LoadInformationFrieghtCharge" id="s_LoadInformationFrieghtCharge" tabindex="23"/>
                                                                    <%--<s:hidden  cssClass="inputstyle130"  name="h_LoadInformationFrieghtCharge" id="h_LoadInformationFrieghtCharge" tabindex="23"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Ships With">Ships With</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationShipsWith" id="LoadInformationShipsWith" fieldValue="true" label="Ships With" tabindex="24"/>

                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="GL Ref Code">GL Ref Code</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_LoadInformationGLRefCode" value="%{logisticsLoadTenderingXml.s_LoadInformationGLRefCode}" id="s_LoadInformationGLRefCode" tabindex="25"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationGLRefCode" id="h_LoadInformationGLRefCode" tabindex="25"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="General Ledger #" >General&nbsp;Ledger&nbsp;#</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_LoadInformationGeneralLedger" value="%{logisticsLoadTenderingXml.s_LoadInformationGeneralLedger}" id="s_LoadInformationGeneralLedger" tabindex="26"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationGeneralLedger" id="h_LoadInformationGeneralLedger" tabindex="26"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Freight Paid By" >Freight&nbsp;Paid&nbsp;By</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationFreightPaidBy" id="s_LoadInformationFreightPaidBy" tabindex="27"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationFreightPaidBy" id="h_LoadInformationFreightPaidBy" tabindex="27"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="OP Load" >OP Load</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationOPLoad" id="LoadInformationOPLoad" fieldValue="true" label="OP Load" tabindex="28"/>

                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Target Rate Min" >Target Rate Min</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130" label="Target Rate Min" name="s_LoadInformationTargetRateMin" id="s_LoadInformationTargetRateMin" tabindex="29"/>
                                                                    <%--<s:hidden cssClass="inputstyle130" label="Target Rate Min" name="h_LoadInformationTargetRateMin" id="h_LoadInformationTargetRateMin" tabindex="29"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Order/SO #">Order/SO #</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationOrderSO" id="s_LoadInformationOrderSO" tabindex="30" />
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationOrderSO" id="h_LoadInformationOrderSO" tabindex="30"/>--%>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Ready Reason" >Ready Reason</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationReadyReason" id="s_LoadInformationReadyReason" tabindex="31" />
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationReadyReason" id="h_LoadInformationReadyReason" tabindex="31" />--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Hold For Release">Hold&nbsp;For&nbsp;Release</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationHoldForRelease" id="LoadInformationHoldForRelease"  fieldValue="true" label="Hold For Release" tabindex="32"/>

                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Target Rate Max" >Target&nbsp;Rate&nbsp;Max</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationTargetRateMax" id="s_LoadInformationTargetRateMax" tabindex="33" />
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationTargetRateMax" id="h_LoadInformationTargetRateMax" tabindex="33" />--%>
                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="PRO Number" >PRO Number</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationPRONumber" id="s_LoadInformationPRONumber" tabindex="34"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationPRONumber" id="h_LoadInformationPRONumber" tabindex="34"/>--%>
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Split/Combine Indicator" >Split/Combine&nbsp;Indicator</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield  cssClass="inputstyle130" label="Split" name="s_LoadInformationSplit" id="s_LoadInformationSplit" tabindex="35" />
                                                                    <%--<s:hidden  cssClass="inputstyle130" label="Split" name="h_LoadInformationSplit" id="h_LoadInformationSplit" tabindex="35" />--%>
                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="DSP Scheduling Only?" >DSP&nbsp;Scheduling&nbsp;Only?</label> 
                                                                </td>
                                                                <td>

                                                                    <s:checkbox name="LoadInformationDSPSchedulingOnly" id="LoadInformationDSPSchedulingOnly"  tabindex="36"/>

                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Override Target Rate" >Override&nbsp;Target&nbsp;Rate</label> 
                                                                </td>
                                                                <td>
                                                                    <s:checkbox name="LoadInformationOverrideTargetRate" id="LoadInformationOverrideTargetRate" fieldValue="true" tabindex="37"/>

                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Barge#">Barge#</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_LoadInformationBarge" value="%{logisticsLoadTenderingXml.s_LoadInformationBarge}" id="s_LoadInformationBarge" tabindex="38"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationBarge" id="h_LoadInformationBarge" tabindex="38"/>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Mileage" >Mileage</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_LoadInformationMileage" value="%{logisticsLoadTenderingXml.s_LoadInformationMileage}" id="logisticsLoadTenderingXml.s_LoadInformationMileage" tabindex="39" />
                                                                    <%--<s:hidden cssClass="inputstyle130" name="h_LoadInformationMileage" id="h_LoadInformationMileage" tabindex="39" />--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Transit Days" >Transit Days</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130" name="s_LoadInformationTransitDays" id="s_LoadInformationTransitDays" tabindex="40"/>
                                                                    <%--<s:hidden cssClass="inputstyle130" name="h_LoadInformationTransitDays" id="h_LoadInformationTransitDays" tabindex="40"/>--%>
                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Rate Contact" >Rate Contact</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130" label="Rate Contact" name="s_LoadInformationRateContact" id="s_LoadInformationRateContact" tabindex="41"/>
                                                                    <%--<s:hidden cssClass="inputstyle130" label="Rate Contact" name="h_LoadInformationRateContact" id="h_LoadInformationRateContact" tabindex="41"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="PO #" >PO #</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_LoadInformationPO" id="logisticsLoadTenderingXml.s_LoadInformationPO" tabindex="42"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="h_LoadInformationPO" id="h_LoadInformationPO" tabindex="42"/>--%>
                                                                </td>    
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Booked" >Booked</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield  cssClass="inputstyle130" label="Booked" name="logisticsLoadTenderingXml.s_LoadInformationBooked" id="s_LoadInformationBooked" value="%{logisticsLoadTenderingXml.s_LoadInformationBooked}" tabindex="43"/>
                                                                    <%--<s:hidden  cssClass="inputstyle130" label="Booked" name="h_LoadInformationBooked" id="h_LoadInformationBooked" tabindex="43"/>--%>
                                                                </td> 
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>

                                                                <td>
                                                                    <label for="Cargo Value" >Cargo Value</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationCargoValue" id="s_LoadInformationCargoValue" tabindex="44"/>
                                                                    <%--<s:hidden cssClass="inputstyle130"  name="s_LoadInformationCargoValue" id="s_LoadInformationCargoValue" tabindex="44"/>--%>
                                                                </td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>

                                                                <td>
                                                                    <label for="Permit #" >Permit #</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130"  name="s_LoadInformationPermit" id="s_LoadInformationPermit" tabindex="45"/>
                                                                    <%--<s:hidden cssClass="inputstyle130" name="h_LoadInformationPermit" id="h_LoadInformationPermit" tabindex="45"/>--%>
                                                                </td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td>
                                                                    <label for="Pickup #">Pickup #</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_LoadInformationPickup" value="%{logisticsLoadTenderingXml.s_LoadInformationPickup}" id="s_LoadInformationPickup" tabindex="46"/>
                                                                    <%--<s:hidden cssClass="inputstyle130" name="h_LoadInformationPickup"  id="h_LoadInformationPickup" tabindex="46"/>--%>
                                                                </td> 


                                                            </tr>

                                                        </table>
                                                    </div>
                                                </td></tr>
                                            <tr>
                                                <td><br></td>
                                            </tr>  
                                            <tr><td style="color: #D14514"><b>Measurements</b></td></tr>
                                            <tr><td>
                                                    <div style=" border: 2px solid  #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;" class=" ">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <label for="Height" >Height</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:textfield name="s_Measurementheight" id="s_Measurementheight" tabindex="47" cssClass="inputstyle130"/>
                                                                    <%--<s:hidden name="h_Measurementheight" id="h_Measurementheight" tabindex="47" cssClass="inputstyle130"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Width" >Width</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:textfield name="s_Measurementwidth" id="s_Measurementwidth" tabindex="48" cssClass="inputstyle130"/>
                                                                    <%--<s:hidden name="h_Measurementwidth" id="h_Measurementwidth" tabindex="48" cssClass="inputstyle130"/>--%>
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Length" >Length</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:textfield name="s_Measurementlength" id="s_Measurementlength" tabindex="49" cssClass="inputstyle130"/>
                                                                    <%--<s:hidden name="h_Measurementlength" id="h_Measurementlength" tabindex="49" cssClass="inputstyle130"/>--%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Truck Weight" >Truck Weight</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:textfield name="logisticsLoadTenderingXml.s_Measurementtruckweight" id="s_Measurementtruckweight" value="%{logisticsLoadTenderingXml.s_Measurementtruckweight}" tabindex="50" cssClass="inputstyle130"/>
                                                                    <%--<s:hidden name="h_Measurementtruckweight" id="h_Measurementtruckweight" tabindex="50" cssClass="inputstyle130"/>--%>
                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Gross Weight" >Gross Weight</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:textfield name="logisticsLoadTenderingXml.s_Measurementgrossweight" value="%{logisticsLoadTenderingXml.s_Measurementgrossweight}" id="s_Measurementgrossweight" tabindex="51" cssClass="inputstyle130"/>
                                                                    <%--<s:hidden name="h_Measurementgrossweight" id="h_Measurementgrossweight" tabindex="51" cssClass="inputstyle130"/>--%>
                                                                </td> 
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="OverHeight" >OverHeight</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:checkbox name="Measurementoverheight" id="Measurementoverheight" value="overheight" tabindex="52" />
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="OverWidth" >OverWidth</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:checkbox name="Measurementoverwidth" id="Measurementoverwidth" value="overwidth" tabindex="53" />
                                                                </td>
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="OverLength" >OverLength</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:checkbox name="Measurementoverlength" id="Measurementoverlength" value="overlength" tabindex="54" />
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="OverWeight" >OverWeight</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:checkbox name="Measurementoverweight" id="Measurementoverweight" value="overweight" tabindex="55" />
                                                                </td> 
                                                                <td colspan="8"></td>
                                                                <td>
                                                                    <label for="Super Load" >Super Load</label> 
                                                                </td>  
                                                                <td>
                                                                    <s:checkbox name="Measurementsuperload" id="Measurementsuperload" value="overwidth" tabindex="56" />
                                                                </td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td>
                                                                    <label for="Permit Load" >Permit Load</label> 
                                                                </td>  
                                                                <td>

                                                                    <s:checkbox name="Measurementpermitload"  id="Measurementpermitload"  tabindex="57" />
                                                                </td>

                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <label for="Authorized to ship light" >Authorized to ship light</label> 
                                                                </td>
                                                                <td>
                                                                    <s:textfield name="Measurementauthrized" id="Measurementauthrized" tabindex="58" cssClass="selectStyle130"/>
                                                                </td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td></td> <td></td>
                                                                <td><label for="Ship Light Cpmment" >Ship Light Comment</label></td>
                                                                <td colspan="2">
                                                                    <s:textarea name="logisticsLoadTenderingXml.Measurementshiplightcomment" value="%{logisticsLoadTenderingXml.Measurementshiplightcomment}" id="Measurementshiplightcomment" cols="40" rows="5" wrap="true" tabindex="59"  ></s:textarea>
                                                                    </td >
                                                                </tr>
                                                            </table>
                                                        </div>

                                                    </td></tr>

                                                <tr>
                                                    <td>
                                                        <div>
                                                            <br>
                                                            <table>
                                                                <tr>
                                                                    <td colspan="2" style="color: #D14514"><label for="Location"><b>Shipper Instructions</b></label></td>
                                                                    <td colspan="2" style="color: #D14514"><label for="Location"><b>Carrier Instructions</b></label></td>
                                                                    <td colspan="2" style="color: #D14514"><label for="Location"><b>BOL Instructions</b></label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2" class="div_grayColorbg bx_red">
                                                                    <s:textarea name="logisticsLoadTenderingXml.ShipperInstructions" value="%{logisticsLoadTenderingXml.ShipperInstructions}" id="ShipperInstructions"  onchange="fieldLengthValidator(this);" cols="40" rows="3" wrap="true" tabindex="60"></s:textarea>
                                                                    </td >
                                                                    <td colspan="2" class="div_grayColorbg bx_red">
                                                                    <s:textarea name="logisticsLoadTenderingXml.CarrierInstructions" value="%{logisticsLoadTenderingXml.CarrierInstructions}" id="CarrierInstructions" onchange="fieldLengthValidator(this);" cols="40" rows="3" wrap="true" tabindex="61"></s:textarea>
                                                                    </td>
                                                                    <td colspan="2" class="div_grayColorbg bx_red">
                                                                    <s:textarea name="logisticsLoadTenderingXml.BOLInstructions" value="%{logisticsLoadTenderingXml.BOLInstructions}" id="BOLInstructions" onchange="fieldLengthValidator(this);" cols="40" rows="3" wrap="true" tabindex="62"></s:textarea>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <!-- start of origin -->
                                                <tr>
                                                    <td>
                                                        <br>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <table border="0" width="100%">
                                                            <tr>
                                                                <td style="color: #D14514" width="52%">
                                                                    <b> Origin </b>
                                                                <%-- <span style="float:right;">
                                                                        <a href="javascript:origintoggleOverlay();">
                                                                            <img src="<s:url value="./includes/images/addicon.png"/>" width="15" height="15" width="15" height="15" style="float:right; margin: 0px 441px  0px 0px;" /></a>

                                                        </span>--%>


                                                            </td>

                                                            <td style="color: #D14514" width="50%">
                                                                <b>Destination </b> 
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </td>

                                            </tr>
                                            <tr>
                                                <td colspan="4">
                                                    <table border="0" width="100%">
                                                        <tr>
                                                            <td  width="48%" style=" border: 2px solid  #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;" class=" ">
                                                                <table>
                                                                    <tr><td><label for="Authorized to ship light">Look Up Location</label></td>

                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginLookUpLocation" id="s_OriginLookUpLocation" tabindex="63"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginLookUpLocation" id="h_OriginLookUpLocation" tabindex="63"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Name" >Name</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginName" id="s_OriginName" tabindex="64"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginName" id="h_OriginName" tabindex="64"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Contact Name" >Contact Name</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" value="%{logisticsLoadTenderingXml.s_OriginContactName}" name="logisticsLoadTenderingXml.s_OriginContactName" id="s_OriginContactName" tabindex="65" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginContactName" id="h_OriginContactName" tabindex="65" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Contact Phone" >Contact Phone</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginContactPhone" id="s_OriginContactPhone" tabindex="66" onkeyup="IsNumeric3(this);" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginContactPhone" id="h_OriginContactPhone" tabindex="66"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address" >Address</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_OriginAddress" value="%{logisticsLoadTenderingXml.s_OriginAddress}"  id="logisticsLoadTenderingXml.s_OriginAddress" tabindex="67"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_OriginAddress" id="h_OriginAddress" tabindex="67"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address 2" >Address 2</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="s_OriginAddress2" id="s_OriginAddress2" tabindex="68"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_OriginAddress2" id="h_OriginAddress2" tabindex="68"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address 3" >Address 3</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="s_OriginAddress3" id="s_OriginAddress3" tabindex="69"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_OriginAddress3" id="h_OriginAddress3" tabindex="69"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address 4" >Address 4</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="s_OriginAddress4" id="s_OriginAddress4" tabindex="70"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_OriginAddress4" id="h_OriginAddress4" tabindex="70"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label for="Country" >Country</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_OriginCountrys" value="%{logisticsLoadTenderingXml.s_OriginCountrys}" id="logisticsLoadTenderingXml.s_OriginCountrys" tabindex="71"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginCountrys" id="h_OriginCountrys" tabindex="71"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label for="City/State/Postal Code" >City/State/Postal Code</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_OriginCityStatePostalCode" value="%{logisticsLoadTenderingXml.s_OriginCityStatePostalCode}" id="logisticsLoadTenderingXml.s_OriginCityStatePostalCode" tabindex="72" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginCityStatePostalCode" id="h_OriginCityStatePostalCode" tabindex="72" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Need Appointment" >Need Appointment?</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:checkbox name="logisticsLoadTenderingXml.org_NeedAppointment" value="%{logisticsLoadTenderingXml.org_NeedAppointment}" fieldValue="true"  label="Need Appointment?"/>

                                                                        </td> 
                                                                    </tr>
                                                                    <tr> 
                                                                        <td><label for="Do Not Schedule Before?" >Do Not Schedule Before?</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginDoNotScheduleBefore" id="s_OriginDoNotScheduleBefore" tabindex="73" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginDoNotScheduleBefore" id="h_OriginDoNotScheduleBefore" tabindex="73" />--%>
                                                                        </td>  
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label for="Do Not Schedule After?" >Do Not Schedule After?</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginDoNotScheduleAfter" id="s_OriginDoNotScheduleAfter" tabindex="74" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginDoNotScheduleAfter" id="h_OriginDoNotScheduleAfter" tabindex="74" />--%>
                                                                        </td>     
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Appointment # " >Appointment #</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginAppointment" id="s_OriginAppointment" tabindex="75" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginAppointment" id="h_OriginAppointment" tabindex="75" />--%>
                                                                        </td>
                                                                    </tr>
                                                    
                                                                    <tr>

                                                                        <td class="inputstyle110" >PNET</td>
                                                                        <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="logisticsLoadTenderingXml.OriginpnetDate"  value="%{logisticsLoadTenderingXml.OriginpnetDate}" id="OriginpnetDate" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this); " tabindex="76"/>
                                                                            <!-- <a href="#" title="Please Click on Text box">
                                                                                 <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                            <s:textfield style="width:30px" id="Originpdate1" value="%{logisticsLoadTenderingXml.Originpdate1}" name="logisticsLoadTenderingXml.Originpdate1" placeholder="hh" tabindex="77"/>   :  <s:textfield style="width:30px" id="Originpdate2" name="logisticsLoadTenderingXml.Originpdate2" value="%{logisticsLoadTenderingXml.Originpdate2}" placeholder="mm" tabindex="78"/> ET
                                                                        </td>


                                                                    </tr>
                                                                    <tr>

                                                                        <td class="inputstyle110" >PNLT</td>
                                                                        <td colspan="3"><s:textfield placeholder="MM/dd/YYYY" cssClass="inputstyle130" name="logisticsLoadTenderingXml.OriginplntDate" id="OriginplntDate" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="79"/>

                                                                    </tr>
                                                                    <tr>
                                                                        <td class="inputstyle110" >Original&nbsp;Deliver&nbsp;No&nbsp;Later</td>
                                                                         <td><s:textfield  cssClass="inputstyle130" name=" " id="" maxLength="5" tabindex="79"/>
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td class="inputstyle110" >Than&nbsp;Date/Time</td>


                                                                        <td><s:textfield  cssClass="inputstyle130" name=" " id="" maxLength="5" tabindex="79"/>
                                                                        </td>
                                                                    </tr>
                             

                                                                </table>

                                                            </td><td>&nbsp;</td>
                                                            <td  width="48%" style=" border: 2px solid  #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;" class=" ">
                                                                <table>
                                                                    <tr>
                                                                        <td><label for="Authorized to ship light" >Look Up Location</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_DestinationLookUpLocation" id="s_DestinationLookUpLocation" tabindex="63"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationLookUpLocation" id="h_DestinationLookUpLocation" tabindex="63"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Name" >Name</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_DestinationName" id="s_DestinationName" tabindex="64"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationName" id="h_DestinationName" tabindex="64"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Contact Name" >Contact Name</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_DestinationContactName" value="%{logisticsLoadTenderingXml.s_DestinationContactName}" id="s_DestinationContactName" tabindex="65" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationContactName" id="h_DestinationContactName" tabindex="65" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Contact Phone" >Contact Phone</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_DestinationContactPhone" id="s_DestinationContactPhone" tabindex="66" onkeyup="IsNumeric3(this);"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationContactPhone" id="h_DestinationContactPhone" tabindex="66"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address" >Address</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_DestinationAddress" value="%{logisticsLoadTenderingXml.s_DestinationAddress}" id="logisticsLoadTenderingXml.s_DestinationAddress" tabindex="67"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_DestinationAddress" id="h_DestinationAddress" tabindex="67"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address 2" >Address 2</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="logisticsLoadTenderingXml.s_DestinationAddress2" id="logisticsLoadTenderingXml.s_DestinationAddress2" tabindex="68"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_OriginAddress2" id="h_OriginAddress2" tabindex="68"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address 3" >Address 3</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="s_DestinationAddress3" id="s_DestinationAddress3" tabindex="69"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_DestinationAddress3" id="h_DestinationnAddress3" tabindex="69"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Address 4" >Address 4</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130" name="s_DestinationAddress4" id="s_DestinationAddress4" tabindex="70"/>
                                                                            <%--<s:hidden cssClass="inputstyle130" name="h_DestinationAddress4" id="h_DestinationAddress4" tabindex="70"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label for="Country" >Country</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_DestinationCountrys" value="%{logisticsLoadTenderingXml.s_DestinationCountrys}" id="logisticsLoadTenderingXml.s_DestinationCountrys" tabindex="71"/>
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationCountrys" id="h_DestinationCountrys" tabindex="71"/>--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label for="City/State/Postal Code" >City/State/Postal Code</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_DestinationCityStatePostalCode" value="%{logisticsLoadTenderingXml.s_DestinationCityStatePostalCode}"  id="logisticsLoadTenderingXml.s_DestinationCityStatePostalCode" tabindex="72" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationCityStatePostalCode" id="h_DestinationCityStatePostalCode" tabindex="72" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Need Appointment?" >Need Appointment?</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:checkbox name="logisticsLoadTenderingXml.dest_NeedAppointment" value="%{logisticsLoadTenderingXml.dest_NeedAppointment}" fieldValue="true" label="Need Appointment?"/>

                                                                        </td> 
                                                                    </tr>
                                                                    <tr> 
                                                                        <td><label for="Do Not Schedule Before?" >Do Not Schedule Before?</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_DestinationDoNotScheduleBefore" id="s_DestinationnDoNotScheduleBefore" tabindex="73" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationDoNotScheduleBefore" id="h_DestinationDoNotScheduleBefore" tabindex="73" />--%>
                                                                        </td>  
                                                                    </tr>
                                                                    <tr>
                                                                        <td><label for="Do Not Schedule After?" >Do Not Schedule After?</label></td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_OriginDoNotScheduleAfter" id="s_OriginDoNotScheduleAfter" tabindex="74" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_OriginDoNotScheduleAfter" id="h_OriginDoNotScheduleAfter" tabindex="74" />--%>
                                                                        </td>     
                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="Appointment # " >Appointment #</label> 
                                                                        </td>
                                                                        <td>
                                                                            <s:textfield cssClass="inputstyle130"  name="s_DestinationAppointment" id="s_DestinationAppointment" tabindex="75" />
                                                                            <%--<s:hidden cssClass="inputstyle130"  name="h_DestinationAppointment" id="h_DestinationAppointment" tabindex="75" />--%>
                                                                        </td>
                                                                    </tr>
                                                                    <%--<tr>
                                                                      <td>
                                                                           <label for="Add master Node Notable Contact" >Need Appointment</label> 
                                                                       </td>
                                                                       <td>
                                                                           <s:checkbox name="Add master Node Notable Contact" fieldValue="true" label="Add master Node Notable Contact"/>

                                                                </td>   
                                                            </tr>--%>
                                                                    <tr>

                                                                        <td class="inputstyle110" >DNET</td>
                                                                        <td colspan="3"><s:textfield placeholder="MM/dd/YYYY" cssClass="inputstyle130" name="logisticsLoadTenderingXml.DestinationpnetDate" value="%{logisticsLoadTenderingXml.DestinationpnetDate}"  id="DestinationpnetDate" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this); " tabindex="76"/>
                                                                            <!-- <a href="#" title="Please Click on Text box">
                                                                                 <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a> -->
                                                                            <s:textfield style="width:30px" id="Destinationpdate1" value="%{logisticsLoadTenderingXml.Destinationpdate1}" name="logisticsLoadTenderingXml.Destinationpdate1" placeholder="hh" tabindex="77"/>   :  <s:textfield style="width:30px" id="Destinationpdate2" value="%{logisticsLoadTenderingXml.Destinationpdate2}" name="logisticsLoadTenderingXml.Destinationpdate2" placeholder="mm" tabindex="78"/> ET
                                                                        </td>


                                                                    </tr>
                                                                    <tr>

                                                                        <td class="inputstyle110" >DNLT</td>
                                                                        <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="logisticsLoadTenderingXml.DestinationplntDate" value="%{logisticsLoadTenderingXml.DestinationplntDate}" id="DestinationplntDate" maxLength="5"  onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="79"/>
                                                                            <!--                                                    <a href="#" title="Please Click on Text box">
                                                                                                                                    <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                            <s:textfield style="width:30px"  name="logisticsLoadTenderingXml.Destinationpldate1" value="%{logisticsLoadTenderingXml.Destinationpldate1}" id="Destinationpldate1" placeholder="hh" tabindex="80"/>   :  <s:textfield style="width:30px" name="logisticsLoadTenderingXml.Destinationpldate2" value="%{logisticsLoadTenderingXml.Destinationpldate2}" id="Destinationpldate2" placeholder="mm" tabindex="81"/> ET
                                                                        </td>


                                                                    </tr>
                                                                    <tr>
                                                                        <td>
                                                                            <label for="orignal Pickup No Later Than Date/Time" >Original&nbsp;Deliver&nbsp;No&nbsp;Later</label> 
                                                                        </td>
                                                                         <td><s:textfield  cssClass="inputstyle130" name=" " id="" maxLength="5" tabindex="79"/>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="inputstyle110" >Than&nbsp;Date/Time</td>


                                                                        <td><s:textfield  cssClass="inputstyle130" name=" " id="" maxLength="5" tabindex="80"/>
                                                                        </td>
                                                                    </tr>
                                                        </tr>
                                                        <tr>
                                                            <td><br></td>
                                                        </tr> 
                 
                                                    </table> 

                                                </td>
                                            </tr>
                                        </table>

                                        </td>

                                        </tr>

                                        <!-- end of origin -->
                                        <!-- start of notification grid -->
                                        <tr>
                                            <td><br></td>
                                        </tr>

                                        <tr>
                                            <td colspan="3">
                                                <table border="0" width="100%">
                                                    <tr>
                                                        <td style="color: #D14514" width="49%">
                                                            <b>Financial&nbsp;Information</b>
                                                        </td>
                                                        <td style="color: #D14514" width="27%" >
                                                            <b>Customer&nbsp;Truck&nbsp;Information</b>  
                                                        </td>
                                                        <td style="color: #D14514">
                                                            <b>Truck&nbsp;Identification</b> 
                                                        </td>
                                                    </tr>
                                                </table>

                                            </td>

                                        </tr>




                                        <tr>
                                            <td colspan="4">
                                                <table border="0" width="100%" cellspacing="6">
                                                    <tr>
                                                        <td width="35%" class=" ">
                                                            <table style=" border: 2px solid  #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;">
                                                                <tr>
                                                                <tr>
                                                                    <td class="inputstyle110" >Gate&nbsp;Arrival</td>
                                                                    <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="FinancialInformationGateArrival" id="FinancialInformationGateArrival" maxLength="5"  Class="inputSelectSmall" onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="81"/>
                                                                        <!--                                                                      <a href="#" title="Please Click on Text box">
                                                                                                                                                  <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                        <s:textfield style="width:30px" label=" " name="FinancialInformationGateArrival1" id="FinancialInformationGateArrival1" placeholder="hh" tabindex="82"/>   :  <s:textfield style="width:30px"  name="FinancialInformationGateArrival2" id="FinancialInformationGateArrival2" placeholder="mm" tabindex="83"/> ET
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="inputstyle110" >Gate&nbsp;Admitted</td>
                                                                    <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="FinancialInformationGateAdmitted" id="FinancialInformationGateAdmitted" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="84"/>
                                                                        <!--                                                                       <a href="#" title="Please Click on Text box">
                                                                                                                                                    <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                        <s:textfield style="width:30px" id="FinancialInformationGateAdmitted1" name="FinancialInformationGateAdmitted1" placeholder="hh" tabindex="85"/>   :  <s:textfield style="width:30px" id="FinancialInformationGateAdmitted2" name="FinancialInformationGateAdmitted2" placeholder="mm" tabindex="86"/> ET
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="inputstyle110" >Loaded</td>
                                                                    <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="FinancialInformationLoaded" id="FinancialInformationLoaded" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="87"/>
                                                                        <!--                                                                       <a href="#" title="Please Click on Text box">
                                                                                                                                                    <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                        <s:textfield style="width:30px" id="FinancialInformationLoaded1" name="FinancialInformationLoaded1" placeholder="hh" tabindex="88"/>   :  <s:textfield style="width:30px" id="FinancialInformationLoaded2" name="FinancialInformationLoaded2" placeholder="mm" tabindex="89"/> ET
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td class="inputstyle110" >Actual&nbsp;PU</td>
                                                                    <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="FinancialInformationActualPU" id="FinancialInformationActualPU" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="90"/>
                                                                        <!--                                                                       <a href="#" title="Please Click on Text box">
                                                                                                                                                    <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                        <s:textfield style="width:30px" id="FinancialInformationActualPU1" name="FinancialInformationActualPU1" placeholder="hh" tabindex="91"/>   :  <s:textfield style="width:30px" id="FinancialInformationActualPU2" name="FinancialInformationActualPU2" placeholder="mm" tabindex="92"/> ET
                                                                    </td>
                                                                </tr> 
                                                                <tr>
                                                                    <td>
                                                                        <label for="Commodity Desc" >Destination&nbsp;Gate&nbsp;Arrival</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="s_FinancialInformationDestinationGateArrival" id="s_FinancialInformationDestinationGateArrival" tabindex="93"/>
                                                                        <%--<s:hidden cssClass="inputstyle130" name="h_FinancialInformationDestinationGateArrival" id="h_FinancialInformationDestinationGateArrival" tabindex="93"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Commodity Desc" >Destination&nbsp;Gate&nbsp;Admitted</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="s_FinancialInformationDestinationGateAdmitted" id="s_FinancialInformationDestinationGateAdmitted" tabindex="94"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_FinancialInformationDestinationGateAdmitted" id="h_FinancialInformationDestinationGateAdmitted" tabindex="94"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="inputstyle110" >Actual&nbsp;Delivery</td>
                                                                    <td colspan="3"><s:textfield cssClass="inputstyle130" placeholder="MM/dd/YYYY"  name="FinancialInformationActualDelivery" id="FinancialInformationActualDelivery" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="95"/>
                                                                        <!--                                                                       <a href="#" title="Please Click on Text box">
                                                                                                                                                    <img src="./../includes/images/calci1.png" width="20" height="20" border="0" class="cal_pic"/></a>-->
                                                                        <s:textfield style="width:30px" id="FinancialInformationActualDelivery1" name="FinancialInformationActualDelivery1" placeholder="hh" tabindex="96"/>   :  <s:textfield style="width:30px" id="FinancialInformationActualDelivery2" name="FinancialInformationActualDelivery2" placeholder="mm" tabindex="97"/> ET
                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td class="inputstyle110" >Freight&nbsp;Bill&nbsp;Received</td>
                                                                    <td colspan="3">
                                                                        <s:textfield placeholder="MM/dd/YYYY" cssClass="inputstyle130" name="FinancialInformationFreightBillRecieved" id="FinancialInformationFreightBillRecieved" maxLength="5"   onchange="timeValidator(this);" onkeyup="enterdTime(this);" tabindex="98"/>
                                                                        <!--                                                                        <a href="#" title="Please Click on Text box">
                                                                                                                                                    <img src="./../includes/images/calci1.png" width="20" height="20" border="0" style="margin-bottom: -5px;"></a>-->

                                                                    </td>  
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Freight Bill Amount" >Freight&nbsp;Bill&nbsp;Amount</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_FinancialInformationFreightBillAmount" value="%{logisticsLoadTenderingXml.s_FinancialInformationFreightBillAmount}" id="s_FinancialInformationFreightBillAmount" tabindex="99" />
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_FinancialInformationFreightBillAmount" id="h_FinancialInformationFreightBillAmount" tabindex="99" />--%>
                                                                    </td> 
                                                                </tr>
                                                                <tr>
                                                                    <td><label for="SCAC" >SCAC</label></td>
                                                                    <td>
                                                                        <s:textfield name="logisticsLoadTenderingXml.FinancialInformationSCAC" value="%{logisticsLoadTenderingXml.FinancialInformationSCAC}" id="FinancialInformationSCAC"  cssClass="selectStyle130" tabindex="100"/>
                                                                    </td> 
                                                                </tr>
                                                                <tr>
                                                                    <td><label for="Dedicated Program" >Dedicated&nbsp;Program</label></td>
                                                                    <td>
                                                                        <s:textfield  cssClass="selectStyle130" name="logisticsLoadTenderingXml.FinancialInformationDedicatedProgram" value="%{logisticsLoadTenderingXml.FinancialInformationDedicatedProgram}" id="FinancialInformationDedicatedProgram"   tabindex="101" />
                                                                    </td> 
                                                                </tr>
                                                                <tr>
                                                                    <td><label for="Dedicated Unit" >Dedicated&nbsp;Unit</label></td>
                                                                    <td>
                                                                        <s:textfield name="logisticsLoadTenderingXml.FinancialInformationDedicatedUnit" value="%{logisticsLoadTenderingXml.FinancialInformationDedicatedUnit}" id="FinancialInformationDedicatedUnit" cssClass="selectStyle130" tabindex="102"/>
                                                                    </td> 
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Shipper Rate" >Shipper&nbsp;Rate</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_FinancialInformationShipperRate" value="%{logisticsLoadTenderingXml.s_FinancialInformationShipperRate}" id="s_FinancialInformationShipperRate" tabindex="103"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_FinancialInformationShipperRate" id="h_FinancialInformationShipperRate" tabindex="103"/>--%>
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield name="FinancialInformationShipperRate1" id="FinancialInformationShipperRate1"  Class="inputstyle80" tabindex="104"/>
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield Class="inputstyle80"  name="s_FinancialInformationShipperRate2" id="s_FinancialInformationShipperRate2" tabindex="105"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_FinancialInformationShipperRate2" id="h_FinancialInformationShipperRate2" tabindex="105"/>--%>
                                                                    </td>
                                                                    <td>minimum</td>

                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Carrier Rate" >Carrier&nbsp;Rate</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="s_FinancialInformationCarrierRate" id="s_FinancialInformationCarrierRate" tabindex="106"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_FinancialInformationCarrierRate" id="h_FinancialInformationCarrierRate" tabindex="106"/>--%>
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield name="FinancialInformationCarrierRate1" id="FinancialInformationCarrierRate1" cssClass="inputstyle80" tabindex="107"/>
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle80"  name="FinancialInformationCarrierRate2" id="FinancialInformationCarrierRate2" tabindex="108"/>
                                                                    </td>
                                                                    <td>minimum</td>

                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Benchmark Rate">Benchmark&nbsp;Rate</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="s_FinancialInformationBenchmarkRate" id="s_FinancialInformationBenchmarkRate" tabindex="109"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_FinancialInformationBenchmarkRate" id="h_FinancialInformationBenchmarkRate" tabindex="109"/>--%>
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield name="FinancialInformationBenchmarkRate1" id="FinancialInformationBenchmarkRate1"  cssClass="inputstyle80" tabindex="110"/>
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle80"  name="FinancialInformationBenchmarkRate2" id="FinancialInformationBenchmarkRate2" tabindex="111"/>
                                                                    </td>
                                                                    <td>minimum</td>
                                                                </tr>


                                                            </table>
                                                        </td>
                                                        <td width="25%"  style="border: 2px solid #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;" class=" ">
                                                            <table style= "margin-bottom:192px">
                                                                <tr>
                                                                    <td>
                                                                        <label for="Customer Truck" >Customer&nbsp;Truck</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:checkbox  fieldValue="true" name="CustomerTruckInformationCustomerTruck" id="CustomerTruckInformationCustomerTruck" tabindex="112"/>

                                                                    </td> 
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Customer Truck Name" >Customer&nbsp;Truck&nbsp;Name</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130" id="s_CustomerTruckInformationCustomerTruckName" name="s_CustomerTruckInformationCustomerTruckName" tabindex="113"/>
                                                                        <%--<s:hidden cssClass="inputstyle130" id="h_CustomerTruckInformationCustomerTruckName" name="h_CustomerTruckInformationCustomerTruckName" tabindex="113"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td><label for="Customer Truck SCAC" >Customer&nbsp;Truck&nbsp;SCAC</label></td>
                                                                    <td>
                                                                        <s:textfield name="CustomerTruckInformationCustomerTruckSCAC" id="CustomerTruckInformationCustomerTruckSCAC"  cssClass="selectStyle130" tabindex="114"/>
                                                                    </td>

                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Customer Truck Person" >Customer&nbsp;Truck&nbsp;Person</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="s_CustomerTruckInformationCustomerTruckPerson" id="s_CustomerTruckInformationCustomerTruckPerson" tabindex="115"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_CustomerTruckInformationCustomerTruckPerson" id="h_CustomerTruckInformationCustomerTruckPerson" tabindex="115"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Customer Truck Phone" >Customer&nbsp;Truck&nbsp;Phone</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="s_CustomerTruckInformationCustomerTruckPhone" id="s_CustomerTruckInformationCustomerTruckPhone" tabindex="116" onkeyup="IsNumeric3(this);" />
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_CustomerTruckInformationCustomerTruckPhone" id="h_CustomerTruckInformationCustomerTruckPhone" tabindex="116"/>--%>
                                                                    </td>
                                                                </tr>

                                                            </table> 
                                                        </td>

                                                        <td width="25%" style="border: 2px solid #D14514;border-radius: 7px 7px 7px 7px; -moz-border-radius: 7px 7px 7px 7px;  -webkit-border: 7px 7px 7px 7px;" class=" ">
                                                            <table style="margin-bottom:182px">
                                                                <tr>
                                                                    <td>
                                                                        <label for="Unit&nbsp;Number" >Unit&nbsp;Number</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130" id="s_TruckIdentificationUnitNumber" name="logisticsLoadTenderingXml.s_TruckIdentificationUnitNumber" value="%{logisticsLoadTenderingXml.s_TruckIdentificationUnitNumber}" tabindex="117"/>
                                                                        <%--<s:hidden cssClass="inputstyle130" id="h_TruckIdentificationUnitNumber" name="h_TruckIdentificationUnitNumber" tabindex="117"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Customer&nbsp;Truck&nbsp;Phone" >Tractor&nbsp;Id</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130" id="s_TruckIdentificationTractorId" name="s_TruckIdentificationTractorId" tabindex="118"/>
                                                                        <%--<s:hidden cssClass="inputstyle130" id="h_TruckIdentificationTractorId" name="h_TruckIdentificationTractorId" tabindex="118"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Driver Name" >Driver&nbsp;Name</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130" id="s_TruckIdentificationDriverName" name="logisticsLoadTenderingXml.s_TruckIdentificationDriverName" value="%{logisticsLoadTenderingXml.s_TruckIdentificationDriverName}" tabindex="119"/>
                                                                        <%--<s:hidden cssClass="inputstyle130" id="h_TruckIdentificationDriverName" name="h_TruckIdentificationDriverName" tabindex="119"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Driver Phone" >Driver&nbsp;Phone</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_TruckIdentificationDriverPhone" value="%{logisticsLoadTenderingXml.s_TruckIdentificationDriverPhone}" id="s_TruckIdentificationDriverPhone" tabindex="120" onkeyup="IsNumeric3(this);"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_TruckIdentificationDriverPhone" id="h_TruckIdentificationDriverPhone" tabindex="120"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="License Number" >License&nbsp;Number</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130"  name="logisticsLoadTenderingXml.s_TruckIdentificationLicenseNumber" value="%{logisticsLoadTenderingXml.s_TruckIdentificationLicenseNumber}" id="s_TruckIdentificationDriverPhone" tabindex="121"/>
                                                                        <%--<s:hidden cssClass="inputstyle130"  name="h_TruckIdentificationLicenseNumber" id="h_TruckIdentificationDriverPhone" tabindex="121"/>--%>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <label for="Trailer Number" >Trailer&nbsp;Number</label> 
                                                                    </td>
                                                                    <td>
                                                                        <s:textfield cssClass="inputstyle130" id="logisticsLoadTenderingXml.s_TruckIdentificationTrailerNumber" name="logisticsLoadTenderingXml.s_TruckIdentificationTrailerNumber" tabindex="122"/>
                                                                        <%--<s:hidden cssClass="inputstyle130" id="h_TruckIdentificationTrailerNumber" name="h_TruckIdentificationTrailerNumber" tabindex="122"/>--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>

                                            </td>

                                        </tr>
                                        <!-- end of customer financial,truck -->
                                        <%-- <tr>
                                           <td>
                                               <br>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td>
                                               <b>Copy&nbsp;Load</b><br><br>
                                           </td>
                                       </tr> 
                                       <tr class="div_grayColorbg">
                                           <td>
                                               Copy&nbsp;this&nbsp;Load
                                               <s:select headerKey="-1" headerValue="1" list="{'1', '2', '3', '4','5','6'}" name="authrized" id="authrized" tabindex="43" cssClass="selectStyle150"/><label for="times">time(s)</label>
                                               <span style="float:right;">
                                                   <a href="javascript:copyLoadtoggleOverlay();">
                                                       <img src="<s:url value="./includes/images/addicon.png"/>" width="15" height="15" width="15" height="15" style="float:right; margin: 0px 835px   0px 0px;" /></a>

                                        </span>
                                        <br><br>
                                    </td>
                                  
                                </tr>
                                <tr class="div_grayColorbg">
                                    <td>
                                        <div class="content" id="gridDiv">

                                            <table align="left" width="710px" border="0" cellpadding="0" cellspacing="0"> 
                                                <tr>
                                                    <td style="background-color: white;">
                                                        <table align="left" id="results" width="590px"
                                                               border="0" cellpadding="0" cellspacing="0" class="CSSTableGenerator">
                                                            <tr>
                                                                <td>Shipment&nbsp;Number </td>
                                                                <td>Weight</td>
                                                                <td>Remove&nbsp;Copy</td>

                                                            </tr> 

                                                        </table>
                                                    </td>   
                                                </tr>

                                            </table>  
                                        </div>

                                    </td>
                                </tr>            
                                <tr>

                                    <td >
                                        <!--                                        <div style="float: right;margin-right: -389%;margin-top: 2%;">-->
                                        <s:submit value="Save" cssClass="button" tabindex="8"/> 
                                        <strong><input type="button" value="Save&Optimise" class="button" onclick="" tabindex="9"/></strong>


                                        <!--                                        </div>-->
                                    </td>

                                </tr>   --%>

                                        <tr>

                                            <td >
                                                <s:hidden name="docdatepicker" value="%{docdatepicker}"/>
                                                <s:hidden name="docSenderId" value="%{docSenderId}"/>
                                                <s:hidden name="docSenderName" value="%{docSenderName}"/>
                                                <s:hidden name="docRecName" value="%{docRecName}"/>
                                                <s:hidden name="corrattribute" value="%{corrattribute}"/>
                                                <s:hidden name="corrvalue" value="%{corrvalue}"/>
                                                <s:hidden name="corrattribute1" value="%{corrattribute1}"/>
                                                <s:hidden name="corrvalue1" value="%{corrvalue1}"/>
                                                <s:hidden name="corrattribute2" value="%{corrattribute2}"/>
                                                <s:hidden name="corrvalue2" value="%{corrvalue2}"/>
                                                <s:hidden name="docType" value="%{docType}"/>
                                                <s:hidden name="corrDirValue" value="%{corrDirValue}"/>
                                                <s:hidden name="corrDirValue1" value="%{corrDirValue1}"/>
                                                <s:hidden name="corrDirValue2" value="%{corrDirValue2}"/>
                                                <s:hidden name="status" value="%{status}"/>
                                                <s:hidden name="docBusId1" value="%{docBusId1}"/>  
                                                <s:hidden name="button" value="%{button}"/>  
                                                <s:hidden name="startForNav" value="%{startForNav}"/>  
                                                <s:hidden name="endForNav" value="%{endForNav}"/>  
                                                <input type="button" value="Save" class="button" tabindex="8" onclick="saveSubmitToggleOverlay('save');"/> 
                                                <strong><input type="button" value="Submit" class="button" onclick="saveSubmitToggleOverlay('submit');" tabindex="9" /></strong>
                                                <strong><a style="text-decoration: none" href="<s:url action="../logisticsloadtendering/nextLoadtendering.action">
                                                               <s:param name="startValue" value="%{startForNav}"/>
                                                               <s:param name="endValue" value="%{endForNav}"/>
                                                               <s:param name="button" value="%{button}"/>
                                                               <s:param name="docdatepickerfrom" value="%{docdatepickerfrom}"/>
                                                               <s:param name="docdatepicker" value="%{docdatepicker}"/>
                                                               <s:param name="docSenderId" value="%{docSenderId}"/>
                                                               <s:param name="docSenderName" value="%{docSenderName}"/>
                                                               <s:param name="docBusId" value="%{docBusId1}"/>
                                                               <s:param name="docRecName" value="%{docRecName}"/>
                                                               <s:param name="corrattribute" value="%{corrattribute}"/>
                                                               <s:param name="corrvalue" value="%{corrvalue}"/>
                                                               <s:param name="corrattribute1" value="%{corrattribute1}"/>
                                                               <s:param name="corrvalue1" value="%{corrvalue1}"/>
                                                               <s:param name="corrattribute2" value="%{corrattribute2}"/>
                                                               <s:param name="corrvalue2" value="%{corrvalue2}"/>
                                                               <s:param name="docType" value="%{docType}"/>
                                                               <s:param name="status" value="%{status}"/>
                                                               <s:param name="corrDirValue" value="%{corrDirValue}"/>
                                                               <s:param name="corrDirValue1" value="%{corrDirValue1}"/>
                                                               <s:param name="corrDirValue2" value="%{corrDirValue2}"/>
                                                           </s:url>" ><input type="button" value="Cancel" class="button"  tabindex="9"/></a></strong>



                                                <!--                                        </div>-->
                                            </td>

                                        </tr> 
                                        </table> 
                                    </s:form>

                                    <script type="text/javaScript">
                                        var cal1 = new CalendarTime(document.forms['plsForm1'].elements['OriginpnetDate']);
                                        cal1.year_scroll = true;
                                        cal1.time_comp = false;
                                
                                        var cal2 = new CalendarTime(document.forms['plsForm1'].elements['logisticsLoadTenderingXml.OriginplntDate']);
                                        cal2.year_scroll = true;
                                        cal2.time_comp = false;
                                
                                        var cal3 = new CalendarTime(document.forms['plsForm1'].elements['logisticsLoadTenderingXml.DestinationpnetDate']);
                                        cal3.year_scroll = true;
                                        cal3.time_comp = false;
                                
                                        var cal4 = new CalendarTime(document.forms['plsForm1'].elements['logisticsLoadTenderingXml.DestinationplntDate']);
                                        cal4.year_scroll = true;
                                        cal4.time_comp = false;
                              
                                        var cal5 = new CalendarTime(document.forms['plsForm1'].elements['FinancialInformationGateArrival']);
                                        cal5.year_scroll = true;
                                        cal5.time_comp = false;
                                
                                        var cal6 = new CalendarTime(document.forms['plsForm1'].elements['FinancialInformationGateAdmitted']);
                                        cal6.year_scroll = true;
                                        cal6.time_comp = false;
                                
                                        var cal7 = new CalendarTime(document.forms['plsForm1'].elements['FinancialInformationLoaded']);
                                        cal7.year_scroll = true;
                                        cal7.time_comp = false;
                                
                                        var cal8 = new CalendarTime(document.forms['plsForm1'].elements['FinancialInformationActualPU']);
                                        cal8.year_scroll = true;
                                        cal8.time_comp = false;
                                
                                        var cal9 = new CalendarTime(document.forms['plsForm1'].elements['FinancialInformationActualDelivery']);
                                        cal9.year_scroll = true;
                                        cal9.time_comp = false;
                                
                                        var cal10 = new CalendarTime(document.forms['plsForm1'].elements['FinancialInformationFreightBillRecieved']);
                                        cal10.year_scroll = true;
                                        cal10.time_comp = false;
                                    </script>
                                </div>
                                <!-- end of the conetnt -->


                            </div>
                        </div>



                        <div id="sec_box" style="display: none;"> 
                            <div class="content">
                                <div class="content_item">


                                    <div class="CSSTableGenerator" >


                                        <table >
                                            <tr align="center">
                                                <td >ISA #</td>
                                                <td >Document Type</td>
                                                <td >File Format</td>
                                                <td>Direction</td>
                                                <td>Date</td>
                                                <td>Status</td>
                                            </tr>
                                            <tr align="center">
                                                <td><a href="#" id="detail_link" >1001</a></td>
                                                <td>850</td>
                                                <td>EDI</td>
                                                <td>Inbound</a></td>
                                                <td>Feb 27 2013</td>
                                                <td>Shipped</td>
                                            </tr>
                                            <tr align="center">
                                                <td><a href="#" id="detail_link" >1001</a></td>
                                                <td>850</td>
                                                <td>EDI</td>
                                                <td>Inbound</a></td>
                                                <td>Feb 27 2013</td>
                                                <td>Shipped</td>
                                            </tr>

                                            <tr align="center">
                                                <td><a href="#" id="detail_link" >1001</a></td>
                                                <td>850</td>
                                                <td>EDI</td>
                                                <td>Inbound</a></td>
                                                <td>Feb 27 2013</td>
                                                <td>Shipped</td>
                                            </tr>
                                            <tr align="center">
                                                <td><a href="#" id="detail_link" >1001</a></td>
                                                <td>850</td>
                                                <td>EDI</td>
                                                <td>Inbound</a></td>
                                                <td>Feb 27 2013</td>
                                                <td>Shipped</td>
                                            </tr>
                                            <tr align="center">
                                                <td><a href="#" id="detail_link" >1001</a></td>
                                                <td>850</td>
                                                <td>EDI</td>
                                                <td>Inbound</a></td>
                                                <td>Feb 27 2013</td>
                                                <td>Shipped</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer>

                <p>&#169 2016 PLS LOGISTICS SERVICES</p>
            </footer>
        </div>
    </body>
</html>