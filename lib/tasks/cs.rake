desc "Returns a salesforce.com access token for the current environment for the public user"
task :get_public_access_token => :environment do
	# log in for an access token
	config = YAML.load_file(File.join(::Rails.root, 'config', 'databasedotcom.yml'))
	client = Databasedotcom::Client.new(config)
	access_token = client.authenticate :username => ENV['SFDC_PUBLIC_USERNAME'], 
		:password => ENV['SFDC_PUBLIC_PASSWORD']  
	puts "Public access token for #{ENV['DATABASEDOTCOM_HOST']}: #{access_token}"
end

# this task will not work properly unless administrator credentials are setup
desc "Returns a salesforce.com access token for the current environment for the admin user"
task :get_admin_access_token => :environment do
	# log in for an access token
	config = YAML.load_file(File.join(::Rails.root, 'config', 'databasedotcom.yml'))
	client = Databasedotcom::Client.new(config)
	access_token = client.authenticate :username => ENV['SFDC_ADMIN_USERNAME'], 
		:password => ENV['SFDC_ADMIN_PASSWORD']  
	puts "Admin access token for #{ENV['DATABASEDOTCOM_HOST']}: #{access_token}"
end