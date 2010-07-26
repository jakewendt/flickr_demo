class FlickrController < ApplicationController

	def index
		flickr = Flickr.new
		if params[:tags]
			render :partial => "photo", 
				:collection => flickr.photos(:tags => params[:tags], :per_page => '24')
		end
	end

	def howto
	end

end
