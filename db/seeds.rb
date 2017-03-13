Card.destroy_all

colors = %w(#F2F2F0 #11BFAE #456173 #1B3C59)

for i in 1..1000
  picture = File.open(File.join(Rails.root,"app/assets/images/final_groot/_#{i}.png"))
  Card.create(tree_id: i, color: colors.sample, picture: picture, turned: false)
  puts "image #{i} created"
end
