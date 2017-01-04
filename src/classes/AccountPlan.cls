global class AccountPlan {
    webservice String Area;
    webservice String Region;

    global class Plan{
        webservice String name;
        webservice Integer planNumber;
        webservice Id planId;
        webservice Date planningPeriod;
    }
      webservice static Plan createAccountPlan(Plan p) {
          Account acct=new Account();
          acct.name=p.Name;
          acct.AccountNumber=String.valueOf(p.planNumber);
          insert acct;
          p.planId=acct.Id;
          return p;
       }

}