# Updated same_site none to allow embedding in an iframe

Warden::Manager.after_set_user do |user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = { value: user.id, same_site: :none, secure: true }
  auth.cookies.signed["#{scope}.expires_at"] = { value: 30.minutes.from_now, same_site: :none, secure: true }
end

Warden::Manager.before_logout do |_user, auth, opts|
  scope = opts[:scope]
  auth.cookies.signed["#{scope}.id"] = { value: nil, same_site: :none, secure: true }
  auth.cookies.signed["#{scope}.expires_at"] = { value: nil, same_site: :none, secure: true }
end