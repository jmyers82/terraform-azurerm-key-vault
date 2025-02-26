run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}

run "create_kv" {

  command = plan
  variables {
    region = "eastus"
    kv_name = "kv-hashitalks-${run.setup_rg.kv_pet_name_1}"
  }


}

run "create_bad_kv_region" {

  command = plan
  variables {
    region = "sanfran"
    kv_name = "kv-hashitalks-${run.setup_rg.kv_pet_name_2}"
  }

  expect_failures = [var.region]

}

# run "create_bad_sa_name_length" {
#   command = plan
#   variables {
#     sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}1234567890"
#     location                 = "eastus"
#     account_tier             = "Premium"
#     account_replication_type = "GRS"
#     environment              = "dev"
#     cost_center              = "IT"
#     rg_name                  = run.setup_rg.rg_name
#   }

#   expect_failures = [var.sa_name]

# }

# run "create_bad_sa_location" {
#   command = plan
#   variables {
#     sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
#     location                 = "EuropeWest"
#     account_tier             = "Premium"
#     account_replication_type = "LZRS"
#     environment              = "dev"
#     cost_center              = "IT"
#     rg_name                  = run.setup_rg.rg_name
#   }

#   expect_failures = [var.location]

# }

# run "create_bad_sa_combo" {
#   command = plan
#   variables {
#     sa_name                  = "hashitalkbasic${run.setup_rg.sa_pet_name}"
#     location                 = "EuropeWest"
#     account_tier             = "Premium"
#     account_replication_type = "LZRS"
#     environment              = "uat"
#     cost_center              = "IT"
#     rg_name                  = run.setup_rg.rg_name
#   }

#   expect_failures = [var.environment, var.location]

# }