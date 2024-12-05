/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-02-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger EmailTrigger on Candiate__c (after insert) {
// Call the handler class method to send the welcome email
    if (Trigger.isAfter && Trigger.isInsert) {
        CandidateWelcomeEmailHandler.sendWelcomeEmail(Trigger.new);
    }
}
