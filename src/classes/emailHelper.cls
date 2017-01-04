// In a separate class so that it can be used elsewhere

Global class emailHelper {
private final Opportunity opp;

    public emailHelper(ApexPages.StandardController controller) {
    this.opp=(Opportunity)controller.getRecord();

    }
public String getName()
{
return opp.id;
}

 

public void sendEmail() {

 

  //New instance of a single email message
   EmailTemplate templateId = [Select id from EmailTemplate where name = 'Opportunity Product Details'];
   User recipient=new User();
    recipient=[SELECT id FROM user WHERE name='Anant Agarwal'];
     User candidate=new User();
    candidate=[SELECT id FROM user WHERE name='Akhil Sharma'];
    ID r=recipient.id;
    ID c=candidate.id;

        Opportunity oid=new Opportunity();
    oid=[Select id from Opportunity where name='Accenture-Mayank'];
 Messaging.SingleEmailMessage mail =

            new Messaging.SingleEmailMessage();

 

// Who you are sending the email to

   mail.setTargetObjectId(r);
    

 

   // The email template ID used for the email

   mail.setTemplateId(templateId.id);
   mail.setWhatId(opp.id);   
   
   mail.setBccSender(false);

   mail.setUseSignature(false);

   mail.setReplyTo('recruiting@acme.com');

   mail.setSenderDisplayName('HR Recruiting');

   mail.setSaveAsActivity(false); 

  

Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

 

    } 

}