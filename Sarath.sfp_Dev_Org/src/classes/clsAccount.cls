public class clsAccount {
public list<Account> acclist{get;set;}
public clsAccount()
{
    acclist = [select id,Name,AccountNumber,BillingAddress,Industry from Account limit 1 ];
}
}