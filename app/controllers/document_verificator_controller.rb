require 'open-uri'
class DocumentVerificatorController < ApplicationController
	def new
		@search_by_options = ["Date", "Narration", "Debit", "Credit"];
	end

	def create
		uploaded_io = params[:document_detail][:document]
		File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  			file.write(uploaded_io.read)
  		end
  		File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), "rb") do |io|
  			reader = PDF::Reader.new(io)
  			puts reader.text
		end
		render plain: params[:document_detail].inspect
	end

end
