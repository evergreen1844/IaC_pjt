prefix                  =       "user09"
vpcid                   =       "vpc-0759e33537933b639"
user09-public-id        =       "subnet-01f8dfe4bd8a5276d"


private_subnets         =       [
    {cidr = "10.9.2.0/24", availability_zone = "ap-northeast-2b"},
    {cidr = "10.9.3.0/24", availability_zone = "ap-northeast-2c"},
]
master_sg               =       "sg-0e7aa649691e457ab"

admin_access_cidrs      =       ["13.124.106.209/32"]

image_id                =       "ami-09f430fd0b1b0b1db"
instance_type           =       "t3.small"
keypair_name            =       "user09-key"

min_size                =       1
max_size                =       4
desired_capacity        =       1
