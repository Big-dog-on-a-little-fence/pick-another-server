module TunesHelper
  
  def embed_youtube(url)
    if url.include?('youtu.be')
      youtube_id = url.split("/").last
    else
      youtube_id = url.split("?v=").last
    end
    content_tag(:div, content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}", allowfullscreen: "allowfullscreen"), class: "embed-container")
  end
  
  def embed_spotify(spotify_url)
    spotify_id = spotify_url.split("%3A").last
    content_tag(:div, content_tag(:iframe, nil, src: "https://embed.spotify.com/?uri=spotify%3Atrack%3A#{spotify_id}"), class: "embed-container")
  end

  def embed(url)
    case
    when url.include?('youtu.be')
      embed_youtube(url)
    when url.include?('youtube')
      embed_youtube(url)
    when url.include?('open.spotify')
      embed_spotify(url)
    else
      content_tag(:div, link_to(truncate(url, length:40), url, target: "_blank"))
    end
  end

end
