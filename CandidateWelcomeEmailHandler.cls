/**
 * @description       : 
 * @author            : ChangeMeIn@UserSettingsUnder.SFDoc
 * @group             : 
 * @last modified on  : 12-02-2024
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/
public class CandidateWelcomeEmailHandler {
 
    public static void sendWelcomeEmail(List<Candiate__c> newCandidates) {

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
        List<Contact> contactsToCreate = new List<Contact>();
 
        
        String emailTemplateId = '00XdL000008AjC9UAK';
 
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
        if (!contactsToCreate.isEmpty()) {
            insert contactsToCreate;
        }
 
        // Prepare the email messages after contacts are inserted
        for (Integer i = 0; i < newCandidates.size(); i++) {
            Candiate__c candidate = newCandidates[i];
            if (candidate.Email__c != null) { // Only proceed if candidate has an email
                Contact contact = contactsToCreate[i];
 
                // Create the email message
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
 
                // Set the email template
                email.setTemplateId(emailTemplateId);
 
                // Set the TargetObjectId as the created Contact (This is mandatory for email template usage)
                email.setTargetObjectId(contact.Id);
 
                // Ensure the recipient (email) is added in case TargetObjectId doesn't work
                email.setSaveAsActivity(false); // Prevent saving the email as an activity
                emails.add(email);
            }
        }
 
        if (!emails.isEmpty()) {
            // Send the emails using the template
            Messaging.sendEmail(emails);
        }
    }
}
