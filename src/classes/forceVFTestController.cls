public class forceVFTestController {
    public String opptyName{get;set;}
    public List<Subscription_Form__c> sList{get;set;}
    public forceVFTestController(ApexPages.StandardController controller) {
    
    }
    public void getForm(){
    //opptyName='aa1';
    sList = [SELECT id,Name,Email__c, Password__c, Opportunity__r.Name, Opportunity__r.StageName,Name__c, Channels_Selected__c, Opportunity__r.LeadSource FROM Subscription_Form__c WHERE Opportunity__r.Name = :opptyName LIMIT 1];
    opptyName=sList[0].Opportunity__r.Name;
    }
    public PageReference save1(){
    System.debug('Save fn');
     if(sList != NULL){
      upsert sList;
      System.debug('upserted');
     }
     Blob fileBody=Blob.valueOf('test');
     Attachment attachment= new Attachment();
     attachment.ParentId = sList[0].Id;
attachment.IsPrivate = false;
attachment.body = fileBody;
attachment.Name='Test File.pdf';


    insert attachment;
     
      return Page.forceVFTest;
    }
}