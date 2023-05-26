variable "region" {
  type = string
}

variable "webami" {
  type = string

}
variable "web-instance-type" {
  type = string
}

variable "appami" {
  type = string
}
variable "app-instance-type" {
  type = string
}
variable "vpc_cidr" {
  type = string
}

variable "subnet1-cidr" {
  type = string
}

variable "subnet2-cidr" {
  type = string
}

variable "subnet3-cidr" {
  type = string
}

variable "subnet4-cidr" {
  type = string
}

variable "subnet5-cidr" {
  type = string
}

variable "subnet6-cidr" {
  type = string
}

#--------------------------------------
# Database Variables
variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "instance-class" {
  type = string
}

variable "db-name" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type = string
}
