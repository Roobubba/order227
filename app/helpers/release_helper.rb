module ReleaseHelper

  def release_title_and_type(release)
    release.title + " (" + release.release_type.name + ")"
  end

  def bandcamp_link(release)

    h = 120
    if release.release_embed_url[0, 41] == "https://bandcamp.com/EmbeddedPlayer/album"

      h = 241
    end
    content_tag(:iframe, '', src: release.release_embed_url, style: "border: 0;", width: 600, height: h, seamless: "") do
      link_to(release.title + " by Order#227", release.url)
    end
  end

  def bandcamp_link_track(track)
    content_tag(:iframe, '', src: track.embed_url, style: "border: 0;", width: 300, height: 42, seamless: "") do
      link_to(track.title + " by Order#227", track.url)
    end
  end

  def get_lyrics_div(track)
    ("<div class=\"hide collapse\" id=\"collapse" + track.id.to_s + "\">").html_safe
  end




end
