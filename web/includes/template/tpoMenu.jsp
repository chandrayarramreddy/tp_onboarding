<%-- 
    Document   : tpoMenu
    Created on : Dec 14, 2016, 5:32:51 AM
    Author     : MSCVP Team
--%>

<%@page import="com.mss.ediscv.util.AppConstants"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<li id="tpoHome"><a href="<s:url action=""/>">Home</a></li>
<li id="partnerInfo"><a href="<s:url action="../tpOnboarding/tpoPartnerInfo"/>">Existing Partner</a></li>
<%--<li id="partnerInfo"><a href="#">Partner Info<span class="sf-arrow"></span></a>
    <ul >
        <li id="oldPartner" class="notselected"><a href="<s:url action="../tpOnboarding/tpoPartnerInfo"/>">Existing Partner</a></li>
    
        <li id="newPartner" class="notselected"><a href="<s:url action="../tpOnboarding/tpoPartnerInfo"/>">Add Partner</a></li>
    </ul>
</li>--%>

<li id="profile"><a href="#">Profile<span class="sf-arrow"></span></a>
    <ul >
        <li id="oldProfile" class="notselected"><a href="<s:url action="../tpOnboarding/tpoProfile"/>">Existing Profile</a></li>
    
        <li id="newProfile" class="notselected"><a href="<s:url action="../tpOnboarding/tpoAddProfile"/>">Add Profile</a></li>
    </ul>
</li>

<li id="Envelopes"><a href="#">Envelopes<span class="sf-arrow"></span></a>
    <ul >
        <li id="oldEnvelopes" class="notselected"><a href="<s:url action="../tpOnboarding/tpoEnvelopes"/>">Existing Envelopes</a></li>

        <li id="newEnvelopes" class="notselected"><a href="<s:url action="../tpOnboarding/tpoEnvelopes"/>">Add Envelopes</a></li>
    </ul>
</li>
