class User < ApplicationRecord
    has_secure_password
    def record_signup
        token = SecureRandom.urlsafe_base64
        crypt_token = Digest::SHA1.hexdigest token.to_s
        self.remember_token = crypt_token
      end

      def authenticated?(remember_token)
        self.remember_token == remember_token
      end
    
      def record_signup
        token = SecureRandom.urlsafe_base64
        crypt_token = Digest::SHA1.hexdigest token.to_s
        self.remember_token = crypt_token
      end
end
