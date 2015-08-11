# encoding: utf-8
module SamlIdp
  module Default

    NAME_ID_FORMAT = "urn:oasis:names:tc:SAML:1.1:nameid-format:emailAddress"

    X509_CERTIFICATE = ENV["SAML_CERTIFICATE"]
    FINGERPRINT = ENV["SAML_FINGERPRINT"]
    SECRET_KEY = ENV["SAML_SECRET_KEY"]
  end
end