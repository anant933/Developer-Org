@isTest
public class Test_thecontroller {
    public static testMethod void testMyController()
    {
       // Lead l = new lead();
        //ApexPages.StandardController sc = new ApexPages.StandardController(lead);  -- When there are both standard controller and extension
        //ApexPages.currentPage().getParameters().put('qp','yyyy');
        //thecontroller tc=new thecontroller(sc);
        thecontroller tc=new thecontroller();
        String nextPage=tc.save().getURL();
        System.assertEquals('/apex/failure?error=noParam', nextPage);
        ApexPages.currentPage().getParameters().put('qp','yyyy');
        tc=new thecontroller();
        tc.setFirstName('firstName');
        tc.setLastName('lastName');
        tc.setCompany('compro');
        tc.setEmail('anant.agarwal@comprotechnologies.com');
        String t=tc.getCompany()+''+tc.getEmail()+''+tc.getFirstName()+''+tc.getLastName();
        nextPage=tc.save().getURL();
        System.assertEquals('/apex/success', nextPage);
        Lead[] l = [select id, email from lead where Company = 'compro'];
        

        System.assertEquals('anant.agarwal@comprotechnologies.com', l[0].email);    
    }
    public static testMethod void testLastName()
    {
          ApexPages.currentPage().getParameters().put('qp','yyyy');
       thecontroller tc=new thecontroller();
        tc.setCompany('compro');
        tc.setEmail('abc');
        tc.setFirstName('Anant');
        tc.setLastName('Agarwal');
    
        String nextPage=tc.save().getURL();
    }

}