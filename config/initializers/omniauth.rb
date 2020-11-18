OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
  { scope: 'public_profile,email',
    info_fields: 'id, name,first_name, middle_name,last_name,email,location',
    image_size: { width: 300, height: 300 },
    secure_image_url: true}
end
