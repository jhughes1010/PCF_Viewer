require_relative 'PCF'

#PCF parser class
class PCF
	attr_reader :mask, :scale, :pad_count, :pads
	attr_reader :x_pitch, :y_pitch
	attr_reader :x_canvas, :y_canvas
	attr_reader :x_offset, :y_offset
		def initialize(file_data)
		@file = file_data
		@mask = "Not Found"
		@x_canvas = 1500
		@y_canvas = 1000
		@x_offset = 750
		@y_offset = 500
		@scale = 1
		@pad_count = 0
		@pads = Array.new
				file_data.each do |line|
			#puts line
			col = line.split(",")
			if col[0] == "MASK"
				@mask = col[1]
			end
						if col[0] == "XPITCH"
				@x_pitch = col[1].to_f * 1000
			end
						if col[0] == "YPITCH"
				@y_pitch = col[1].to_f * 1000
			end
						if col[0].strip == "PAD"
				@pad_count+=1
				@pads << Pad.new(col)
			end
		end
		if((@x_pitch >1300)||(@y_pitch >900))
			max_dimension = [@x_pitch ,@y_pitch ].max
			puts "Maximum: #{max_dimension}"
			@scale = @x_canvas/(max_dimension+100)
		end
	end
end
