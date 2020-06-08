output "bastion_public_ip" { 
  value = aws_instance.bastion.public_ip
}

output "backend_dynamodb_tablename" {
  value = module.terraform_state_backend.dynamodb_table_name
}

output "backend_s3_bucketname" {
  value = module.terraform_state_backend.s3_bucket_id
}