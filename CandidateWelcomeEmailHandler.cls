/**
 * @description       : handler Class for creating an email when candidate record generate
 * @author            : Souvik Sen
 * @group             : Apex 
 * @last modified on  : 01-02-2025
 * @last modified by  : Souvik Sen
**/
public with sharing class CandidateWelcomeEmailHandler {
 
    
    public static void sendWelcomeEmail(List<Candiate__c> newCandidates) {
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        List<Contact> contactsToCreate = new List<Contact>();
        
     
        // String emailTemplateId = '00XdL000008AjC9UAK';
        EmailTemplate emailTemplate = [SELECT Id 
                                       FROM EmailTemplate 
                                       WHERE Name =:AssignmentsConstants.CANDIDATE_WELCOME_EMAIL
                                       WITH SYSTEM_MODE  
                                       LIMIT 1];
        String emailTemplateId = emailTemplate.Id;
 
        // Create contacts for each candidate
        for (Candiate__c candidate : newCandidates) {
            if (candidate.Email__c != null) {
                // Create Contact for each Candidate to send the email
                Contact newContact = new Contact(
                    FirstName = candidate.Name.split(' ')[0],
                    LastName = candidate.Name.split(' ')[1],
                    Email = candidate.Email__c
                );
                contactsToCreate.add(newContact);
            }
        }
 
        // Insert the contacts first (if any)
        if (Schema.sObjectType.Contact.isAccessible() || Schema.sObjectType.Contact.isCreateable()) {
            insert contactsToCreate;
        }
 
        // Prepare the email messages after contacts are inserted
        for (Integer i = 0; i < newCandidates.size(); i++) {
            Candiate__c candidate = newCandidates[i];
            if (candidate.Email__c != null) { // Only proceed if candidate has an email
                Contact contact = contactsToCreate[i];  
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();   
                email.setTemplateId(emailTemplateId);         
                email.setTargetObjectId(contact.Id);     
                email.setSaveAsActivity(false); 
                emails.add(email);
            }
        }
 
        if (!emails.isEmpty()) {
            Messaging.sendEmail(emails);
        }
    }
}
