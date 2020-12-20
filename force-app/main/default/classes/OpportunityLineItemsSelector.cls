public without sharing class OpportunityLineItemsSelector extends fflib_SObjectSelector  {
    public Schema.SObjectType getSObjectType() {
        return OpportunityLineItem.SObjectType;
    }

    public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			OpportunityLineItem.CreatedById,
			OpportunityLineItem.Description,
			OpportunityLineItem.Discount,
			OpportunityLineItem.Id,
			OpportunityLineItem.LastModifiedById,
			OpportunityLineItem.ListPrice,
			OpportunityLineItem.Name,
			OpportunityLineItem.OpportunityId,
			OpportunityLineItem.Product2Id,
			OpportunityLineItem.ProductCode,
			OpportunityLineItem.Quantity,
			OpportunityLineItem.ServiceDate,
			OpportunityLineItem.Subtotal,
			OpportunityLineItem.TotalPrice,
			OpportunityLineItem.UnitPrice
		};
    }
    
	public List<OpportunityLineItem> selectById(Set<ID> idSet)
	{
		return (List<OpportunityLineItem>) selectSObjectsById(idSet);
	}
}