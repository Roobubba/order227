module VideoHelper
  
  def youtube_link(url)
    content_tag(:iframe, '', src: url, width: 560, height: 315, frameborder: 0, class: "embed-responsive-item", gesture: "media", allow: "encrypted-media", allowfullscreen: "")
  end
  
  def video_header(video)
    venue = ""
    credit = ""
    if video.venue_id?
      venue = display_venue(video.venue)
    end
    if video.credit.length > 0
      credit = "<br>Credit: " + video.credit
    end
    ("<strong>" + video.title + "</strong><br>" + format_date(video.date) + ", " + venue + "<br>Credit: " + video.credit).html_safe
  end
  
end