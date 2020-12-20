public without sharing class CaseDefaultEntitlement {
    public static Account TechnicalSupportCasePlaceholderAccount;

    public static final String TECHNICAL_SUPPORT_CASE_PLACEHOLDER_ACCOUNT_NAME = 'Technical Support Case Placeholder';

    public class CaseDefaultEntitlementException extends Exception {}

    static {
        List<Account> queryResult = new AccountsSelector().selectByAccountName(
            CaseDefaultEntitlement.TECHNICAL_SUPPORT_CASE_PLACEHOLDER_ACCOUNT_NAME
        );

        if(queryResult.isEmpty()) {
            throw new CaseDefaultEntitlementException('Couldn\'t find the technical support default case account!');
        }

        TechnicalSupportCasePlaceholderAccount = queryResult[0];
    }

    /**
     * Apply the default support entitlement to new Cases (support tickets).
     * If a case doesn't have an account (i.e. a phone to support ticket),
     * it is attached to the placeholder account.
     * If a case doesn't have an entitlement yet, one is created for it.
     */
    public static void applyDefault(List<Case> newCases) {

        /**
         * Assign to a default account if not already.
         */
        Set<Id> acctIds = new Set<Id>();
        for(Case c : newCases) {
            if(c.AccountId == null) {
                c.AccountId = TechnicalSupportCasePlaceholderAccount.Id;
            }
            acctIds.add(c.AccountId);
        }

        /**
         * Find any existing entitlements on the case's account.
         * If found, apply the entitlement to the case.
         */
        List<Entitlement> entls = new EntitlementsSelector().selectByAccountIds(acctIds);
        if(entls.isEmpty()==false){
            for(Case c : newCases){
                if(c.EntitlementId == null){
                    for(Entitlement e : entls){
                        if(e.AccountId==c.AccountId){
                            c.EntitlementId = e.Id;
                            break;
                        }
                    } 
                }
            } 
        }

        /**
         * Any cases (and by extension accounts) without an entitlement at this point will have
         * a default one created.
         */
        List<Entitlement> entitlementsToCreate = new List<Entitlement>();
        for(Case c : newCases) {
            if(c.EntitlementId == null) {
                StandardEntitlement newEntitlement = new StandardEntitlement(c);

                entitlementsToCreate.add(newEntitlement.createEntitlement());
            }
        }

        insert entitlementsToCreate;
    }
}