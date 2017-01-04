public class NewCaseListController {
public List<Case> getNewCases()
{
List<Case> c=new List<Case>();
c=[SELECT ID,CaseNumber From Case Where Status='New'];
return c;
}
}