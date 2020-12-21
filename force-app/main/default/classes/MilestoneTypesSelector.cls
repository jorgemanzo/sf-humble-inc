public with sharing class MilestoneTypesSelector extends fflib_SObjectSelector{
    public Schema.SObjectType getSObjectType() {
        return MilestoneType.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            MilestoneType.Description,
            MilestoneType.Id,
            MilestoneType.Name,
            MIlestoneType.RecurrenceType
        };
    }

    public List<MilestoneType> selectById(Set<Id> setIds) {
		return (List<MilestoneType>) selectSObjectsById(setIds);
    }
}