# frozen_string_literal: true

module Notion
  module Errors
    # Collect all http errors
    class HttpError < ::Faraday::Error
      attr_reader :response

      def initialize(code, message, response = nil)
        super("Code: #{code}, Message: \"#{message}\"")
        @response = response
      end
    end

    # A unified client error for timeouts
    class TimeoutError < HttpError; end

    # Raised by middlewares that parse the response, like the JSON response middleware.
    class ParsingError < HttpError; end

    # Notion Error: https://developers.notion.com/reference/status-codes

    # The request body could not be decoded as JSON.
    class InvalidJsonError < HttpError; end

    # The request URL is not valid.
    class InvalidRequestUrlError < HttpError; end

    # This request is not supported.
    class InvalidRequestError < HttpError; end

    # The request body does not match the schema for the expected parameters.
    # Check the "message" property for more details.
    class ValidationError < HttpError; end

    # The request is missing the required Notion-Version header. See Versioning.
    class MissingVersionError < HttpError; end

    # The bearer token is not valid.
    class UnauthorizedError < HttpError; end

    # Given the bearer token used, the client doesn't have permission to perform this operation.
    class RestrictedResourceError < HttpError; end

    # Given the bearer token used, the resource does not exist.
    # This error can also indicate that the resource has not been shared with owner of the bearer token.
    class ObjectNotFoundError < HttpError; end

    # The transaction could not be completed, potentially due to a data collision.
    # Make sure the parameters are up to date and try again.
    class ConflictError < HttpError; end

    # This request exceeds the number of requests allowed. Slow down and try again. More details on rate limits.
    class RateLimitedError < HttpError; end

    # An unexpected error occurred. Reach out to Notion support.
    class InternalServerError < HttpError; end

    # Notion is unavailable. Try again later.
    # This can occur when the time to respond to a request takes longer than 60 seconds, the maximum request timeout.
    class ServiceUnavailableError < HttpError; end

    # Notion's database is unavailable or in an unqueryable state. Try again later.
    class DatabaseConnectionUnavailableError < HttpError; end

    # Notion timed out while attempting to complete this request. Please try again later.
    class GatewayTimeoutError < HttpError; end

    NOTION_ERROR_CODES = {
      "invalid_json" => InvalidJsonError,
      "invalid_request_url" => InvalidRequestUrlError,
      "invalid_request" => InvalidRequestError,
      "validation_error" => ValidationError,
      "missing_version" => MissingVersionError,
      "unauthorized" => UnauthorizedError,
      "restricted_resource" => RestrictedResourceError,
      "object_not_found" => ObjectNotFoundError,
      "conflict_error" => ConflictError,
      "rate_limited" => RateLimitedError,
      "internal_server_error" => InternalServerError,
      "service_unavailable" => ServiceUnavailableError,
      "database_connection_unavailable" => DatabaseConnectionUnavailableError,
      "gateway_timeout" => GatewayTimeoutError
    }.freeze
  end
end
