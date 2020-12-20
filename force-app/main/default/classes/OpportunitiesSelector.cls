public without sharing class OpportunitiesSelector extends fflib_SObjectSelector  {
    public Schema.SObjectType getSObjectType() {
        return Opportunity.SObjectType;
    }
    
    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Opportunity.AccountId,
            Opportunity.Amount,
            Opportunity.CloseDate,
            Opportunity.ContractId,
            Opportunity.CreatedById,
            Opportunity.CurrentGenerators__c,
            Opportunity.DeliveryInstallationStatus__c,
            Opportunity.Description,
            Opportunity.ExpectedRevenue,
            Opportunity.ForecastCategoryName,
            Opportunity.Id,
            Opportunity.LastModifiedById,
            Opportunity.LeadSource,
            Opportunity.MainCompetitors__c,
            Opportunity.NextStep,
            Opportunity.Name,
            Opportunity.OwnerId,
            Opportunity.IqScore,
            Opportunity.OrderNumber__c,
            Opportunity.Pricebook2Id,
            Opportunity.CampaignId,
            Opportunity.IsPrivate,
            Opportunity.Probability,
            Opportunity.TotalOpportunityQuantity,
            Opportunity.StageName,
            Opportunity.TrackingNumber__c,
            Opportunity.Type
        };
    }

    public List<Opportunity> selectById(Set<Id> idSet) {
        return (List<Opportunity>) selectSObjectsById(idSet);
    }

    public List<Opportunity> selectByIdWithProducts(Set<ID> idSet)
	{
		fflib_QueryFactory opportunitiesQueryFactory = newQueryFactory();

		fflib_QueryFactory lineItemsQueryFactory = 
			new OpportunityLineItemsSelector().
				addQueryFactorySubselect(opportunitiesQueryFactory);
			
		new PricebookEntriesSelector().
			configureQueryFactoryFields(lineItemsQueryFactory, 'PricebookEntry');
		new ProductsSelector().
			configureQueryFactoryFields(lineItemsQueryFactory, 'PricebookEntry.Product2');
		new PricebooksSelector().
			configureQueryFactoryFields(lineItemsQueryFactory, 'PricebookEntry.Pricebook2');

		return (List<Opportunity>) Database.query(
			opportunitiesQueryFactory.setCondition('id in :idSet').toSOQL());
	}
}