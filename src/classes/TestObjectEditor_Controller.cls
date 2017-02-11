public with sharing class TestObjectEditor_Controller {
	public TestObjectEditor_Controller() {
		
	}

	/*
		if (recordId == null) {
			SObject newRecord = new TestObject__c();
			newRecord.put('TestField__c', testFieldValue);
			insert newRecord;
			return newRecord;
		} else {
			SObject record = new TestObject__c();
			record.put('Id', recordId);
			record.put('TestField__c', testFieldValue);
			update record;
			return record;
		}
	*/
	@RemoteAction
	public static SObject saveTestObject(Id recordId, String testFieldValue) {
		SObject record = new TestObject__c();
		record.put('TestField__c', testFieldValue);
		if (recordId != null) {
			record.put('Id', recordId);
		}
		upsert record;
		return record;
	}

	@RemoteAction
	public static SObject loadTestObject(Id recordId) {
		return [SELECT Id, TestField__c FROM TestObject__c WHERE Id =: recordId];
	}
}