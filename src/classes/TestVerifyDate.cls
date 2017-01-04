@isTest
private class TestVerifyDate {
    @isTest static void TestCheckDates()
    {
        Date d1=(System.now()).date();
        Date d2=d1.addDays(15);
        Date d=VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d2,d);
    }
     @isTest static void ElseTestCheckDates()
    {
        Date d1=(System.now()).date();
        Date d2=d1.addDays(45);
        Date d=VerifyDate.CheckDates(d1,d2);
        System.assertEquals(d1,d);
    }
      @isTest static void TestDateWithIn30Days()
    {
        Date d1=(System.now()).date();
        Date d2=d1.addDays(-10);
        Boolean b=VerifyDate.DateWithin30Days(d1, d2);
        System.assertEquals(false,b);
    }
         @isTest static void IFTestDateWithIn30Days()
    {
        Date d1=(System.now()).date();
        Date d2=d1.addDays(45);
        Boolean b=VerifyDate.DateWithin30Days(d1, d2);
        System.assertEquals(false,b);
    }
         @isTest static void ElseTestDateWithIn30Days()
    {
        Date d1=(System.now()).date();
        Date d2=d1.addDays(10);
        Boolean b=VerifyDate.DateWithin30Days(d1, d2);
        System.assertEquals(true,b);
    }
         @isTest static void TestSetEndOfMonthDate()
    {
        Date d1=(System.now()).date();
       Integer totalDays = Date.daysInMonth(d1.year(), d1.month());
		Date lastDay = Date.newInstance(d1.year(), d1.month(), totalDays);
       // Date d2=d1.addDays(45);
        Date d=VerifyDate.SetEndOfMonthDate(d1);
        System.assertEquals(lastDay,d);
    }

}