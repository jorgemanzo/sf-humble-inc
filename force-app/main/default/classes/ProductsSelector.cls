public without sharing class ProductsSelector extends fflib_SObjectSelector {
	public Schema.SObjectType getSObjectType()
	{
		return Product2.sObjectType;
    }
    
    public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
			Product2.CreatedById,
			Product2.Description,
			Product2.DisplayUrl,
			Product2.Family,
			Product2.Id,
			Product2.IsActive,
			Product2.LastModifiedById,
			Product2.Name,
			Product2.ProductCode,
			Product2.QuantityUnitOfMeasure,
			Product2.StockKeepingUnit
		};
    }
    
    public List<Product2> selectById(Set<ID> idSet)
	{
		return (List<Product2>) selectSObjectsById(idSet);
	}
}