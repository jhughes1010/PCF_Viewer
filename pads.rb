require 'ruby2d'
require_relative 'PCF'
require_relative 'pad'
require_relative 'pitch'

#open the PCF file
pads = File.open("PCF_AT58961_D_probe_v1p2.csv")
#parse PCF for critical data and scale for graphical display
die = PCF.new(pads)
puts "Scale: #{die.scale}"
puts "Pad Count: #{die.pad_count}"


set title: die.mask
set width: die.x_canvas, height: die.y_canvas

#step
Rectangle.new(
	x: die.x_offset - (die.x_pitch/2)*die.scale , y: die.y_offset - (die.y_pitch/2)*die.scale ,
	width: die.x_pitch*die.scale, height: die.y_pitch*die.scale,
	color: 'teal',
	z: 20
)

#die
Rectangle.new(
	x: die.x_offset - (die.x_pitch/2 -40 )*die.scale, y: die.y_offset - (die.y_pitch/2 -30)*die.scale,
	width: (die.x_pitch-80)*die.scale , height: (die.y_pitch-60)*die.scale,
	color: 'gray',
	z: 25
)

die.pads.each do |p|
	Rectangle.new(
		x: die.x_offset + (p.x_pad)*die.scale , y: die.y_offset - (p.y_pad)*die.scale ,
		width: (p.x_width)*die.scale, height: (p.y_width)*die.scale,
		color: 'blue',
		z: 30
	)

	Circle.new(
		x: die.x_offset + (p.x_needle)*die.scale, y: die.y_offset - (p.y_needle)*die.scale,
		radius: 3,
		sectors: 32,
		color: 'red',
		z: 40
	)

	Text.new(
		p.name,
		x: 5 + die.x_offset + (p.x_pad)*die.scale , y: die.y_offset - (p.y_pad)*die.scale,
		#font: 'vera.ttf',
		style: 'bold',
		size: 12,
		color: 'black',
		rotate: 0,
		z: 40
	)

end

Text.new(
	die.mask,
	x: die.x_offset - 2*60, y: die.y_offset - 30,
	#font: 'vera.ttf',
	#style: 'bold',
	size: 60,
	color: 'black',
	rotate: 0,
	z: 40
)

show