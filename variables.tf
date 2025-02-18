variable "create_vpc" {
  description = "Controls if VPC should be created (it affects almost all resources)"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "sudo-vpc"
}

variable "cidr" {
  description = "(Optional) The IPv4 CIDR block for the VPC. CIDR can be explicitly set or it can be derived from IPAM using `ipv4_netmask_length` & `ipv4_ipam_pool_id`"
  type        = string
  default     = "0.0.0.0/0"
}

variable "use_ipam_pool" {
  description = "Determines whether IPAM pool is used for CIDR allocation"
  type        = bool
  default     = false
}

variable "ipv4_ipam_pool_id" {
  description = "(Optional) The ID of an IPv4 IPAM pool you want to use for allocating this VPC's CIDR."
  type        = string
  default     = null
}

variable "ipv4_netmask_length" {
  description = "(Optional) The netmask length of the IPv4 CIDR you want to allocate to this VPC. Requires specifying a ipv4_ipam_pool_id."
  type        = number
  default     = null
}

variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block."
  type        = bool
  default     = false
}

variable "ipv6_cidr" {
  description = "(Optional) IPv6 CIDR block to request from an IPAM Pool. Can be set explicitly or derived from IPAM using `ipv6_netmask_length`."
  type        = string
  default     = null
}

variable "ipv6_ipam_pool_id" {
  description = "(Optional) IPAM Pool ID for a IPv6 pool. Conflicts with `assign_generated_ipv6_cidr_block`."
  type        = string
  default     = null
}

variable "ipv6_netmask_length" {
  description = "(Optional) Netmask length to request from IPAM Pool. Conflicts with `ipv6_cidr_block`. This can be omitted if IPAM pool as a `allocation_default_netmask_length` set. Valid values: `56`."
  type        = number
  default     = null
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

# SUDO: Should be set to true, since most services require this
variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_tags" {
  description = "Additional tags for the VPC"
  type        = map(string)
  default     = {}
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "one_nat_gateway_per_az" {
  description = "Should be true if you want only one NAT Gateway per availability zone. Requires `var.azs` to be set, and the number of `public_subnets` created to be greater than or equal to the number of availability zones specified in `var.azs`."
  type        = bool
  default     = false
}

variable "azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = []
}

variable "map_public_ip_on_launch" {
  description = "Should be false if you do not want to auto-assign public IP on launch"
  type        = bool
  default     = true
}

variable "public_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on public subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = false
}

variable "public_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 public subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(string)
  default     = []
}

variable "public_subnet_names" {
  description = "Explicit values to use in the Name tag on public subnets. If empty, Name tags are generated."
  type        = list(string)
  default     = []
}

variable "public_subnet_suffix" {
  description = "Suffix to append to public subnets name"
  type        = string
  default     = "public"
}

variable "public_subnet_tags" {
  description = "Additional tags for the public subnets"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "private_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on private subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "private_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 private subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(string)
  default     = []
}

variable "private_subnet_names" {
  description = "Explicit values to use in the Name tag on private subnets. If empty, Name tags are generated."
  type        = list(string)
  default     = []
}

variable "private_subnet_suffix" {
  description = "Suffix to append to private subnets name"
  type        = string
  default     = "private"
}

variable "private_subnet_tags" {
  description = "Additional tags for the private subnets"
  type        = map(string)
  default     = {}
}

variable "igw_tags" {
  description = "Additional tags for the internet gateway"
  type        = map(string)
  default     = {}
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = false
}

variable "nat_eip_tags" {
  description = "Additional tags for the NAT EIP"
  type        = map(string)
  default     = {}
}

variable "reuse_nat_ips" {
  description = "Should be true if you don't want EIPs to be created for your NAT Gateways and will instead pass them in via the 'external_nat_ip_ids' variable"
  type        = bool
  default     = false
}

variable "external_nat_ip_ids" {
  description = "List of EIP IDs to be assigned to the NAT Gateways (used in combination with reuse_nat_ips)"
  type        = list(string)
  default     = []
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}

variable "nat_gateway_tags" {
  description = "Additional tags for the NAT gateways"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_destination_cidr_block" {
  description = "Used to pass a custom destination route for private NAT Gateway. If not specified, the default 0.0.0.0/0 is used as a destination route."
  type        = string
  default     = "0.0.0.0/0"
}


variable "public_route_table_tags" {
  description = "Additional tags for the public route tables"
  type        = map(string)
  default     = {}
}

