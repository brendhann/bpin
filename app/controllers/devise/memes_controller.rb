class MemesController < ApplicationController
require 'google/api_client'
require 'google/api_client/auth/file_storage'
require 'google/api_client/auth/installed_app'

def initialize
    credentials_storage = ::Google::APIClient::FileStorage.new(CREDENTIALS_FILE)
    @client = ::Google::APIClient.new(
      application_name:    'MyApp',
      application_version: '1.0.0'
    )
    @client.authorization = credentials_storage.authorization || begin
      installed_app_flow = ::Google::APIClient::InstalledAppFlow.new(
        client_id:     ENV['GOOGLE_API_CLIENT_ID'],
        client_secret: ENV['GOOGLE_API_CLIENT_SECRET'],
        scope:         ENV['GOOGLE_API_SCOPE']
      )
      installed_app_flow.authorize(credentials_storage)
    end
    @drive = @client.discovered_api('drive', 'v2')
  

  def download_latest_proxylist(search_period = 1.week.ago)
    modified_date = search_period.strftime('%Y-%m-%dT%H:%M:%S%z')
    result = @client.execute(
      api_method: @drive.files.list,
      parameters: {
        q: %(title contains "proxylist" and modifiedDate > "#{modified_date}")
      }
    )
    file = result.data['items'].first
    download_url = file['downloadUrl']
    result = @client.execute(uri: download_url)
    output_file = Rails.root.join('tmp', file['originalFilename'])
    IO.binwrite output_file, result.body
    file['createdDate']
  end
end

def index
 @pins = Pin.all
end

def show

end

def edit

@pin = Pin.find(params[:pin])
@meme = @pin

end

def detroy

end

def create
@meme = Meme.new(params=[:meme])
if @meme.save
	redirect_to @pins

else
									
end
end

def new

@meme = @meme.new


end

def update
if @meme.update(params[:top])

else

end
end

end
