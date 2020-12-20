public without sharing class EntitlementsSelector extends fflib_SObjectSelector{
    public Schema.SObjectType getSObjectType() {
        return Entitlement.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Entitlement.AccountId,
            Entitlement.Id
        };
    }

    public List<Entitlement> selectByAccountIds(Set<Id> setIds) {
        return Database.query(
            newQueryFactory()
                .setCondition('AccountId IN :setIds')
            .toSOQL()
        );
    }
}