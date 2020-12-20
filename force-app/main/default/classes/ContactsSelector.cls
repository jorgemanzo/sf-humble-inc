public without sharing class ContactsSelector extends fflib_SObjectSelector {
    public Schema.SObjectType getSObjectType() {
        return Contact.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Contact.AccountId,
            Contact.AssistantName,
            Contact.AssistantPhone,
            Contact.Birthdate,
            Contact.CleanStatus,
            Contact.OwnerId,
            Contact.CreatedById,
            Contact.Jigsaw,
            Contact.Department,
            Contact.Description,
            Contact.DoNotCall,
            Contact.Email,
            Contact.HasOptedOutOfEmail,
            Contact.Fax,
            Contact.HasOptedOutOfFax,
            Contact.HomePhone,
            Contact.IndividualId,
            Contact.Languages__c,
            Contact.LastModifiedById,
            Contact.LastCURequestDate,
            Contact.LastCUUpdateDate,
            Contact.LeadSource,
            Contact.Level__c,
            Contact.MailingAddress,
            Contact.MobilePhone,
            Contact.Name,
            Contact.OtherAddress,
            Contact.OtherPhone,
            Contact.Phone,
            Contact.ReportsToId,
            Contact.Title,
            Contact.Id
        };
    }

    public List<Contact> selectById(Set<Id> setIds) {

        return Database.query(
            newQueryFactory()
                .setCondition('Id IN :setIds')
            .toSOQL()
        );
    }
}