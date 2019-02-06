module Rails
  def self.stage
    # Review Apps inherit parent vars, so domain_name will be staging.pandanese.com...
    # Avoid that by checking for staging app first:
    if ENV["HEROKU_PARENT_APP_NAME"]
      ENV["HEROKU_APP_NAME"]
    elsif ENV["DOMAIN_NAME"] =~ /^staging\./
      "staging"
    else
      Rails.env
    end
  end
end
