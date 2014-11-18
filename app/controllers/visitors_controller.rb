class VisitorsController < ApplicationController
	def index
		@header_title = 'Home'
		@crumbs = [['fa fa-home', 'Home', root_path], ['', 'Dashboard', root_path]]
	end
end
