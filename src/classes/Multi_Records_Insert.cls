public class Multi_Records_Insert {
    public void myInsert()
    {
        List<Account> la=new List<Account>();
        
        for(Integer i=0;i<5;i++)
        {
            Account a=new Account();
            a.Name='Akhil'+i;
            la.add(a);
        }
        insert la;
    }

}