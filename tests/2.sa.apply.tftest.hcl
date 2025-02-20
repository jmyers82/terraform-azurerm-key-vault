run "setup_rg" {
  module {
    source = "./tests/setup"
  }
}

# run "create_kv_v1_0_0" {

#   command = apply
#   variables {
#     region = "eastus"
#     kv_name = "hashitalks-kv-${run.setup_rg.kv_pet_name_1}"
#   }
# }

# run "create_kv_v2_0_0" {

#   command = apply
  
#   variables {
#     region = "centralus"
#     kv_name = "hashitalks-kv-${run.setup_rg.kv_pet_name_2}"
#   }
# }