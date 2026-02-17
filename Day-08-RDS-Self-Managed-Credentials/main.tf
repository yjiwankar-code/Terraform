resource "aws_db_instance" "name" {
allocated_storage = 10
identifier = "rds-test"
apply_immediately = true
db_name = "mydb"
engine = "mysql"
engine_version = "8.0"
instance_class = "db.t3.micro"
username = "admin"
password = "Cloud123"
db_subnet_group_name = aws_db_subnet_group.sub-grp.id
parameter_group_name = "default.mysql8.0"

#Enable backups and retention
backup_retention_period = 7
backup_window = "02:00-03:00"

#Enable monitoring (cloudwatch Enhanced Monitoring)
monitoring_interval = 60
monitoring_role_arn = aws_iam_role.rds_monitoring.arn

# #Enable performance insights
# performance_insights_enabled = true
# performance_insights_retention_period = 7

maintenance_window = "Sun:04:00-Sun:05:00"

deletion_protection = true

skip_final_snapshot = true

}



#IAM role for RDS inhanced monitoring
resource "aws_iam_role" "rds_monitoring" {
  name = "rds-monitoring-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = "monitoring.rds.amazonaws.com"
        },
        Action = "sts:AssumeRole"
      }
    ]
  })  
}

#IAM policy attachment for RDS monitoring
resource "aws_iam_role_policy_attachment" "rds_monitoring_attach" {
  role       = aws_iam_role.rds_monitoring.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonRDSEnhancedMonitoringRole"
}

data "aws_subnet" "subnet_1" {
  filter {
    name = "tag:Name"
    values = ["subnet-1"]
  }
}


data "aws_subnet" "subnet_2" {
  filter {
    name = "tag:Name"
    values = ["subnet-2"]
  }
}


resource "aws_db_subnet_group" "sub-grp" {
  name        = "mycutsubnet"
  subnet_ids  = [data.aws_subnet.subnet_1.id, data.aws_subnet.subnet_2.id]
  tags = {
    Name="my db sunet group"
  }
}

