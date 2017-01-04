/*
 * AjaxHandlerService.java
 *
 *  
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mss.ediscv.ajax;

import com.mss.ediscv.util.ServiceLocatorException;

/**
 *
 * @author miracle
 */
public interface AjaxHandlerService {

    /** Creates a new instance of AjaxHandlerService */
   

    public String getProtocolDetails(String transferMode, String protocol, String partnerName) throws ServiceLocatorException;

    public String isExistedPartnerName(String partnerName) throws ServiceLocatorException;

    public String isExistedUserEmail(String email) throws ServiceLocatorException;

    public String isExistedAS2PartnerProfileName(String name,String partnerName) throws ServiceLocatorException;
     public String doAddTpoPartner(AjaxHandlerAction ajaxHandlerAction,String loginId) throws ServiceLocatorException;
     public String getDeleteProfile(int id)throws ServiceLocatorException;
}
