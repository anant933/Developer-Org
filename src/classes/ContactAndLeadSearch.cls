public class ContactAndLeadSearch {
    public static List<List<SObject>> searchContactsAndLeads(String param)
    {
       
        List<List<SObject>> cld=[FIND :param IN NAME FIELDS RETURNING Contact(FirstName),Lead(LastName)];
        return cld;
    }

}