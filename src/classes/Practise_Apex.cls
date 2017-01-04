public class Practise_Apex{
    public static void test()
    {
        List<String> colors=new LIST<String>{'red','blue','green'};
        String s1=colors.get(0);
       String s2=colors[1];
      System.assertEquals(s1,s2,'Error Occur');
        for(Integer i=0;i<colors.size();i++)
            {
              System.debug(colors[i]);  
            }
        
    }

}