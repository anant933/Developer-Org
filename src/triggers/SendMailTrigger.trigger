trigger SendMailTrigger on Contact (after insert,after delete) {
Integer n=Trigger.Size;
    if(Trigger.isInsert)
{
    //Integer n=Trigger.Size;
    EmailManager.sendMail('agarwalanant93@gmail.com','No. of records inserted'+n,'Testing');
}
    if(Trigger.isDelete)
    {
        //Integer n=Trigger.Size;
    EmailManager.sendMail('agarwalanant93@gmail.com','No. of records deleted'+n,'Testing');
    }
}