class MemesController < ApplicationController

require 'open-uri'
require 'meme_captain'



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



open('http://memecaptain.com/troll_face.jpg', 'rb') do |f|
  i = MemeCaptain.meme_top_bottom(f, :toptext, :bottomtext)
  i.display
  i.write('out.jpg')
end
redirect_to @memes
end


end
