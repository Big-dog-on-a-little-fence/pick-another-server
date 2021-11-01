module TunesHelper
  
  def embed_youtube(url, pixels)
    if url.include?('youtu.be')
      youtube_id = url.split("/").last
    else
      youtube_id = url.split("?v=").last
    end
    if pixels
      content_tag(:div, content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}",
                  height: pixels, frameborder: "0", allowtransparency: "true"))
    else
      content_tag(:div, content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", allowfullscreen: "allowfullscreen"), 
                  class: "embed-container")
    end
  end

  def embed_spotify(spotify_url, pixels)
    spotify_id = spotify_url.split("/").last
    if pixels
      content_tag(:div, content_tag(:iframe, nil, src: "https://open.spotify.com/embed/track/#{spotify_id}?utm_source=generator",
                  height: pixels, frameborder: "0", allowtransparency: "true"))
    else
      content_tag(:div, content_tag(:iframe, nil, src: "https://open.spotify.com/embed/track/#{spotify_id}?utm_source=generator"), 
                  class: "embed-container")
    end
  end

  # #OLD CODE 2016
  # def embed_spotify(spotify_url, pixels)
  #   spotify_id = spotify_url.split("%3A").last
  #   if pixels
  #     content_tag(:div, content_tag(:iframe, nil, src: "https://embed.spotify.com/?uri=spotify%3Atrack%3A#{spotify_id}",
  #                 height: pixels, frameborder: "0", allowtransparency: "true"))
  #   else
  #     content_tag(:div, content_tag(:iframe, nil, src: "https://embed.spotify.com/?uri=spotify%3Atrack%3A#{spotify_id}"), 
  #                 class: "embed-container")
  #   end
  # end

  def embed(url, pixels=nil)
    case
    when url.include?('youtu.be')
      embed_youtube(url, pixels)
    when url.include?('youtube')
      embed_youtube(url, pixels)
    when url.include?('open.spotify')
      embed_spotify(url, pixels)
    else
      content_tag(:div, link_to(truncate(url, length:40), url, target: "_blank"))
    end
  end

end
