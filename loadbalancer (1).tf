#create load balance
resource "aws_lb" "sample_lb" {
    name               = var.alb_names
    internal           = false
    load_balancer_type = "application" 
    security_groups    = var.security_grp
    subnets            = var.subnets
    enable_cross_zone_load_balancing = "true"
}

# Make sure the SG provided is having access to HTTP and HTTPs
variable "security_grp" {
    type = list
    default = ["sg-0b782a3ae10c2a56f"]
}
# Mention the subnets
variable "subnets" {
    type = list
    default = ["subnet-0e4e5b67d28593d78","subnet-0cd2c4d1eb9769ab2","subnet-0692c92510708c88f"]
}

variable "alb_names" {
   type = string
   default = "terraform-lb-test"
}