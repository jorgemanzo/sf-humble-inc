public without sharing class CaseMilestonesSelector extends fflib_SObjectSelector{
    public Schema.SObjectType getSObjectType() {
        return CaseMilestone.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            CaseMilestone.Id,
            CaseMilestone.CaseId,
            CaseMilestone.completionDate,
            CaseMilestone.MilestoneTypeId
        };
    }

    public List<CaseMilestone> selectByCaseIdWithMilestoneTypeName(Set<Id> setIds, String milestoneName) {
        fflib_QueryFactory caseMilestoneQueryFactory = newQueryFactory();
        new MilestoneTypesSelector()
            .configureQueryFactoryFields(caseMilestoneQueryFactory, 'MilestoneType');
        return (List<CaseMIlestone>) Database.query(
            caseMilestoneQueryFactory.setCondition('CaseId IN :setIds').setCondition('MilestoneType.Name = :milestoneName').toSOQL()
        );
    }
}