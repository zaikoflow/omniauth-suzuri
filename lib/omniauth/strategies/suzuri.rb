module OmniAuth
  module Strategies
    class Suzuri < OmniAuth::Strategies::OAuth2
      option :client_options, {
        site: 'https://suzuri.jp',
        authorize_url: '/oauth/authorize',
        token_url: '/oauth/token'
      }

      uid  { raw_info["id"] }

      info do
        {
          name:        raw_info["name"],
          displayName: raw_info["displayName"],
          avatarUrl:   raw_info["avatarUrl"]
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v1/user').parsed["user"] || {}
      end

      def callback_url
        full_host + script_name + callback_path
      end
    end
  end
end
