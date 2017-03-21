Card.destroy_all

# old seed color
# colors = %w(#F2F2F0 #11BFAE #456173 #1B3C59)

backgrounds = []
for i in 1..4
  background = File.open(File.join(Rails.root,"app/assets/images/grid_color_#{i}.jpg"))
  backgrounds << background
end

for i in 1..2000
  picture = File.open(File.join(Rails.root,"app/assets/images/final_groot/_#{i}.jpg"))
  background = backgrounds.sample
  Card.create(color: background, picture: picture, turned: false)
  puts "image #{i} created"
end
