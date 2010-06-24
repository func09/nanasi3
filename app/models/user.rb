class User < TwitterAuth::GenericUser
  has_many :statuses
  # Extend and define your user model as you see fit.
  # All of the authentication logic is handled by the 
  # parent TwitterAuth::GenericUser class.
end
