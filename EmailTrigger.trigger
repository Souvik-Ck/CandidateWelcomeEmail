/**
 * @description       : Trigger to send a welcome email when a new record is created.
 *                       This trigger is designed to handle the after-insert event and delegates
 *                       the email-sending logic to the CandidateWelcomeEmailHandler class.
 * @author            : Souvik Sen
 * @group             : Apex Trigger
 * @last modified on  : 01-02-2025
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
trigger EmailTrigger on Candiate__c (after insert) {
// Call the handler class method to send the welcome email
        CandidateWelcomeEmailHandler.sendWelcomeEmail(Trigger.new);
    
}
