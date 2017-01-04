public class ContactsListController {
    private String sortOrder='LastName';
    public void sortByLastName()
    {
        this.sortOrder='LastName';
    }
    public void sortByFirstName()
    {
        this.sortOrder='FirstName';
    }

    public List<Contact> getContacts() {
        List<Contact> c=new List<Contact>();
        String que='Select FirstName,LastName,Phone FROM Contact order by '+ sortOrder+' ASC';
        c=Database.query(que);
        return c;
    }


}