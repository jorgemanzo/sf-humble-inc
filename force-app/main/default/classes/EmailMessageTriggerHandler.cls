public with sharing class EmailMessageTriggerHandler extends TriggerHandler {
    private List<EmailMessage> triggerNew;
    private List<EmailMessage> triggerOld;
    private Map<Id, EmailMessage> triggerMapNew;
    private Map<Id, EmailMessage> triggerMapOld;

    /**
     * @description Constructor that sets class variables based on Trigger
     * context vars
     */
    public EmailMessageTriggerHandler() {
        this.triggerOld = (List<EmailMessage>) Trigger.old;
        this.triggerNew = (List<EmailMessage>) Trigger.new;
        this.triggerMapNew = (Map<Id, EmailMessage>) Trigger.newMap;
        this.triggerMapOld = (Map<Id, EmailMessage>) Trigger.oldMap;
    }

    public override void afterInsert() {
        MilestoneService.completeFirstResponseMilestone(triggerNew);
        MilestoneService.completeDailyCorrespondenceMilestone(triggerNew);
    }
}