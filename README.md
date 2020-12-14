# AWS-Design


1)	Following are required to setup for data migration 
a)	AWS subscription and domain ownership verification
b)	Configure on-prem router or switch for cloud connectivity. Speak to your internet service provider to allow you to enable connectivity to the cloud.
c)	Service accounts are required for direct connect to establish the connection. I did not put the secondary or failover connectivity. Best practice primary is direct connection and secondary VPN can be configured.
d)	Multiple internet service providers to support failover and failback in case of internet connection fails.
e)	Data can be migrated to EC2 or S3 storage. Data can be backed up daily basis, from there to various storage depends on the customer requirement. For long term basis data can be archived into glacier.


2)	Data flow architecture, events Data dashboard 
a)	Step 1: The main flow of events starts with an AWS Step Functions state machine. This state machine defines the steps in the data workflow. Schedule job can be triggered through Amazon CloudWatch.
b)	Step 2: Execution progresses, it invokes the ETL data flow jobs. As shown in the diagram, the invocation happens indirectly through AWS Lambda functions. 
c)	Step 3: AWS Glue Runner Function in the diagram. You can use this to orchestrate AWS Glue jobs. Amazon Athena, Amazon EMR, and AWS Glue, the accompanying code sample to use single data job or multiple job runners can be defined.
d)	Step 4: Execution progress invoked by activity tasks in Step Functions. Because of the way AWS Step Functions’ activity tasks work, it needs to run periodically poll the AWS Step Functions state machine for tasks. The state machine responds by providing a Task object. The Task object contains inputs which enable to run the data flow job.
e)	Step 5: As soon as an ETL Runner receives a task, it starts the respective ETL job. An ETL Runner maintains a state of active jobs in an Amazon DynamoDB table. Periodically, the ETL Runner checks the status of active jobs. When an active ETL job completes, the ETL Runners notifies the AWS Step Functions state machine. This allows the ETL workflow in AWS Step Functions to proceed to the next step.
f)	Step 6: the ETL Runner – is an AWS Lambda function that gets triggered on a schedule using CloudWatch Events. A CloudWatch Events event handler is then configured on an Amazon S3 bucket, so that when Sales or Marketing dataset files are uploaded to the bucket, Amazon S3 invokes an AWS Lambda function. The Lambda function then signals the waiting state machine to exit the activity task corresponding to the uploaded dataset. The subsequent ETL job is then invoked by the state machine. 



Comment


I did not make much changes to the terraform files, I only started working on Terraform about 3 months now. Currently we are using terraform to deploy the servers on to the vSphere onprem. very basic python scripts that we use in the automation. In my team we do have python developers to help us if we need anything.
If i qualify for this position i am willing to learn and i am a quick learner as well.
I completed my AWS SAA-02 recently and I am aware that there is a lot to learn.I am very much successful in every challenge that I take in my career path.
