trigger CaseCommentTrigger on CaseComment (after insert) {
    new CaseCommentTriggerHandler().run();
}