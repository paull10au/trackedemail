/**
 *      
     Author:         Paul Lucas
     Company:        Salesforce
     Description:    qsyd_SendTrackedEmailBaseTest
     Date:           18-Nov-2018

     History:
     When           Who                 What

     TODO:
 */

@IsTest
public with sharing class qsyd_SendTrackedEmailBaseTest {

    private static final String ACCOUNT = 'Account';
    private static final String CONTACT = 'Contact';
    private static final String USER = 'User';



    private static final String CASE_EXAMPLE = '5004P00000XFXikQAH';
    private static final String EMAIL_EXAMPLE = '02s4P00000hQIpzQAG';
    private static final String ORGWIDEEMAILADDRESS_EXAMPLE = '0D24P000002AHEMSA4';


    @TestSetup
    private static void setupTestData() {
    }

    @IsTest
    private static void initialiseSetupTestData() {

    }

    @IsTest
    private static void given_staticMethodsAreCalled_when_parametersArePassed_then_parametersArePassedThrough() {
        // Initialise testing data
        initialiseSetupTestData();

        Test.startTest();

        qsyd_SendTrackedEmailBase.newEmailMessage(false);
        qsyd_SendTrackedEmailBase.setFileAttachments(new List<Messaging.EmailFileAttachment>());
        qsyd_SendTrackedEmailBase.setReferences('example email thread reference');
        qsyd_SendTrackedEmailBase.setOrgWideEmailAddressId(ORGWIDEEMAILADDRESS_EXAMPLE);


//        Integer invocations = Limits.getEmailInvocations();
//
//        // Assert an email was sent
//        System.assertEquals(1, invocations);

        Test.stopTest();
    }

//    @IsTest
//    private static void given_anOrgWideEmailAddressDoesNotExist_when_anOrgWideEmailIsQueried_then_anExceptionIsThrown() {
//        qsyd_SendTrackedEmailAction.SendTrackedEmailParam param = new qsyd_SendTrackedEmailAction.SendTrackedEmailParam();
//        List<qsyd_SendTrackedEmailAction.SendTrackedEmailParam> params = new List<qsyd_SendTrackedEmailAction.SendTrackedEmailParam>();
//        Integer exceptions = 0;
//
//        // Initialise testing data
//        initialiseSetupTestData();
//
//        Test.startTest();
//
//        param.toAddress = 'plucas@salesforce.com';
//        param.bodyPlainText = 'plain text body';
//        param.orgWideEmailAddress = 'non_existent_email@salesforce.com';
//        params.add(param);
//
//        try {
//            List<qsyd_TrackedEmailResult> results = qsyd_SendTrackedEmailAction.sendEmail(params);
//        } catch (Exception e) {
//            exceptions++;
//        }
//
//        // Assert an exception was thrown
//        System.assertEquals(1, exceptions);
//
//        Test.stopTest();
//    }
}