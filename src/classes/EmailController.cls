public class EmailController {
    public static void sendMail()
    {
       OrgWideEmailAddress owa = [select id, DisplayName, Address from OrgWideEmailAddress limit 1];
EmailTemplate templateId = [Select id from EmailTemplate where name = 'Opportunity Product Details'];
List<Messaging.SingleEmailMessage> allmsg = new List<Messaging.SingleEmailMessage>();
Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
mail.setTemplateID(templateId.Id); 
mail.setSaveAsActivity(true);
mail.setOrgWideEmailAddressId(owa.id);
allmsg.add(mail);
Messaging.sendEmail(allmsg,false);
        System.debug('sent');
    }

}