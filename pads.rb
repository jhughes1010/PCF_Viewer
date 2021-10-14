require 'ruby2d'

#read coords.txt
x_offset= 500
y_offset= 500

pads = File.open("coords.txt")

set title: "58961"
set width: 1000, height: 1000
count = 0
pads.each do |pad|
p = pad.split(" ")

  Rectangle.new(
    x: x_offset+p[4].to_i, y: y_offset+p[5].to_i,
    width: p[2].to_i - p[4].to_i, height: p[3].to_i - p[5].to_i,
    color: 'teal',
    z: 20
  )


Circle.new(
  x: x_offset + p[8].to_i, y: y_offset + p[9].to_i,
  radius: 3,
  sectors: 32,
  color: 'fuchsia',
  z: 30
)


Text.new(
  p[1],
  x: x_offset+p[2].to_i+5, y: y_offset+p[5].to_i+5,
  #font: 'vera.ttf',
  style: 'bold',
  size: 15,
  color: 'green',
  rotate: 0,
  z: 40
)
end

show



