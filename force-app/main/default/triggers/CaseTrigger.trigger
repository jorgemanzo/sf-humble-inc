trigger CaseTrigger on Case (Before Insert, Before Update) {
    new CaseTriggerHandler().run();
}