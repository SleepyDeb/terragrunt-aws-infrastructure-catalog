
unit "vpc" {
  source = "${values.catalog_url}/units/vpc-import?ref=${values.catalog_revision}"

  path = "vpc-import"

  values = {
    version = "main"

    vpc_id = lookup(values, "vpc_id", null) 
    default = lookup(values, "default_vpc", false)
  }
}
