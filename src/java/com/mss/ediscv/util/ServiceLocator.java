/*******************************************************************************
 *
 * Project : Miracle Supply Chain Visibility portal v2.0
 *
 * Package : com.mss.mscvp.utill
 *
 * Date    : Mar 12, 2013 1:36:56 PM
 *
 * Author  : Nagireddy seerapu <nseerapu@miraclesoft.com>
 *
 * File    : ServiceLocator.java
 *

 * *****************************************************************************
 */
package com.mss.ediscv.util;


import com.mss.ediscv.ajax.AjaxHandlerService;
import com.mss.ediscv.ajax.AjaxHandlerServiceImpl;
import com.mss.ediscv.general.GeneralService;
import com.mss.ediscv.general.GeneralServiceImpl;
import com.mss.ediscv.tpOnboarding.TpOnboardingService;
import com.mss.ediscv.tpOnboarding.TpOnboardingServiceImpl;
/*
 * This Class Creates instances of all classes.
 */
public class ServiceLocator {

	/** Creates a new instance of ServiceLocator */
	private ServiceLocator() {
	}

	public static GeneralService getGeneralService()
			throws ServiceLocatorException {
		GeneralService generalService = new GeneralServiceImpl();
		return generalService;
	}
          
          public static AjaxHandlerService getAjaxHandlerService() throws ServiceLocatorException{
         AjaxHandlerService ajaxHandlerService = new AjaxHandlerServiceImpl();
            return ajaxHandlerService;
    }  
           
 
                
                  public static TpOnboardingService getTpOnboardingService() throws ServiceLocatorException{
         TpOnboardingService tpOnboardingService =  new TpOnboardingServiceImpl();
            return tpOnboardingService;
    }
}
