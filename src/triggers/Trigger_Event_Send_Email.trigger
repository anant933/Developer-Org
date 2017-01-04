trigger Trigger_Event_Send_Email on Event (before update) {
    Set<Id> ownerIds = new Set<Id>();
    Set<Id> initiatorIds = new Set<Id>();
   
    for(Event evt: Trigger.New)
        ownerIds.add(evt.OwnerId);    //Assigned TO
        
    Map<Id, User> userMap = new Map<Id,User>([select Id, Name, Email from User where Id in :ownerIds]);
  
      for(Event evt: Trigger.New)
        initiatorIds.add(evt.CreatedById);   //Created By
        
    Map<Id, User> userMap2 = new Map<Id,User>([select Id, Name, Email from User where Id in :initiatorIds]);
  

    for(Event evt : Trigger.New)  {
        User theUser = userMap2.get(evt.CreatedById);
        User TheAssignee = userMap.get(evt.ownerId);
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {theUser.Email};
        mail.setToAddresses(toAddresses);    // Set the TO addresses
        mail.setSubject('An event owned by you has been updated');    // Set the subject

        String template = 'Hello {0}, \nYour event has been added. Here are the details - \n\n';
        
        template+= 'Subject - {1}\n';
        template+= 'Due Date - {2}\n';
        template+= 'Location - {3}\n';
        String duedate = '';
        template+= 'Assign To - {4}\n';
        template+= 'Type - {5}\n\n';
        template+= 'Link - {6}\n';
        
        if (evt.ActivityDate==null)
            duedate = '';
        else
            duedate = evt.ActivityDate.format();
        
        List<String> args = new List<String>();

        args.add(theUser.Name);
        args.add(evt.Subject);
        args.add(duedate);
        args.add(evt.location);
        args.add(theAssignee.Name);
        args.add(evt.Type);
        args.add('https://'+System.URL.getSalesforceBaseURL().getHost()+'/'+evt.Id);
        
        // Here's the String.format() call.
        String formattedHtml = String.format(template, args);
       
        mail.setPlainTextBody(formattedHtml);
        Messaging.SendEmail(new Messaging.SingleEmailMessage[] {mail});
  
  
    }
}