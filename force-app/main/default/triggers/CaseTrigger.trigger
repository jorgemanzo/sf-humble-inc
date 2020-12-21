trigger CaseTrigger on Case (before insert, before update, after update) {
    new CaseTriggerHandler().run();
}