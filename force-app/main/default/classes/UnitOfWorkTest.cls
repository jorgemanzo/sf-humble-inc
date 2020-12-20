@isTest
public with sharing class UnitOfWorkTest {

    @IsTest
    static void challengeComplete(){
        
        fflib_SObjectUnitOfWork uow = new fflib_SObjectUnitOfWork(
            new List<Schema.SObjectType> {
                Account.SObjectType,
                Contact.SObjectType,
                Note.SObjectType
            }
        );

        Test.startTest();
            for(Integer i = 0; i < 100; i++) {
                Account testAcc = new Account(Name='Test Acc#' + i.format());
                uow.registerNew(testAcc);
            }
            for(Integer i = 0; i < 500; i++) {
                Contact testCon = new Contact(LastName='Test Con#' + i.format());
                uow.registerNew(testCon);

                Note testNote = new Note(Title='Test Note#' + i.format());
                uow.registerRelationship(testNote, Note.ParentId, testCon);
                uow.registerNew(testNote);
            }
            uow.commitWork();
            uow=null;
        Test.stopTest();

        System.assertEquals(100, [Select Id from Account].size());
        System.assertEquals(500, [Select Id from Contact].size());
        System.assertEquals(500, [Select Id from Note].size());
    }
}