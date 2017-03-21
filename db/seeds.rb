Card.destroy_all

# old seed color
# colors = %w(#F2F2F0 #11BFAE #456173 #1B3C59)

for i in 1..2000
  # picture = File.open(File.join(Rails.root,"app/assets/images/final_groot/_#{i}.jpg"))
  Card.create(picture_link: "_#{i}.jpg", turned: false)
  puts "image #{i} created"
end
