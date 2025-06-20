puts "🔄 Seeding database..."

# === Create or find 'admin' role
admin_role = Role.find_or_create_by!(name: 'admin')

# === Create default Admin user
admin = User.find_or_initialize_by(email: 'admin@racchurch.com') do |user|
  user.first_name = 'Admin'
  user.last_name = 'RAC'
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.active = true
end

if admin.new_record?
  admin.save!
  puts "✅ Admin user created: #{admin.email}"
else
  puts "⚠️ Admin user already exists: #{admin.email}"
end

unless admin.has_role?(:admin)
  admin.add_role(:admin)
  puts "🔗 Role 'admin' assigned to #{admin.email}"
end

# === Create or find 'member' role
member_role = Role.find_or_create_by!(name: 'member')

# === Create default Member user
member = User.find_or_initialize_by(email: 'member@racchurch.com') do |user|
  user.first_name = 'Member'
  user.last_name = 'RAC'
  user.password = 'password123'
  user.password_confirmation = 'password123'
  user.active = true
end

if member.new_record?
  member.save!
  puts "✅ Member user created: #{member.email}"
else
  puts "⚠️ Member user already exists: #{member.email}"
end

unless member.has_role?(:member)
  member.add_role(:member)
  puts "🔗 Role 'member' assigned to #{member.email}"
end

puts "✅ Database seeding finished!"
