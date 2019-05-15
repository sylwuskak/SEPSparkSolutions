class HomeController < ApplicationController
    def upload_products
        begin
            file = params.require(:file_to_upload).tempfile
            fl = Tools::FileLoader.new(file)
            fl.read_file
            flash[:success] = "Uploaded file successfully"
        rescue => e 
            flash[:danger] = "Uploading failed: #{e.message}"
        end
        redirect_to '/'
    end
end