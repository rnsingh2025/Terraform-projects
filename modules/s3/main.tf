# resource "aws_s3_bucket" "my_bucket" {
#   bucket = var.bucket_name
# lifecycle {
#     prevent_destroy = true
#   }
#   tags = {
#     Name = var.bucket_name
#   }
# }

# resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
#   bucket = aws_s3_bucket.my_bucket.id
#   versioning_configuration {
#     status = "Enabled"
#   }
# }
