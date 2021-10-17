#class to instaniate pad information
class Pad
  
  attr_reader :x_pad, :y_pad
  attr_reader :x_width, :y_width
  attr_reader :x_needle, :y_needle
  attr_reader :name
  
  def initialize( pad_row )
    @name = pad_row[2]
    @x_pad = pad_row[3].to_f
    @y_pad = pad_row[6].to_f
    @x_width = pad_row[7].to_f
    @y_width = pad_row[8].to_f
    @x_needle = pad_row[9].to_f
    @y_needle = pad_row[10].to_f 
      
    puts "Pad: #{pad_row[1]} - #{pad_row[2]} X:#{pad_row[3]} Y:#{pad_row[6]} width:#{pad_row[7]} height:#{pad_row[8]}"
    self
  end
end