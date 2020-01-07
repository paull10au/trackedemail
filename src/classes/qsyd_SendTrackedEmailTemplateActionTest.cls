/**
 *      
     Author:         Paul Lucas
     Company:        Salesforce
     Description:    qsyd_SendTrackedEmailTemplateActionTest
     Date:           18-Dec-2019

     History:
     When           Who                 What

     TODO:
 */

@IsTest
public with sharing class qsyd_SendTrackedEmailTemplateActionTest {

    private static final String ACCOUNT = 'Account';
    private static final String CONTACT = 'Contact';
    private static final String USER = 'User';

    private static final String CONTACT_EXAMPLE = '0034P00002PYwXAQA1';

    static EmailTemplate emailTemplate;

    @TestSetup
    private static void setupTestData() {

        // Insert an email template
        emailTemplate = new EmailTemplate(Body = 'Template body', Description = 'Test template', DeveloperName = 'TestTemplate', Name = 'Test Template', FolderId = UserInfo.getUserId(), TemplateType = 'text', IsActive = True);
        INSERT emailTemplate;

        System.debug('emailTemplate: ' + emailTemplate.Id);
    }

    @IsTest
    private static void initialiseSetupTestData() {
//        emailTemplate = [
//                SELECT Id
//                FROM EmailTemplate
//                WHERE DeveloperName = 'TestTemplate'
//                LIMIT 1
//        ][0];
    }

    @IsTest
    private static void given_requiredEmailParametersAreProvided_when_anEmailIsInstantiated_then_anEmailIsSent() {
        qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam param = new qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam();
        List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam> params = new List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam>();

        // Initialise testing data
        initialiseSetupTestData();

        Test.startTest();

        param.toAddress = 'plucas@salesforce.com';
        param.emailTemplate = 'Test Template';
        param.targetObjectId = CONTACT_EXAMPLE;
        params.add(param);

        List<qsyd_TrackedEmailResult> results = qsyd_SendTrackedEmailTemplateAction.sendEmail(params);
        Integer invocations = Limits.getEmailInvocations();

        // Assert an email was sent
        System.assertEquals(1, invocations);

        Test.stopTest();
    }

    @IsTest
    private static void given_anInvalidEmailIsSupplied_when_anEmailIsInstantiated_then_anEmailIsSentWithErrors() {
        qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam param = new qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam();
        List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam> params = new List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam>();
        Integer exceptions = 0;

        // Initialise testing data
        initialiseSetupTestData();

        Test.startTest();

        param.toAddress = 'plucas';
        param.emailTemplate = 'Test Template';
        param.targetObjectId = CONTACT_EXAMPLE;
        params.add(param);

        try {
            List<qsyd_TrackedEmailResult> results = qsyd_SendTrackedEmailTemplateAction.sendEmail(params);
        } catch (Exception e) {
            exceptions++;
        }

        // Assert an exception was thrown
        System.assertEquals(1, exceptions);

        Test.stopTest();
    }

    @IsTest
    private static void given_anInvalidTemplateIsSupplied_when_anEmailIsInstantiated_then_anExceptionIsThrown() {
        qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam param = new qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam();
        List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam> params = new List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam>();
        Integer exceptions = 0;

        // Initialise testing data
        initialiseSetupTestData();

        Test.startTest();

        param.toAddress = 'plucas@salesforce.com';
        param.emailTemplate = '';
        param.targetObjectId = CONTACT_EXAMPLE;
        params.add(param);

        try {
            List<qsyd_TrackedEmailResult> results = qsyd_SendTrackedEmailTemplateAction.sendEmail(params);
        } catch (Exception e) {
            exceptions++;
        }

        // Assert an exception was thrown
        System.assertEquals(1, exceptions);

        Test.stopTest();
    }

    @IsTest
    private static void given_anIncorrectEmailTemplateIsProvided_when_anEmailIsInstantiated_then_anExceptionIsThrown() {
        qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam param = new qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam();
        List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam> params = new List<qsyd_SendTrackedEmailTemplateAction.SendTrackedEmailParam>();
        Integer exceptions = 0;

        // Initialise testing data
        initialiseSetupTestData();

        Test.startTest();

        param.toAddress = 'plucas@salesforce.com';
        param.emailTemplate = 'Incorrect Template';
        param.targetObjectId = CONTACT_EXAMPLE;
        params.add(param);

        try {
            List<qsyd_TrackedEmailResult> results = qsyd_SendTrackedEmailTemplateAction.sendEmail(params);
        } catch (Exception e) {
            exceptions++;
        }

        // Assert an exception was thrown
        System.assertEquals(1, exceptions);

        Test.stopTest();
    }
}