/**
 * @description       : Constant class is Used for avoiding hard code
 * @author            : Souvik Sen
 * @group             : 
 * @last modified on  : 01-02-2025
 * @last modified by  : Souvik Sen
**/
public class AssignmentsConstants {


    //*****  QN-3 Candidate Welcome Email *****/
    public final static String CANDIDATE_WELCOME_EMAIL ='Candidate Welcome Email';

    //****  QN-8 Interview-Scheduling-Automation *****//
    public final static Integer BATCH_SIZE = 200;
    public final static Integer INACTIVE_DAYS_THRESHOLD = -31;
    public final static Integer NOT_SELECTED_DAYS_THRESHOLD =-15;
    public final static String CRON_EXPRESSION='0 0 0 * * ?';
    public final static String JOB_UPDATE_NOTIFICATION ='Daily Job Application Status Update';
    public final static String STATUS_APPLIED = 'Applied';
    public final static String STATUS_INTERVIEWED = 'Interviewed';
    public final static String STATUS_INACTIVE = 'Inactive';
    public final static String STATUS_NOT_SELECTED = 'Not Selected';
    public final static String STATUS_WITHDRAWN = 'Withdrawn';
    public final static String EXPECTED_JOB_APPLICATIONS_MESSAGE ='Expected 3 job applications to have their status updated';
    public final static String DAILY_JOB_NAME ='Daily Job Application Status Update';
    public final static String EXPECTED_JOB_SCHEDULE_MESSAGE ='Expected the job to be scheduled';
}
