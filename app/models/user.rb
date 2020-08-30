class User < ApplicationRecord
  has_secure_password

  enum role: [:reader, :admin]
end
