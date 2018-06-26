Aws.config.update({
    region: 'us-west-2',
    credentials: Aws::Credentials.new(ENV['ab218'], ENV['ab218']),
  })
  
  S3_BUCKET = Aws::S3::Resource.new.bucket(ENV['ab218bucket'])