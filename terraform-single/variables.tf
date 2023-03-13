variable "ssh_public_keys" {
  type = map(string)
  default = {
    ibmcloud   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDCyly3FFVRoMdqSyazb8mNJ3YTi73x8wF9ufv7Dktt8XEExMgIqkeHUy1MoOPrtdkH7eTspH0exFwRk1uunkAdX+c7dun4LPgcBHgl51/NVOHMMgQqe3L1j5mHgQOd8LjK/W7SPBg6Xi8CNCmFEjS5vSzLvPUYtbV50JIpLC2q2I3crIHbWF//TA4R6Dur38YE1hXT+5oUd2DG/pI1/Ug5CZEvDVbTYpyXnZcxQ5R8V1d4ek3CLueM2a8lPbzIqGskwbP3ashvKZV6vN13vkccKfrrLkBz/uwb/yslKwp6ka4iB4k82mRDAuNuYqKSfCCCvAUO2DidSYvqmPRJHPFTLb//uLlHG7ccUDOHWrFvywbzOCbEF78MJoFpLONF9IcMW9GregXvCFJPEg6+FCuvAVKNxlrKHvAht5ySvV3qIe0yvTH3FFz045Fw9zR7LRDy/3iajs65uTKJdNFROniB/V10rm8+np9nbiPKSP1IabtzHQIgpxnYGxqIwzK9Fks= jake@JNEWTONDT",
    roderick   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCsPBiC7mb1D7J6w2OGrCtG8oBnr+1sMX3AnD3dhwraKcefrSZT62P2VUOyNw4dvWMHYCGyAOS4pv5qpMar51aU+Y8IyZjFFRCvlL2IdsKWOAmTZgF3ZGw1nNuuDMxTqDT4I8KoZMff+jNUDVmSeZql4Lp0AdE2mc95c2bfcCn+i1C3tPBSpCC505gAFtjV10C2aqMkkBYpJaG+LeGZwc9EKioY/BpzgmlplBEjqKC3G3ADEFoA+lj2euMHk6cMBJsA6aAul/u9GIgiKm9Poiltk/ITfZ/XIATiWvDdU8hFGAcyGBScqo5JA+ZVoOer9VAAbGoPBIAXglr3GG28H9H4ZzLtBQcpHL7KZv9wZMs/6f7/nvSOLTczLLXQ6PKyiLO+EeBpVpvysltvXajy/DJ02+jNLURqKFjahyXnwSfmnCsNj0s5gbT/qDJatiNORQeeDu5KrXlbrXkctWwj/o8yFSTQoSBrXi6LKB7jb5RHKtf1nqLot5pj4hsgSnQVw/M= rbowser@rodericks-mbp.lan",
    tarasnew   = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCnA5Y5wQzgAFwD3v6AzIVhH9Uxw5WQcfBO3emCs6QDc0iznfJOcMH8iM8Bh9OH0g8OxJ/HilZXSxSES0govR/+7Pa5/xaM2cT1Ch0NkQrcVLYXKwAzDizdRq/ZV2pdXJCQovIvjOaCEQcbVpho93zuxDG8ybtRewAPtjfaFluywQrPB7QEP4kkmLdvvjqrzEqe6wyV5PUYDPkbT/B+eZ50Cwk2Nrbn0YvyYNZkVSBK9cf0CxplekoxGoD5GDngYNuDveMI75s9P+vRmGUashd5j6u9bRST7nofsZaxL2SrQZ1hLB1phLhEwSCe++zTxUpj0HkRMkEor5FGRs0ppG8/ihdMGyKJw6NGKOTY6gzHPw9OVqU9Hu3D5kqHhI/fstUC538DlTUiC3oajtzP7YwMTy8tOPdpwnWyYjCd/iOzlruhEiNC5zgRAFWeflPuK2cJwDzeK9+Vogr4c/HcI183z3qPUuvjV+0aBNru3gBOb1He9CXImqG3oo8eKIezE8s=",
    atytarchuk = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9Jq12hMO3Ik6GetVI0xLoflr6dO4GAmhTpK/RaW9gk5QL1Vgj7v2uYEJ/dBotOdcHCUO11AnBOzzk67UA1nTzken0ycsrRXT18/U29dAnUXoGunC3YrlC87TlCFr71cHUbC1GScxuK4GOhY7Ow+2yVm+sq/fKdvtV2bBCdyU9GlzHoWz9Byd8zY7EgQo5YUHP9uMuWxBS/KmO48jybl63XZsur7aftFCVW6qMux7GIsL8EuwtmIyuePOeWCK/JXgfX0O/ipq2eIvVld5MsxmqUcYxsSrpDykr/3mLn8Fff5Dd2yEP+UNxG1MYo5pB4p1RxoAB1AGNCE/XtgliCann"
  }
}

variable "os_type" {
  default = "zos"
}
variable "region" {
  default = "ca-tor"
}

variable "zone" {
  default = "1"
}

variable "vpc" {
  default = "terraform-test"
}

variable "subnetwork_name" {
  default = "terraform-test"
}

variable "total_ipv4_address_count" {
  default = 256
}

variable "vsi_name" {
  default = "terraform-test"
}

variable "image_name" {
  # Regular expresions allowed
  default = null # Default depends on os_type - see locals.tf
}

variable "profile" {
  default = null # Default depends on os_type - see locals.tf
}

variable "security_group_name" {
  default = "terraform-test"
}