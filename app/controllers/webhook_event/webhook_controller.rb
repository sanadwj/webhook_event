module WebhookEvent
  class WebhookController < ActionController::Base
    if Rails.application.config.action_controller.default_protect_from_forgery
      skip_before_action :verify_authenticity_token
    end

    def event
      event = JSON.parse(verified_event, object_class: OpenStruct)
      WebhookEvent.instrument(event)
      head :ok
    rescue StandardError => e
      log_error(e)
      head :bad_request
    end

    private

    def verified_event
      payload          = request.body.read
      signature        = request.headers["authorization"]
      if WebhookEvent.signing_secret == signature
        return payload
      else
        raise "Signature mismatch"
      end
      
    end

    def log_error(e)
      logger.error e.message
      e.backtrace.each { |line| logger.error "  #{line}" }
    end
  end
end
