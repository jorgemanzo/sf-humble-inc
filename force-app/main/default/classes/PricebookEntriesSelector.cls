public without sharing class PricebookEntriesSelector extends fflib_SObjectSelector {
    public Schema.SObjectType getSObjectType()
	{
		return PricebookEntry.sObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			PricebookEntry.CreatedById,
			PricebookEntry.Id,
			PricebookEntry.IsActive,
			PricebookEntry.Name,
			PricebookEntry.Pricebook2Id,
			PricebookEntry.Product2Id,
			PricebookEntry.ProductCode,
			PricebookEntry.UnitPrice,
			PricebookEntry.UseStandardPrice
		};
	}
    
    public List<PricebookEntry> selectById(Set<ID> idSet)
	{
		return (List<PricebookEntry>) selectSObjectsById(idSet);
	}
}