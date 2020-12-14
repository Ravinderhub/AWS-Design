module "glue_job_default_artifact_py" {
  source       = "git::ssh://git..."
  filename     = "glue_job.py"
  #Fill in the rest of the terraform template needed
  command {
      script_location = "s3://${aws_s3_bucket.test_s3.bucket}/glue_job.py"
  
  }
}

module "glue_job_default_artifact_dependencies" {
  source       = "git::ssh://git..."
  filename     = "dependencies.zip"
  #Fill in the rest of the terraform template needed
    command {
    script_location = "s3://${aws_s3_bucket.test_s3.bucket}/dependencies.zip"
 
  }
}

module "glue_ingest" {
  source = "git::ssh://git..."

  job_name = "ingest-glue-job"

  #Fill in the rest of the terraform template needed
  }
  glue_connections_name = var.config["glue_connections_list"]
}

