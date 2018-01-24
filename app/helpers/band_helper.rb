module BandHelper

  def list_bands(show)
    
    output = String.new
    if show.bands.length < 1
      output = "No bands selected"
    else
      output = ""
      show.bands.each do |b|
        if b == show.bands.last
          output += b.name
        else
          output += b.name + " / "
        end
      end
    end
    output
  end
  
end
