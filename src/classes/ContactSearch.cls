public class ContactSearch {
    public static List<Contact> searchForContacts(String LastName,String Mailingaddr)
    {
        List<Contact> c=new List<Contact>([SELECT Id,Name From Contact WHERE LastName=:LastName AND MailingPostalCode=:Mailingaddr]);
        return c;
        
    }

}