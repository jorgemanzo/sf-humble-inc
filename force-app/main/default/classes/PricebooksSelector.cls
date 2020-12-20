public without sharing class PricebooksSelector extends fflib_SObjectSelector {
	public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			Pricebook2.CreatedById,
			Pricebook2.Description,
			Pricebook2.Id,
			Pricebook2.IsActive,
			Pricebook2.IsStandard,
			Pricebook2.LastModifiedById,
			Pricebook2.Name
		};
	}

	public Schema.SObjectType getSObjectType()
	{
		return Pricebook2.sObjectType;
    }
    
    public List<Pricebook2> selectById(Set<ID> idSet)
	{
		return (List<Pricebook2>) selectSObjectsById(idSet);
	}	
}