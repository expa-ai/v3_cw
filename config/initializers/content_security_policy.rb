Rails.application.config.content_security_policy do |policy|
  # Get allowed domains from environment variable
  allowed_domains = ENV['CSP_ALLOWED_DOMAINS']&.split(',')&.map(&:strip) || []
  
  # Add localhost:3000 for cross-site development embedding
  development_domains = Rails.env.development? ? ["http://localhost:3000"] : []
  
  # policy.default_src :self, *allowed_domains, *development_domains
  # policy.font_src    :self, :data, *allowed_domains, *development_domains
  # policy.img_src     :self, :data, *allowed_domains, *development_domains
  # policy.object_src  :none
  # policy.script_src  :self, *allowed_domains, *development_domains
  # policy.style_src   :self, *allowed_domains, *development_domains
  # policy.media_src   :self, :blob, *allowed_domains, *development_domains
  policy.frame_src   :self, *allowed_domains, *development_domains
  policy.frame_ancestors   :self, *allowed_domains, *development_domains
end