module "exchange" {
  source = "./modules/exchange"
  domain = "${var.domain}"
  name   = "${var.name}"
  mx     = "${var.mx}"
}

module "mdm" {
  source = "./modules/mdm"
  domain = "${var.domain}"
  name   = "${var.name}"
}

module "skype" {
  source = "./modules/skype"
  domain = "${var.domain}"
  name   = "${var.name}"
}

module "verification" {
  source = "./modules/verification"
  domain = "${var.domain}"
  name   = "${var.name}"
  verify = "${var.verify}"
}