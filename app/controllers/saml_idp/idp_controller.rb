# encoding: utf-8
module SamlIdp
  class IdpController < ActionController::Base
    include SamlIdp::Controller

    unloadable unless Rails::VERSION::MAJOR >= 4

    protect_from_forgery

    before_filter :validate_saml_request

    def new
      render :template => "saml_idp/idp/new"
    end

    def create
      unless params[:username].blank? && params[:password].blank?
        person = idp_authenticate(params[:username], params[:password])
        if person.nil?
          @saml_idp_fail_msg = "Incorrect username or password."
        else
          @saml_response = idp_make_saml_response(person)
          render :template => "saml_idp/idp/saml_post", :layout => false
          return
        end
      end
      render :template => "saml_idp/idp/new" unless @redirect_path.present?
    end

    protected

      def idp_authenticate(username, password)
        raise "Not implemented"
      end

      def idp_make_saml_response(person)
        raise "Not implemented"
      end

  end
end
