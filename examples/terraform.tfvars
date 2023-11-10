project_name       = "tf-validate-project"
environment        = "dev"
repo_owner         = "rakeshpb90"
repo_name           = "flask-demo-aws"
codestar_connection_arn = "arn:aws:codestar-connections:us-east-1:059234262850:connection/d8acf944-3677-4283-b9e1-2af09795cca0"
branch_name = "main"
create_new_repo    = true
repo_approvers_arn = "arn:aws:sts::059234262850:assumed-role/CodeCommitReview/*" #Update ARN (IAM Role/User/Group) of Approval Members
create_new_role    = true
#codepipeline_iam_role_name = <Role name> - Use this to specify the role name to be used by codepipeline if the create_new_role flag is set to false.
stage_input = [
  { name = "validate", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "SourceOutput", output_artifacts = "ValidateOutput" },
  { name = "plan", category = "Test", owner = "AWS", provider = "CodeBuild", input_artifacts = "ValidateOutput", output_artifacts = "PlanOutput" },
  { name = "approval", category = "Approval", owner = "AWS", provider = "Manual" },
  { name = "apply", category = "Build", owner = "AWS", provider = "CodeBuild", input_artifacts = "PlanOutput", output_artifacts = "ApplyOutput" },
]
build_projects = ["validate", "plan", "apply"]
