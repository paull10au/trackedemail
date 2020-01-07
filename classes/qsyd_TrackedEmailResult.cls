/**
 *      
     Author:         Paul Lucas
     Company:        Salesforce
     Description:    qsyd_TrackedEmailResult
     Date:           20-Apr-2018
    
     History:
     When           Who                 What
    
     TODO:
 */

public with sharing class qsyd_TrackedEmailResult {
    @InvocableVariable
    @AuraEnabled
    public List<String> results;

    @InvocableVariable
    @AuraEnabled
    public Boolean success;

    public qsyd_TrackedEmailResult(List<String> errors) {

        this.results = errors;
        this.success = errors.isEmpty();
    }
}