<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href='<s:url value="/includes/css/bootstrap/build.css"/>' type="text/css"/>
<!-- Fixed navbar -->
<div class="navbar navbar-inverse" >
    <div class="container">
        <div class="navbar-header">
            <!-- Button for smallest screens -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="navbar-brand" href="index.html"><img src="http://www.miraclesoft.com/images/logo.png" alt="miraclesoft"></a>
        </div>
        <div class="navbar-collapse collapse">
            <div class="row">
                <ul class="nav navbar-nav pull-right">
                    <li><a href="#">WelcomeTPO</a></li>
                    <li><a href="#"><s:if test="#session.tpoLoginId != null">
                                <b><font color="white"><s:property value="#session.tpoLoginId" /></font></b>
                            </s:if>
                            <s:else>
                                <b><font color="white">Guest</font></b>
                            </s:else></a>
                    </li>
                    <li> <s:if test="#session.tpoLoginId != null">
                            <a class="btn" href="<s:url value="../general/tpoLogout"/>">Logout</a>  
                        </s:if>
                        <s:else>
                            <a class="btn" href="<s:url action="../general/login"/>">LogIn</a>
                        </s:else>
                    </li>
                </ul>
            </div>

            <s:if test="#session.tpoUserId == 1000">
                <ul class="nav navbar-nav pull-right menu_tab" style="border-style: solid solid none; border-color: rgb(255, 255, 255) rgb(255, 255, 255) -moz-use-text-color; -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: none; border-image: none; border-width: 4px 1px 0px; margin-right: 423px; border-radius: 2px;">
                    <li id="userAdd"><a href="<s:url action="tpoUserAdd"/>"><i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">User Creation</span></a></li>
                    <li id="partnerAdd"><a href="<s:url action="tpoPartnerAdd"/>"><i class="fa fa-briefcase" aria-hidden="true"></i>Add Partner</a></li>
                </ul>
            </s:if>
            <s:else>
                <ul class="nav navbar-nav pull-right menu_tab" style="border-style: solid solid none; border-color: rgb(255, 255, 255) rgb(255, 255, 255) -moz-use-text-color; -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: none; border-image: none; border-width: 4px 1px 0px; margin-right: 423px; border-radius: 2px;">
                    <li id="partnerInfo"><a href="<s:url action="tpoPartnerInfo"/>"><i class="fa fa-tasks" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Partner Info</span></a></li>
                    <li class="dropdown" id="profiles">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-user" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Profile</span><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li id="manageProfiles"><a href="<s:url action="tpoManageProfiles"/>">Manage/Edit</a></li>
                            <li id="addProfile"><a href="<s:url action="tpoAddProfile"/>">Add Profile</a></li>
                        </ul>
                    </li>
                    <li class="dropdown" id="envelops">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-envelope" aria-hidden="true"></i><span class="hidden-xs hidden-sm">Envelopes</span><b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li id="manageEnvelops"><a href="<s:url action="tpoManageEnvelops"/>">Manage/Edit</a></li>
                            <li id="addEnvelop"><a href="<s:url action="tpoAddEnvelop"/>">Add Envelops</a></li>
                        </ul>
                    </li>
                </ul>
            </s:else>


        </div><!--/.nav-collapse -->
    </div>
</div> 
<!-- /.navbar -->