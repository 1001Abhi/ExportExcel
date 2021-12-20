public class ExportExcel {
    public List<OpportunityWrapper> oppWrapper{get; set;}
	public String xmlheader {get;set;}
    public String endfile{get;set;}
    private ApexPages.StandardController controller;
    public ExportExcel(ApexPages.StandardController controller){
        this.controller = controller;
		xmlheader ='<?xml version="1.0"?><?mso-application progid="Excel.Sheet"?>';
        endfile = '</Workbook>';
    
        oppWrapper = new List<OpportunityWrapper>();
 
        try {
                for(Opportunity oppty : [SELECT Id, Name, Amount, StageName , CloseDate FROM Opportunity where Id =: controller.getId()]){
                                                        OpportunityWrapper oppWrp = new OpportunityWrapper();
														oppWrp.Name = oppty.Name;
														oppWrp.Amount = Oppty.Amount;
														oppWrp.StageName = Oppty.StageName;
														oppWrp.CloseDate = Oppty.CloseDate;
														oppWrapper.add(oppWrp);
                                                        }
        } catch(Exception ex){
            System.debug('Error : ' + ex.getMessage() +' '+ ex.getCause() + ' '+  ex.getLineNumber());
        }
	}		
    
    public class OpportunityWrapper{
        public String Name{get; set;}
        public Decimal Amount{get; set;}
        public String StageName{get; set;}
        public Date CloseDate {get; set;}
    }
}
