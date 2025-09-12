Rails.application.config.permissions_policy do |f|
  # Get allowed domains from environment variable
  allowed_domains = ENV['CSP_ALLOWED_DOMAINS']&.split(',')&.map(&:strip) || []
  
  # Add localhost:3000 for cross-site development embedding
  development_domains = Rails.env.development? ? ["http://localhost:3000"] : []
  
  f.camera      :self, *allowed_domains, *development_domains
  f.gyroscope   :self, *allowed_domains, *development_domains
  f.microphone  :self, *allowed_domains, *development_domains
  f.usb         :self, *allowed_domains, *development_domains
  f.fullscreen  :self, *allowed_domains, *development_domains
  f.payment     :self, *allowed_domains, *development_domains
end
