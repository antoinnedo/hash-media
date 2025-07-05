# config/environments/development.rb

require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  config.logger = ActiveSupport::Logger.new(STDOUT)

  # Make code changes take effect immediately without server restart.
  config.enable_reloading = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing.
  config.server_timing = true

  # Enable/disable Action Controller caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.public_file_server.headers = { "cache-control" => "public, max-age=#{2.days.to_i}" }
  else
    config.action_controller.perform_caching = false
  end

  config.cache_store = :memory_store
  config.active_storage.service = :local

  # --- START: UNIFIED ACTION MAILER CONFIGURATION ---
  # This single block now controls all mailer settings.

  # Raise an error if the mailer can't send. This is essential for debugging.
  config.action_mailer.raise_delivery_errors = true

  # Actually attempt to deliver emails.
  config.action_mailer.perform_deliveries = true

  # Use the SMTP protocol to send mail.
  config.action_mailer.delivery_method = :smtp

  routes.default_url_options[:host] = 'localhost:3000'

  # Set the default host and port for links generated in emails.
  config.action_mailer.default_url_options = { host: "localhost", port: 3000 }

  # SMTP settings for connecting to Gmail.
  config.action_mailer.smtp_settings = {
    address:               'smtp.gmail.com',
    port:                  587,
    domain:                'gmail.com',
    user_name:             ENV['GMAIL_USERNAME'],
    password:              ENV['GMAIL_APP_PASSWORD'],
    authentication:        'plain',
    enable_starttls_auto:  true
  }
  # --- END: UNIFIED ACTION MAILER CONFIGURATION ---


  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true
  config.active_record.query_log_tags_enabled = true
  config.active_job.verbose_enqueue_logs = true

  # Annotate rendered view with file names.
  config.action_view.annotate_rendered_view_with_filenames = true

  # Raise error when a before_action's only/except options reference missing actions.
  config.action_controller.raise_on_missing_callback_actions = true

  config.hosts << "localhost"
  config.force_ssl = false
end
