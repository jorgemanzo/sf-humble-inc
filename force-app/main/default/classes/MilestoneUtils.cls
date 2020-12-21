public with sharing class MilestoneUtils {
    public static void completeMilestone(List<Id> caseIds, String milestoneName, DateTime complDate) {
        List<CaseMilestone> cmsToUpdate = new CaseMilestonesSelector().selectByCaseIdWithMilestoneTypeName(new Set<Id>(caseIds), milestoneName);
        if(cmsToUpdate.isEmpty() == false){
            for (CaseMilestone cm : cmsToUpdate){
                cm.completionDate = complDate;
            }
            update cmsToUpdate;
        }
    }
}