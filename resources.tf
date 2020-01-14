resource "aws_vpc" "environment-example-two" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = "true"
    enable_dns_support = "true"
    tags = {
        Name = "MMartin terraform"
        Purpose = "MMartin terraform course"
        DeleteAfter = "2020-01-14"
    }
}

resource "aws_subnet" "subnet1" {
  cidr_block = cidrsubnet(aws_vpc.environment-example-two.cidr_block, 3, 1)
  vpc_id = aws_vpc.environment-example-two.id
  availability_zone = "us-east-2a"
  tags = {
        Name = "MMartin terraform"
        Purpose = "MMartin terraform course"
        DeleteAfter = "2020-01-14"
    }
}