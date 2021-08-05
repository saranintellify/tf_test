# Terraform Code

- Stores the backend in S3 with state locking in DynamoDB
- Deploy_VPC/main_vpc.tf creates the following

    1. VPC
    2. Internet Gateway
    3. Main route table (attached Internet Gateway)
    4. Private route table (No IGW attached) 
    5. Public subnet
    6. Private subnet
    7. Associates the public subnet to main route table
    8. Associates the private subnet to the private route table
