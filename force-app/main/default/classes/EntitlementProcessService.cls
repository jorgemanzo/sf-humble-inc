public with sharing class EntitlementProcessService {

    public static final String STANDARD_SUPPORT_ENTITLEMENT_PROCESS_NAME    = 'Standard Support';
    public static final String LONG_TERM_SUPPORT_ENTITLEMENT_PROCESS_NAME   = 'Long Term Support';

    public class EntitlementProcessServiceException extends Exception {}

    public static void applyStandardSupportEntitlementProcess(List<Entitlement> entitlements) {
        List<SlaProcess> queryResults = new SlaProcessesSelector().selectByNameVersionDefault(EntitlementProcessService.STANDARD_SUPPORT_ENTITLEMENT_PROCESS_NAME);
        if(queryResults.isEmpty()) {
            throw new EntitlementProcessServiceException('Cannot find the Standard Support SLA Process.');
        }

        for(Entitlement entl : entitlements) {
            entl.SlaProcessId = queryResults[0].Id;
        }
    }
}