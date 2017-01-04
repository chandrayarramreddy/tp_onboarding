/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mss.ediscv.tpOnboarding;

import com.mss.ediscv.util.ServiceLocatorException;
import java.util.ArrayList;

/**
 *
 * @author raja
 */
public interface TpOnboardingService {

    public String addTpProfile(int partnerId, String PartnerName, TpOnboardingAction tpAction) throws ServiceLocatorException;

    public TpOnboardingBean getTpoDetails(String loginId) throws ServiceLocatorException;

    public String updateTPO(TpOnboardingAction tpAction) throws ServiceLocatorException;
//new

    public String tpoREGISTER(TpOnboardingAction tpAction) throws ServiceLocatorException;

    public TpOnboardingBean getPartnerInfo(int PartnerId, String loginId) throws ServiceLocatorException;

    public String updatePartnerInfo(TpOnboardingAction tpAction, String loginId, int partnerId) throws ServiceLocatorException;

    public ArrayList<TpOnboardingBean> tpoSearchProfile(int partnerId, TpOnboardingAction tpAction);

    public String tpoDeleteProfile(int communicationId);

    public TpOnboardingAction tpogetProfile(int Id, String commonprotocol);
}
