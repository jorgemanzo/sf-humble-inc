public without sharing class CasesSelector extends fflib_SObjectSelector{
    public Schema.SObjectType getSObjectType() {
        return Case.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Case.AccountId,
            Case.ContactId,
            Case.EntitlementId,
            Case.EntitlementId,
            Case.Id,
            Case.OwnerId,
            Case.SlaStartDate,
            Case.SlaExitDate,
            Case.Status,
            Case.SuppliedEmail
        };
    }

    public List<Case> selectById(Set<Id> setIds) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :setIds')
            .toSOQL()
        );
    }

    public List<Case> selectByIdWithContact(Set<Id> setIds) {
        fflib_QueryFactory caseQueryFactory = newQueryFactory();

        new ContactsSelector().
            configureQueryFactoryFields(caseQueryFactory, 'Contact');

        return (List<Case>) Database.query(
            caseQueryFactory.setCondition('id IN :setIds').toSOQL()
        );
    }
}