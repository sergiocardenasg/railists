Rails.application.config.middleware.use OmniAuth::Builder do
    provider :developer
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end