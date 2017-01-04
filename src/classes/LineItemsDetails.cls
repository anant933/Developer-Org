public class LineItemsDetails {

    public LineItemsDetails() {

    }

    ID recordID;

    public LineItemsDetails(ApexPages.StandardController controller) {
        
           recordID=Apexpages.CurrentPage().getparameters().get('id');
        


    }
    public List<OpportunityLineItem> getDetails()
    {
        List<OpportunityLineItem> opp_lineitem=new List<OpportunityLineItem>();
        opp_lineitem=[SELECT UnitPrice,Quantity,PricebookEntry.Product2.Name,ServiceDate,Description FROM OpportunityLineItem WHERE OpportunityId=:recordID];
        return opp_lineitem;
    }

}