terraform {
    required_providers {
    // named davinci for now until merged to actual pingone provider
    davinci = {
      source  = "samir-gandhi/davinci"
    }
    pingone = {
      source  = "pingidentity/pingone"
    }
  }
}

provider "davinci" {
  username = var.dv_username
  password = var.dv_password
  company_id = resource.pingone_environment.temp_tf_trial.id
  base_url = var.dv_base_url
  pingone_target_environment = var.pingone_admin_environment
  pingone_admin_environment = var.pingone_admin_environment
}

provider "pingone" {
  client_id      = var.client_id
  client_secret  = var.client_secret
  environment_id = var.environment_id
  region         = var.region

  force_delete_production_type = false
}

resource "pingone_environment" "temp_tf_trial" {
  name        = "Terraform Demo"
  description = "My new environment"
  type        = "SANDBOX"
  license_id  = var.license_id

  default_population {
    name        = "My Population"
    description = "My new population for users"
  }

  service {
    type = "SSO"
  }
  service {
    type = "MFA"
  }
  service {
    type = "Risk"
  }
  service {
    type = "DaVinci"
  }

}

data "pingone_role" "identity_data_admin" {
  name = "Identity Data Admin"
}

resource "pingone_role_assignment_user" "admin_sso" {
  environment_id = var.environment_id
  user_id        = var.admin_user_id
  role_id        = data.pingone_role.identity_data_admin.id
  scope_environment_id = resource.pingone_environment.temp_tf_trial.id
}

module "davinci_flow" {
  source = "./dv"
  depends_on = [
    pingone_role_assignment_user.admin_sso
  ]
}