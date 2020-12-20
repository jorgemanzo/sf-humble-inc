public with sharing class StandardEntitlement {

    public static final String STANDARD_SUPPORT_ENTITLEMENT_NAME = 'Standard Support';

    public class StandardEntitlementException extends Exception {}

    public Case SupportCase;

    public StandardEntitlement(Case c) {
        if(c.AccountId == null) {
            throw new StandardEntitlementException('Cannot create entitlement for a Case without an Account.');
        }
        this.SupportCase = c;
    }

    public Entitlement createEntitlement() {
        return new Entitlement(
            Name = STANDARD_SUPPORT_ENTITLEMENT_NAME,
            AccountId = SupportCase.AccountId
        );
    }
}