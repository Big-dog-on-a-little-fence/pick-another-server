module ArticlesHelper
  
  def embed(youtube_url)
    ## http://blog.41studio.com/embed-responsive-youtube-video-in-rails-4/
    youtube_id = youtube_url.split("/").last
    content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
  end

end
