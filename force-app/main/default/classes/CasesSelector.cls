public without sharing class CasesSelector extends fflib_SObjectSelector{
    public Schema.SObjectType getSObjectType() {
        return Case.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Case.AccountId,
            Case.EntitlementId,
            Case.Id
        };
    }

    public List<Case> selectById(Set<Id> setIds) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :setIds')
            .toSOQL()
        );
    }
}