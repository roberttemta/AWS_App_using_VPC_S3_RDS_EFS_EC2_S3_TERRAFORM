
terraform {
  backend "s3" {
    bucket         = "utc-app1-backend-w7"
    key            = "app-utc/terrform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "utc-app1-locktable"
    //dynamodb_table = "utc-app2-lock-table"
    //dynamodb_table = "utc-app2-lock-table"



  }
}

/*
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}
*/
# To modify the backend, you need to provide the path to new backend as done above
# Then run a terraform init -reconfigure, to reconfigure the backend.