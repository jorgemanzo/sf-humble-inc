public class AccountsSelector extends fflib_SObjectSelector {

    public Schema.SObjectType getSObjectType() {
        return Account.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Account.Name,
            Account.AccountNumber,
            Account.OwnerId,
            Account.Site,
            Account.Active__c,
            Account.BillingAddress,
            Account.CleanStatus,
            Account.CreatedById,
            Account.CustomerPriority__c,
            Account.DandbCompanyId,
            Account.DunsNumber,
            Account.Jigsaw,
            Account.Description,
            Account.NumberOfEmployees,
            Account.Fax,
            Account.Industry,
            Account.LastModifiedById,
            Account.NaicsCode,
            Account.NaicsDesc,
            Account.NumberofLocations__c,
            Account.Ownership,
            Account.ParentId,
            Account.Phone,
            Account.Rating,
            Account.ShippingAddress,
            Account.Sic,
            Account.SicDesc,
            Account.SLA__c,
            Account.SLAExpirationDate__c,
            Account.SLASerialNumber__c,
            Account.TickerSymbol,
            Account.Tradestyle,
            Account.Type,
            Account.UpsellOpportunity__c,
            Account.Website,
            Account.YearStarted,
            Account.Id
        };
    }

    public List<Account> selectById(Set<Id> setIds) {
        return (List<Account>) Database.query(
            newQueryFactory()
                .setCondition('Id IN :setIds')
            .toSOQL()
        );
    }

    public List<Account> selectByIdWithContacts(Set<Id> IdSet) {
        
        fflib_QueryFactory accountsQueryFactory = newQueryFactory();

        new ContactsSelector().addQueryFactorySubselect(accountsQueryFactory);

        return Database.query(
            accountsQueryFactory
                .setCondition('Id IN: IdSet')
            .toSOQL()
        );
    }

    public List<Account> selectByAccountName(String AccountName) {
        return (List<Account>) Database.query(
            newQueryFactory()
                .setCondition('Name = :AccountName')
            .toSOQL()
        );
    }
}