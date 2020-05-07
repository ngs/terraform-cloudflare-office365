module "exchange" {
  source  = "./modules/exchange"
  zone_id = var.zone_id
  name    = var.name
  mx      = var.mx
}

module "mdm" {
  source  = "./modules/mdm"
  zone_id = var.zone_id
  name    = var.name
}

module "skype" {
  source  = "./modules/skype"
  zone_id = var.zone_id
  name    = var.name
}

module "verification" {
  source  = "./modules/verification"
  zone_id = var.zone_id
  name    = var.name
  verify  = var.verify
}
