OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '358501600943922', 'e8ff8b355b71ac90fbc733d9be5f4aeb'
end