variable "create_igw" {
  description = "Controls if an Internet Gateway is created for public subnets and the related routes that connect them."
  type        = bool
  default     = true
}

variable "private_route_table_tags" {
  description = "Additional tags for the private route tables"
  type        = map(string)
  default     = {}
}

variable "secondary_cidr_blocks" {
  description = "List of secondary CIDR blocks to associate with the VPC to extend the IP Address pool"
  type        = list(string)
  default     = []
}

# SUDO: Default is set to true
variable "manage_default_security_group" {
  description = "Should be true to adopt and manage default security group"
  type        = bool
  default     = true
}


variable "default_security_group_name" {
  description = "Name to be used on the default security group"
  type        = string
  default     = null
}

variable "default_security_group_ingress" {
  description = "List of maps of ingress rules to set on the default security group"
  type        = list(map(string))
  default     = []
}

variable "default_security_group_egress" {
  description = "List of maps of egress rules to set on the default security group"
  type        = list(map(string))
  default     = []
}

variable "default_security_group_tags" {
  description = "Additional tags for the default security group"
  type        = map(string)
  default     = {}
}

variable "enable_flow_log" {
  type        = bool
  description = "(optional) Enable Flow lgos. Default: true"
  default     = true
}

variable "create_flow_log_cloudwatch_log_group" {
  type        = bool
  description = "(optional) Create Flow Log CloudWatch Log Group. Default: true"
  default     = true
}

variable "create_flow_log_cloudwatch_iam_role" {
  type        = bool
  description = "(optional) Create Flow Log CloudWatch IAM Role. Default: true"
  default     = true
}

# variable "create_flow_log_cloudwatch_iam_role" {
#   type = number
#   description = "(optional) Flowlog max aggregation interval. Default: 60"
#   default = 60
# }

variable "vpc_flow_log_tags" {
  description = "(optional) Additional tags for the VPC Flow Logs"
  type        = map(string)
  default     = {}
}

variable "vpc_flow_log_permissions_boundary" {
  description = "{90tional) The ARN of the Permissions Boundary for the VPC Flow Log IAM Role"
  type        = string
  default     = null
}

# TODO: Apply SUDO best practices
variable "flow_log_traffic_type" {
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. Default: REJECT"
  type        = string
  default     = "REJECT"
}

variable "flow_log_destination_type" {
  description = "Type of flow log destination. Can be s3 or cloud-watch-logs. Default: cloud-watch-logs"
  type        = string
  default     = "cloud-watch-logs"
}

variable "flow_log_log_format" {
  description = "The fields to include in the flow log record, in the order in which they should appear."
  type        = string
  default     = null
}

variable "flow_log_destination_arn" {
  description = "(optional) The ARN of the CloudWatch log group or S3 bucket where VPC Flow Logs will be pushed. If this ARN is a S3 bucket the appropriate permissions need to be set on that bucket's policy. When create_flow_log_cloudwatch_log_group is set to false this argument must be provided."
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_iam_role_arn" {
  description = "(optional) The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group. When flow_log_destination_arn is set to ARN of Cloudwatch Logs, this argument needs to be provided."
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_log_group_name_prefix" {
  description = "(optional) Specifies the name prefix of CloudWatch Log Group for VPC flow logs."
  type        = string
  default     = "/aws/vpc-flow-log/"
}

variable "flow_log_cloudwatch_log_group_name_suffix" {
  description = "(optional) Specifies the name suffix of CloudWatch Log Group for VPC flow logs."
  type        = string
  default     = ""
}

variable "flow_log_cloudwatch_log_group_retention_in_days" {
  description = "(optional) Specifies the number of days you want to retain log events in the specified log group for VPC flow logs."
  type        = number
  default     = null
}

variable "flow_log_cloudwatch_log_group_kms_key_id" {
  description = "(optional) The ARN of the KMS Key to use when encrypting log data for VPC flow logs."
  type        = string
  default     = null
}

variable "flow_log_max_aggregation_interval" {
  description = "(optional) The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: `60` seconds or `600` seconds."
  type        = number
  default     = 600
}

variable "enable_vpn_gateway" {
  description = "(optional) Set it to true if you want to create new vpn gateway. Default: false"
  type        = bool
  default     = false
}

variable "vpn_gateway_id" {
  description = "(optional) Provide the ID of existing VPN gateway to attach to VPC"
  type        = string
  default     = ""
}

variable "amazon_side_asn" {
  description = "(optional) Provide ASN for the gateway. Default: 64512"
  type        = string
  default     = "64512"
}

