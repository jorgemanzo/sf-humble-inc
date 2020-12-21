public with sharing class CaseTriggerHandler extends TriggerHandler {
    private List<Case> triggerNew;
    private List<Case> triggerOld;
    private Map<Id, Case> triggerMapNew;
    private Map<Id, Case> triggerMapOld;

    /**
     * @description Constructor that sets class variables based on Trigger
     * context vars
     */
    public CaseTriggerHandler() {
        this.triggerOld = (List<Case>) Trigger.old;
        this.triggerNew = (List<Case>) Trigger.new;
        this.triggerMapNew = (Map<Id, Case>) Trigger.newMap;
        this.triggerMapOld = (Map<Id, Case>) Trigger.oldMap;
    }

    public override void beforeInsert() {
        CaseDefaultEntitlement.applyDefault(triggerNew);
    }

    public override void beforeUpdate() {
        CaseDefaultEntitlement.applyDefault(triggerNew);
    }

    public override void afterUpdate() {
        MilestoneService.completeResolutionTimeMilestone(triggerNew);
    }
}