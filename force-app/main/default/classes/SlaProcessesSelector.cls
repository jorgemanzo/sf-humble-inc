public without sharing class SlaProcessesSelector extends fflib_SObjectSelector{

    public Schema.SObjectType getSObjectType() {
        return SlaProcess.getSObjectType();
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            SlaProcess.BusinessHoursId,
            SlaProcess.Description,
            SlaProcess.IsActive,
            SlaProcess.Id,
            SlaProcess.LastViewedDate,
            SlaProcess.Name,
            SlaProcess.NameNorm,
            SlaProcess.SObjectType,
            SlaProcess.StartDateField
        };
    }

    public List<SlaProcess> selectById(Set<Id> setIds) {
        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :setIds')
            .toSOQL()
        );
    }

    public List<SlaProcess> selectByNameVersionDefault(String processName) {
        return Database.query(
            newQueryFactory()
                .setCondition('Name = :processName')
                .setCondition('IsVersionDefault = true')
            .toSOQL()
        );
    }
}