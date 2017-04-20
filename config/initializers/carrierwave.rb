require 'carrierwave/orm/activerecord'

CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',            # required
      :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],     # required
      :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],  # required
      :region                 => 'ap-northeast-2'
    }
    config.storage = :fog
    config.cache_dir = "#{Rails.root}/tmp/uploads"
    config.fog_use_ssl_for_aws = false
    config.fog_directory       = ENV['S3_BUCKET']
  end
