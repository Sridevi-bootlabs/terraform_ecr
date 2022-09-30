resource "aws_ecr_repository" "ecr" {
  name = var.name
  image_tag_mutability = var.image_tag_mutability
 
  encryption_configuration{
    encryption_type = var.encryption_type
  }
  
  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
  
}
resource "aws_ecr_repository_policy" "ecrpolicy" {
  repository = aws_ecr_repository.ecr.name
  policy = <<EOF
  {
    "Version": "2008-10-17",
    "Id": "ecr-kms-permissions",
    "Statement": [
        {
            "Sid": "new policy",
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "ecr:GetDownloadUrlForLayer",
                "ecr:BatchGetImage",
                "ecr:BatchCheckLayerAvailability",
                "ecr:PutImage",
                "ecr:InitiateLayerUpload",
                "ecr:UploadLayerPart",
                "ecr:CompleteLayerUpload",
                "ecr:DescribeRepositories",
                "ecr:GetRepositoryPolicy",
                "ecr:ListImages",
                "ecr:DeleteRepository",
                "ecr:BatchDeleteImage",
                "ecr:SetRepositoryPolicy",
                "ecr:DeleteRepositoryPolicy"
            ]
        }
    ]
}
EOF
}
