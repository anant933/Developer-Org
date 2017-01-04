public class soapIntegrationExample{
  public void callWebService(){
        // Create the stub
tempuriOrg.DNSSoap dns = new tempuriOrg.DNSSoap();

// Set up the license header
dns.LicenseInfo = new wsStrikeironCom.LicenseInfo();
dns.LicenseInfo.RegisteredUser = new wsStrikeironCom.RegisteredUser();
dns.LicenseInfo.RegisteredUser.UserID = 'you@company.com';
dns.LicenseInfo.RegisteredUser.Password = 'your-password';

// Make the Web service call
tempuriOrg.DNSInfo info = dns.DNSLookup('www.myname.com'); 
    }
}