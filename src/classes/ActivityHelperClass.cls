public class ActivityHelperClass {
    public Lead activityCompleted(ID Lid)
    {
        try{
            Lead l1=[SELECT Status FROM LEAD WHERE id=:Lid AND Status='Open - Not Contacted']; 
            l1.status='Working - Contacted'; 
            return l1;
         }
        catch(Exception e)
        {
            System.debug('Error: '+e.getMessage());
            return null;
        }
    }

}