public with sharing class CaseCommentTriggerHandler extends TriggerHandler {
    private List<CaseComment> triggerNew;
    private List<CaseComment> triggerOld;
    private Map<Id, CaseComment> triggerMapNew;
    private Map<Id, CaseComment> triggerMapOld;

    /**
     * @description Constructor that sets class variables based on Trigger
     * context vars
     */
    public CaseCommentTriggerHandler() {
        this.triggerOld = (List<CaseComment>) Trigger.old;
        this.triggerNew = (List<CaseComment>) Trigger.new;
        this.triggerMapNew = (Map<Id, CaseComment>) Trigger.newMap;
        this.triggerMapOld = (Map<Id, CaseComment>) Trigger.oldMap;
    }

    public override void afterInsert() {
        MilestoneService.completeFirstResponseMilestone(triggerNew);
        MilestoneService.completeDailyCorrespondenceMilestone(triggerNew);
    }
}