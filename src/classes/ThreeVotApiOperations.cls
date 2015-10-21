public with sharing class ThreeVotApiOperations {

	public static string apex(string rawJSON, string className){
		try{
			string originalClassName = className;
			List<string> classParts = className.split('\\.');
			string namespace = '';

			if( classParts.size() > 1 ){
				namespace = classParts.get(0);
				className = classParts.get(1);
			}
				
			Type t = Type.forName(className);
	        if(t == null && className != null) {
	            // Attempt to get the type again with the namespace explicitly set
	            t = Type.forName(namespace, className);
	        }
	        if(t == null && className != null) {
	            // Attempt to get the type again with the namespace explicitly set to blank
	            t = Type.forName('', className);
	        }
	        if(t == null) {
	            return RemoteTKController.makeError('Could not find class: ' + originalClassName , 'NOT_FOUND');
	        }
		
			IApexController controller = (IApexController)t.newInstance();
			return controller.execute(rawJSON);
		}catch(exception ex){
			return RemoteTKController.makeError(ex.getMessage(), 'APEX_EXCEPTION');
		}
	}


	public static string picklist(string obj, String fld){
  	Schema.SObjectType objType = Schema.getGlobalDescribe().get(obj);

    Schema.DescribeSObjectResult objDescribe = objType.getDescribe();       
 
    Map<String, Schema.SObjectField> fieldMap = objDescribe.fields.getMap(); 

    List<Schema.PicklistEntry> values = fieldMap.get(fld).getDescribe().getPickListValues();
            
	  List<String> optionsList = new List<String>();       
	    for (Schema.PicklistEntry a : values)
  	  { 
    		optionsList.add(a.getValue());
    	}

    	Map<String, List<string>> result = new Map<String, List<string>>();
    	result.put(fld,optionsList);

    	return JSON.serialize(result);
   }

}