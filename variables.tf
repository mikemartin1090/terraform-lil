variable "newvariable" {
    type = "string"
    default = "thisisvalue"
}

variable "maptype" {
  type = "map"
  default {
      subnet1 = "subnet1"
      subnet2 = "subnet2"
      subnet3 = "subnet3"
  }
}

variable "listtype" {
  type = "list"
  default = ["item1", "item2"]
}
