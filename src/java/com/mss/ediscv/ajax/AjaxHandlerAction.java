/*
 * AjaxHandlerAction.java
 *
 * Created on June 11, 2008, 12:22 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mss.ediscv.ajax;

import com.mss.ediscv.util.AppConstants;
import com.mss.ediscv.util.ServiceLocator;
import com.opensymphony.xwork2.ActionSupport;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

/**
 *
 * @author miracle
 */
public class AjaxHandlerAction extends ActionSupport implements ServletRequestAware, ServletResponseAware {

    /**
     * Creating a reference variable for HttpServletRequest.
     */
    private HttpServletRequest httpServletRequest;
    /**
     * Creating a reference variable for HttpServletResponse.
     */
    private HttpServletResponse httpServletResponse;
    private int id;
    private String responseString;
    // Dash board fields
    private String startDate;
    private String name;
    private String endDate;
    private String senderId;
    private String receiverId;
    private String docType;
    private String ackStatus;
    private String status;
    private String direction;
    private String transferMode;
    private String protocol;
    private String partnerName;
    private String email;
    
    private String addpartnerName;
    private String addphoneNo;
    private String addaddress1;
    private String addcity;
    private String addstate;
    private String addcountry;
    private String addzipCode;

    public AjaxHandlerAction() {
    }



    public String getProtocolDetails() {
        if (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString() != null) {
            try {
                responseString = ServiceLocator.getAjaxHandlerService().getProtocolDetails(getTransferMode(), getProtocol(), getPartnerName());
                httpServletResponse.setContentType("text");
                httpServletResponse.getWriter().write(responseString);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public String isExistedPartnerName() {
        if (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString() != null) {
            try {
                responseString = ServiceLocator.getAjaxHandlerService().isExistedPartnerName(getName());
                httpServletResponse.setContentType("text/xml");
                httpServletResponse.getWriter().write(responseString);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public String isExistedUserEmail() {
        if (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString() != null) {
            try {
                responseString = ServiceLocator.getAjaxHandlerService().isExistedUserEmail(getEmail());
                httpServletResponse.setContentType("text/xml");
                httpServletResponse.getWriter().write(responseString);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public String isExistedAS2PartnerProfileName() {
        if (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString() != null) {
            try {
                responseString = ServiceLocator.getAjaxHandlerService().isExistedAS2PartnerProfileName(getName(),getPartnerName());
                httpServletResponse.setContentType("text/xml");
                httpServletResponse.getWriter().write(responseString);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }
    
    public String addPartner() {
        String loginId = (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString());
        if (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString() != null) {
            try {
                responseString = ServiceLocator.getAjaxHandlerService().doAddTpoPartner(this,loginId);
                httpServletResponse.setContentType("text/xml");
                httpServletResponse.getWriter().write(responseString);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

        public String getDeleteProfile() {
          if (httpServletRequest.getSession(false).getAttribute(AppConstants.TPO_LOGIN_ID).toString() != null) {
            try {
                //System.out.println("in actionnnnnn");
                 responseString = ServiceLocator.getAjaxHandlerService().getDeleteProfile(getId());              
                 System.err.println("responseStringAction--->"+responseString);
                httpServletResponse.setContentType("text/xml");
                httpServletResponse.getWriter().write(responseString);
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        return null;
    }  
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * This method is used to set the Servlet Request
     * @param httpServletRequest
     */
    public void setServletRequest(HttpServletRequest httpServletRequest) {
        this.httpServletRequest = httpServletRequest;
    }

    /**
     *
     * This method is used to set the Servlet Response
     * @param httpServletResponse
     */
    public void setServletResponse(HttpServletResponse httpServletResponse) {
        this.httpServletResponse = httpServletResponse;
    }

    /**
     * @return the poNumber
     */
  

    /**
     * @return the startDate
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the senderId
     */
    public String getSenderId() {
        return senderId;
    }

    /**
     * @param senderId the senderId to set
     */
    public void setSenderId(String senderId) {
        this.senderId = senderId;
    }

    /**
     * @return the receiverId
     */
    public String getReceiverId() {
        return receiverId;
    }

    /**
     * @param receiverId the receiverId to set
     */
    public void setReceiverId(String receiverId) {
        this.receiverId = receiverId;
    }

    /**
     * @return the docType
     */
    public String getDocType() {
        return docType;
    }

    /**
     * @param docType the docType to set
     */
    public void setDocType(String docType) {
        this.docType = docType;
    }

    /**
     * @return the ackStatus
     */
    public String getAckStatus() {
        return ackStatus;
    }

    /**
     * @param ackStatus the ackStatus to set
     */
    public void setAckStatus(String ackStatus) {
        this.ackStatus = ackStatus;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the direction
     */
    public String getDirection() {
        return direction;
    }

    /**
     * @param direction the direction to set
     */
    public void setDirection(String direction) {
        this.direction = direction;
    }



    public String getProtocol() {
        return protocol;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getTransferMode() {
        return transferMode;
    }

    public void setTransferMode(String transferMode) {
        this.transferMode = transferMode;
    }

    public String getPartnerName() {
        return partnerName;
    }

    public void setPartnerName(String partnerName) {
        this.partnerName = partnerName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddaddress1() {
        return addaddress1;
    }

    public void setAddaddress1(String addaddress1) {
        this.addaddress1 = addaddress1;
    }

    public String getAddcity() {
        return addcity;
    }

    public void setAddcity(String addcity) {
        this.addcity = addcity;
    }

    public String getAddcountry() {
        return addcountry;
    }

    public void setAddcountry(String addcountry) {
        this.addcountry = addcountry;
    }

    public String getAddpartnerName() {
        return addpartnerName;
    }

    public void setAddpartnerName(String addpartnerName) {
        this.addpartnerName = addpartnerName;
    }

    public String getAddphoneNo() {
        return addphoneNo;
    }

    public void setAddphoneNo(String addphoneNo) {
        this.addphoneNo = addphoneNo;
    }

    public String getAddstate() {
        return addstate;
    }

    public void setAddstate(String addstate) {
        this.addstate = addstate;
    }

    public String getAddzipCode() {
        return addzipCode;
    }

    public void setAddzipCode(String addzipCode) {
        this.addzipCode = addzipCode;
    }
    
}
