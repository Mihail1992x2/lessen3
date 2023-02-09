terraform{
    backend "s3" {
        bucket = "my-dev-tf-state-buchet"
        key = "main"
        region = "eu-west-1"
        dynamodb_table = "my-dynamobd-table"
      
    }
}