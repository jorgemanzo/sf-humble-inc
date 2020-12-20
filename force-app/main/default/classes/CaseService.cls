public with sharing class CaseService {
    public static void closeCases(Set<Id> caseIds, String reason) {
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new List<Schema.SObjectType>{
                Case.SObjectType
            }
        );

        Map<Id, Case> casesToClose = new Map<Id, Case>([
            SELECT Id, Status
            FROM Case
            WHERE Id IN :caseIds
        ]);

        for (Case toClose : casesToClose.values()) {
            toClose.Status = 'Closed';
            toClose.reason = reason;
            uow.registerDirty(toClose);
        }

        uow.commitWork();
    }
}