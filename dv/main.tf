terraform {
    required_providers {
    // named davinci for now until merged to actual pingone provider
    davinci = {
      source  = "samir-gandhi/davinci"
    }
  }
}
resource "davinci_flow" "initial_flow" {
  flow_json = file("./default_flow.json")
  deploy    = true
}

# data "davinci_connections" "all"{
# }

# resource "davinci_application" "use_default_flow"{
#   name = "PingOne SSO Connection"
#   oauth {
#       enabled = true
#       values  {
#           allowed_grants = ["authorizationCode"]
#           allowed_scopes = ["openid", "profile"]
#           enabled = true
#           enforce_signed_request_openid = false
#           redirect_uris = ["https://auth.pingone.com/0a705251-36f8-4417-9f0b-4ad79e2b199c/rp/callback/openid_connect"]
#         }
#     }
#   policies {
#       name = "PingOne - Sign On and Password Reset"
#       policy_flows{
#           flow_id = "ee71ddaab11eff16510826f2b0734a3e"
#           version_id = -1
#           weight = 100
#         }
#     }
#   saml {
#     values {
#       enabled                = false
#       enforce_signed_request = false
#     }
#   }
# }

# resource "davinci_connection" "variables" {
#     connector_id = "variablesConnector"
#     name = "Variables"
# }
# resource "davinci_connection" "token_management" {
#     connector_id = "skOpenIdConnector"
#     name = "Token Management"
# }
# resource "davinci_connection" "user_policy" {
#     connector_id = "userPolicyConnector"
#     name = "User Policy"
# }
# resource "davinci_connection" "error_customize" {
#     connector_id = "errorConnector"
#     name = "Error Customize"
# }
# resource "davinci_connection" "http" {
#     connector_id = "httpConnector"
#     name = "Http"
# }
# resource "davinci_connection" "annotation" {
#     connector_id = "annotationConnector"
#     name = "Annotation"
# }
# resource "davinci_connection" "ping_one_sso" {
#     connector_id = "pingOneSSOConnector"
#     name = "PingOne"
#       properties{
#           name = "clientId"
#           value = "350e93c3-fe9e-4ad3-b411-ed1923aa100f"
#         }

#       properties  {
#           name = "clientSecret"
#           value = "9p2vxpzfksFVdTta_049~HfGzzLFgaBydiZ3ngeqJ1xwRsWlDL_vwbA~G7z.nj6E"
#         }

#       properties {
#           name = "envId"
#           value = "0a705251-36f8-4417-9f0b-4ad79e2b199c"
#         }

#       properties{
#           name = "region"
#           value = "NA"
#         }

# }
# resource "davinci_connection" "functions" {
#     connector_id = "functionsConnector"
#     name = "Functions"
# }
# data "davinci_connection" "functions" {
#     connector_id = resource.davinci_connection.functions.connector_id
# }