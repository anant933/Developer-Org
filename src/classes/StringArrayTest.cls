public class StringArrayTest {
    public static List<String> generateStringArray(Integer n)
    {
        List<String> ls=new List<String>();
        for(Integer i=0;i<n;i++)
        {
            ls.add('Test '+i);
        }
        return ls;
    }
    public void catchList()
    {
        List<String> l1=generateStringArray(5);
        for(Integer i=0;i<l1.size();i++)
        {
            System.debug(l1[i]);
        }
    }

}