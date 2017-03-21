Card.destroy_all

colors = %w(#F2F2F0 #11BFAE #456173 #1B3C59)
# gridcolors = %w(image_tag "grid_color_1.jpg", image_tag "grid_color_2.jpg", image_tag "grid_color_3.jps", image_tag "grid_color_4.jps")

# for i in 1..2000
#   picture = File.open(File.join(Rails.root,"app/assets/images/final_groot/_#{i}.jpg"))
#   Card.create(color: gridcolors.sample, picture: picture, turned: false)
#   puts "image #{i} created"
# end

for i in 1..2000
picture = File.open(File.join(Rails.root,"app/assets/images/final_groot/_#{i}.jpg"))
Card.create(color: colors.sample, picture: picture, turned: false)
puts "image #{i} created"
end
