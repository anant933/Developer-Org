public class RandomContactFactory {
/*    
    public static List<Contact> generateRandomContacts(Integer numCont,String Lname)
    {
        List<Contact> con=new List<Contact>();
        
        for(Integer i=1;i<=numCont;i++)
        {
            System.debug('i is :'+i);
            Contact c=new Contact();
             c.FirstName='Test'+i;
            c.LastName=Lname;
            con.add(c);
                    }
       System.debug('Contact list is :'+con);
        return con;
        
    }

}

var status = '{!Lead.Oyo_Lead_Verification_Status__c}'; 
var statusLead = '{!Lead.Status}'; 
var internalSupplyModel = '{!Lead.Internal_Suppy_Model__c}'; 
var profile = '{!$Profile.Name}'; 

var servantQuater = '{!Lead.Servant_Quarters__c}'; 
var furnishedStatus = '{!Lead.Furnished_Status__c}'; 

var address = '{!Lead.Oyo_Address__c}';
var propertyType = '{!Lead.Oyo_Property_Category__c}';
var openGuest = '{!Lead.Open_for_guests_currently__c}';
var numberRooms = '{!Lead.Oyo_Number_of_Operational_Rooms__c}';

if(profile=='Lead Manager' || profile=='Lead Head') 
{ 
    if( statusLead == 'Qualified' && internalSupplyModel.length>0 && address.length>0 && propertyType.length>0 && openGuest.length>0 && numberRooms.length>0 ) 
    { 
        if(internalSupplyModel == 'Flagship' && (servantQuater.length < 1 || furnishedStatus.length < 1)) { 
            // servant quaters and furnished info are mandatory 
            alert('Furnished Status and Servant Quarters fields are mandatory for Flagship Supply Model.'); 
        } 
        else { 
            
            if(status != 'Verification Completed') 
            { 
                var con = confirm('Lead is not verified, Are you sure you want to convert lead?'); 
                if(con == true) 
                { 
                    window.open("/apex/Oyo_convertLead_custom?id="+'{!Lead.Id}'+"&leadcity="+'{!Lead.Oyo_CityId__c}', "_self"); 
                } 
            }else 
            { 
                window.open("/apex/Oyo_convertLead_custom?id="+'{!Lead.Id}'+"&leadcity="+'{!Lead.Oyo_CityId__c}', "_self"); 
            } 
        } 
    } 
    else 
    { 
        if(internalSupplyModel.length<1){ 
            alert('Internal Supply Model is not selected on the Lead, it can\'t be converted.'); 
        }else if(statusLead != 'Qualified'){ 
            alert('Lead is not qualified, can\'t be converted.'); 
        }
        else if(address.length<1){
            alert('Lead address cannot be blank, can\'t be converted.'); 
        } 
        else if(propertyType.length<1   ){
            alert('Property Type is not selected, can\'t be converted.');
        }
        else if(openGuest.length>0){
            alert('Open for Guest Currently is not selected, can\'t be converted.');
        }
        else if(numberRooms.length<1){
            alert('Total Number Of Rooms cannot be blank, can\'t be converted.');
        }
    } 
} 
else{ 
    alert('You are not allowed to convert the lead.'); 
}*/
}