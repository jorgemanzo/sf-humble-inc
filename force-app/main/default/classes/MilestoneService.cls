public with sharing class MilestoneService {

    public static final String FIRST_RESPONSE_MILESTONE_NAME    = 'First Response';
    public static final String RESOLUTION_TIME_MILESTONE_NAME   = 'Resolution Time';
    public static final String DAILY_CORRESPONDENCE_MILESTONE_NAME = 'Daily Correspondence';

    /**
     * Mark "Resolution Time" milestones complete on a given
     * list of cases.
     * 
     * Cases must be:
     * - Closed
     * - Have an SLA start date prior to now
     * - Have no SLA exit date.
     */
    public static void completeResolutionTimeMilestone(List<Case> cases) {
        if(UserInfo.getUserType() == 'Standard') {
            DateTime completionDate = System.now();
            List<Id> updateCases = new List<Id>();
            for(Case c : cases) {
                if(
                    ((c.isClosed == true) || (c.Status == 'Closed')) && 
                    ((c.SlaStartDate <= completionDate) && (c.SlaExitDate == null))
                ) {
                    updateCases.add(c.Id);
                }
            }
            if(updateCases.isEmpty() == false) {
                MilestoneUtils.completeMilestone(updateCases, RESOLUTION_TIME_MILESTONE_NAME, completionDate);
            }
        }
    }

    /**
     * Complete the "First Response" milestone requirement when an email message is sent
     * to the case contact.
     */
    public static void completeFirstResponseMilestone(List<EmailMessage> emailMessages) {
        if(UserInfo.getUserType() == 'Standard'){
            DateTime completionDate = System.now();
            Map<ID, String> emIds = new Map<ID, String>();
            for(EmailMessage em : emailMessages){
                if(em.Incoming == false)
                    emIds.put(em.ParentId, em.ToAddress);
            }
            if(emIds.isEmpty() == false){
                Set<ID> emCaseIds = new Set<ID>();
                emCaseIds = emIds.keySet();
                List<Case> caseList = new CasesSelector().selectByIdWithContact(emCaseIds);
                if(caseList.isEmpty() == false){
                    List<ID> updateCases = new List<ID>();
                    for(Case caseObj : caseList) {
                        if(
                            ((emIds.get(caseObj.Id)  == caseObj.Contact.Email)||(emIds.get(caseObj.Id)  == caseObj.SuppliedEmail)) &&
                            (caseObj.EntitlementId  != null) &&
                            (caseObj.SlaStartDate   <= completionDate) &&
                            (caseObj.SlaStartDate   != null) &&
                            (caseObj.SlaExitDate    == null)
                        ) {
                            updateCases.add(caseObj.Id);
                        }
                    }
                    if(updateCases.isEmpty() == false) {
                        MilestoneUtils.completeMilestone(updateCases, FIRST_RESPONSE_MILESTONE_NAME, completionDate);
                    }
                }
            }
        }
    }

    public static void completeFirstResponseMilestone(List<CaseComment> caseComments) {
        if(UserInfo.getUserType() == 'Standard') {
            DateTime completionDate = System.now();
            Set<Id> caseIds = new Set<Id>();
            for(CaseComment cc : caseComments){
                caseIds.add(cc.ParentId);
            }
            if(caseIds.isEmpty() == false) {
                List<Case> caseList = new CasesSelector().selectByIdWithContact(caseIds);
                if(caseList.isEmpty() == false) {
                    List<Id> updateCases = new List<Id>();
                    for(Case caseObj:caseList) {
                        if(
                            (caseObj.EntitlementId != null) &&
                            (caseObj.SlaStartDate <= completionDate) &&
                            (caseObj.SlaStartDate != null) &&
                            (caseObj.SlaExitDate == null)
                        ) {
                            updateCases.add(caseObj.Id);
                        }
                    }
                    if(updateCases.isEmpty() == false) {
                        MilestoneUtils.completeMilestone(updateCases, FIRST_RESPONSE_MILESTONE_NAME, completionDate);
                    }
                }
            }
        }
    }

    
    public static void completeDailyCorrespondenceMilestone(List<EmailMessage> emailMessages) {
        if(UserInfo.getUserType() == 'Standard'){
            DateTime completionDate = System.now();
            Map<ID, String> emIds = new Map<ID, String>();
            for(EmailMessage em : emailMessages){
                if(em.Incoming == false)
                    emIds.put(em.ParentId, em.ToAddress);
            }
            if(emIds.isEmpty() == false){
                Set<ID> emCaseIds = new Set<ID>();
                emCaseIds = emIds.keySet();
                List<Case> caseList = new CasesSelector().selectByIdWithContact(emCaseIds);
                if(caseList.isEmpty() == false){
                    List<ID> updateCases = new List<ID>();
                    for(Case caseObj : caseList) {
                        if(
                            ((emIds.get(caseObj.Id)  == caseObj.Contact.Email)||(emIds.get(caseObj.Id)  == caseObj.SuppliedEmail)) &&
                            (caseObj.EntitlementId  != null) &&
                            (caseObj.SlaStartDate   <= completionDate) &&
                            (caseObj.SlaStartDate   != null) &&
                            (caseObj.SlaExitDate    == null)
                        ) {
                            updateCases.add(caseObj.Id);
                        }
                    }
                    if(updateCases.isEmpty() == false) {
                        MilestoneUtils.completeMilestone(updateCases, DAILY_CORRESPONDENCE_MILESTONE_NAME, completionDate);
                    }
                }
            }
        }
    }

    public static void completeDailyCorrespondenceMilestone(List<CaseComment> caseComments) {
        if(UserInfo.getUserType() == 'Standard') {
            DateTime completionDate = System.now();
            Set<Id> caseIds = new Set<Id>();
            for(CaseComment cc : caseComments){
                caseIds.add(cc.ParentId);
            }
            if(caseIds.isEmpty() == false) {
                List<Case> caseList = new CasesSelector().selectByIdWithContact(caseIds);
                if(caseList.isEmpty() == false) {
                    List<Id> updateCases = new List<Id>();
                    for(Case caseObj:caseList) {
                        if(
                            (caseObj.EntitlementId != null) &&
                            (caseObj.SlaStartDate <= completionDate) &&
                            (caseObj.SlaStartDate != null) &&
                            (caseObj.SlaExitDate == null)
                        ) {
                            updateCases.add(caseObj.Id);
                        }
                    }
                    if(updateCases.isEmpty() == false) {
                        MilestoneUtils.completeMilestone(updateCases, DAILY_CORRESPONDENCE_MILESTONE_NAME, completionDate);
                    }
                }
            }
        }
    }

}