public with sharing class Accounts extends fflib_SObjectDomain {
    public final String DOMAIN_CLASSES_ROCK = 'Domain classes rock!';
    public Accounts(List<Account> sObjectList) {
        super(sObjectList);
    }

    public class Constructor implements fflib_SObjectDomain.IConstructable {
        public fflib_SObjectDomain construct(List<SObject> sObjectList) {
            return new Accounts(sObjectList);
        }
    }

    public override void onApplyDefaults() {
        for(Account acc : (List<Account>) Records) {
            acc.Description = DOMAIN_CLASSES_ROCK;
        }
    }

    public override void onBeforeUpdate(Map<Id,SObject> existingRecords) {
        // fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
        //     new List<SObjectTYpe>{
        //         Account.SObjectType
        //     }
        // );
        for(Account acc : (List<Account>) Records) {
            acc.AnnualRevenue = acc.Description.getLevenshteinDistance(DOMAIN_CLASSES_ROCK);
            // uow.registerDirty(acc);
        }
        // uow.commitWork();
    }
}