variable "vpn_gateway_tags" {
  description = "(optional) Additional tags for the VPN gateway"
  type        = map(string)
  default     = {}
}

variable "customer_gateways" {
  description = "(optional) Maps of Customer Gateways"
  type        = map(map(any))
  default     = {}
}

variable "customer_gateway_tags" {
  description = "(optional) Customer Gateway additional tags"
  type        = map(string)
  default     = {}
}

variable "vpn_gateway_az" {
  description = "VPN Gateway Availability Zone"
  type        = string
  default     = null
}

variable "propagate_intra_route_tables_vgw" {
  description = "(optional) Set to true to enable route table propogation. Default: false"
  type        = bool
  default     = false
}

variable "propagate_private_route_tables_vgw" {
  description = "(optional) Set to true to enable route table propogation. Default: false"
  type        = bool
  default     = false
}

variable "propagate_public_route_tables_vgw" {
  description = "(optional) Set to true to enable route table propogation. Default: false"
  type        = bool
  default     = false
}


variable "manage_default_vpc" {
  description = "(optional) Manage Default VPC. Default: false"
  type        = bool
  default     = false
}

variable "default_vpc_name" {
  description = "(optional) Default VPC Name. Default: null"
  type        = string
  default     = null
}

variable "default_vpc_enable_dns_support" {
  description = "(optional) Set to true to enable Default VPC DNS Support. Default: true"
  type        = bool
  default     = true
}

variable "default_vpc_enable_dns_hostnames" {
  description = "(optional) Set to true to enable Default VPC DNS Hostname. Default: true"
  type        = bool
  default     = false
}

# tflint-ignore: terraform_unused_declarations
variable "default_vpc_enable_classiclink" {
  description = "Backward compatibility only, not used."
  type        = bool
  default     = false
}

variable "default_vpc_tags" {
  description = "(optional) Default VPC tags. Default: {}"
  type        = map(string)
  default     = {}
}

variable "manage_default_network_acl" {
  description = "(optional) Default network ACL management. Default: false"
  type        = bool
  default     = false
}




## Add Database compatibility variables to keep it compatible with the existing module.
variable "database_subnets" {
  description = "A list of database subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "database_subnet_assign_ipv6_address_on_creation" {
  description = "Assign IPv6 address on database subnet, must be disabled to change IPv6 CIDRs. This is the IPv6 equivalent of map_public_ip_on_launch"
  type        = bool
  default     = null
}

variable "database_subnet_ipv6_prefixes" {
  description = "Assigns IPv6 database subnet id based on the Amazon provided /56 prefix base 10 integer (0-256). Must be of equal length to the corresponding IPv4 subnet list"
  type        = list(string)
  default     = []
}

variable "database_subnet_names" {
  description = "Explicit values to use in the Name tag on database subnets. If empty, Name tags are generated."
  type        = list(string)
  default     = []
}

variable "database_subnet_suffix" {
  description = "Suffix to append to database subnets name"
  type        = string
  default     = "database"
}

variable "database_subnet_tags" {
  description = "Additional tags for the database subnets"
  type        = map(string)
  default     = {}
}
variable "create_database_subnet_group" {
  description = "Controls if database subnet group should be created (n.b. database_subnets must also be set)"
  type        = bool
  default     = true
}
variable "database_subnet_group_tags" {
  description = "Additional tags for the database subnet group"
  type        = map(string)
  default     = {}
}
variable "database_subnet_group_name" {
  description = "Name to be used on the database subnet group"
  type        = string
  default     = null
}

variable "database_route_table_tags" {
  description = "Additional tags for the database route tables"
  type        = map(string)
  default     = {}
}
variable "create_database_subnet_route_table" {
  description = "Controls if separate route table for database should be created"
  type        = bool
  default     = false
}

variable "create_database_internet_gateway_route" {
  description = "Controls if an internet gateway route for public database access should be created"
  type        = bool
  default     = false
}

variable "create_database_nat_gateway_route" {
  description = "Controls if a nat gateway route should be created to give internet access to the database subnets"
  type        = bool
  default     = false
}

variable "create_egress_only_igw" {
  description = "Controls if an Egress Only Internet Gateway is created and its related routes."
  type        = bool
  default     = true
}
variable "database_dedicated_network_acl" {
  description = "Whether to use dedicated network ACL (not default) and custom rules for database subnets"
  type        = bool
  default     = false
}
