# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.8' unless defined? RAILS_GEM_VERSION
RAILS_GEM_VERSION = '2.3.14' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
	config.gem "flickr"	#	included
	config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
	config.time_zone = 'UTC'
end

#require 'flickr'
class Flickr
	attr_accessor :host
	alias old_initialize initialize
	#	probably should use alias_method_chain here
	def initialize(*args)
		api_key = YAML.load(File.open(File.join(File.dirname(__FILE__), 'flickr.yml')))['api_key']
		old_initialize(api_key)
		self.host = "http://api.flickr.com"
	end
end

class Flickr::Photo
	def photo_page_url
#		info = @client.photos_getInfo('photo_id'=>@id)['photo']
#	this doesn't always work as the username isn't always the same as the link?????
#		"http://flickr.com/photos/#{info['owner']['username']}/#{@id}"

		#	=> "http://www.flickr.com/photos/crustyshoes/3862985492/sizes/sq/"
		#	>> p.sizes.first['url'].sub(/sizes\/\w+\/$/,'')
		#	=> "http://www.flickr.com/photos/crustyshoes/3862985492/"

		sizes.first['url'].sub(/\/sizes\/\w+\/$/,'')
	end
end
