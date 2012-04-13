CarrierWave.configure do |config|
  if Rails.env.development?
    config.storage = :file
  else
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAJET2435CJII2HOOQ',
      :aws_secret_access_key  => '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',
      :region                 => 'us-east-1'
    }

    config.fog_directory  = ENV['S3_BUCKET']
    config.storage = :fog
  end
end
