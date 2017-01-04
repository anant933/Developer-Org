@RestResource(urlMapping='/Widgets/*')
global class WidgetController {

    @HttpGet
    global static List<Widget__c> getWidgets() {
        List<Widget__c> widgets = [SELECT Name from Widget__c];
        return widgets;
    }

    @HttpPost 
    global static string createNewWidget(String Name) {
        Widget__c w = new Widget__c();
        w.Name = Name;
        insert w;
        //RestRequest req = RestContext.request;
       // RestResponse res = RestContext.response;
        ///res.responseBody = blob.valueof(string.valueof(req.requestBody) + anant);
        return 'abc';
   }

    @HttpDelete
    global static String deleteWidgetById() {
        String Id = RestContext.request.params.get('Id');
        List<Widget__c> w = [ Select ID from Widget__c where Id= :Id];

        delete w;

        return 'Deleted Widget';
    }

    @HttpPut
    global static String updateWidget(String Id, String NewName) {
        Widget__c w = [ Select ID, Name from Widget__c where Id= :Id];

        w.Name = NewName;
        update w;

        return 'Widget Updated';
    }
}