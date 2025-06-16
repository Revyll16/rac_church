# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create default admin user
admin = User.find_or_initialize_by(email: 'admin@racchurch.com') do |user|
  user.first_name = 'Admin'
  user.last_name = 'RAC'
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.role = 'admin'
  user.active = true
end

if admin.new_record?
  admin.save!
  puts "Admin user created successfully!"
else
  puts "Admin user already exists."
end
