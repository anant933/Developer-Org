public class MyOpportunityController {
    public ID opportunityID {get; set;}
     
    public Opportunity getOpportunity()
    {
        Opportunity opportunity=new Opportunity();
       
       // opp=[Select ];
        opportunity=[Select name,owner.name from opportunity where id=:opportunityID];
     return opportunity;   
    }
    public List<OpportunityLineItem> getDetails()
    {
        List<OpportunityLineItem> opp_lineitem=new List<OpportunityLineItem>();
        opp_lineitem=[SELECT UnitPrice,Quantity,PricebookEntry.Product2.Name,ServiceDate,Description FROM OpportunityLineItem WHERE OpportunityId=:opportunityID];
        return opp_lineitem;
    }

}