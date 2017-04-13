desc "Create user roles and users"
task :setup_user => :environment do
  Role.create(name:"admin")
  Role.create(name:"user")


  admin = User.create(email:"admin@example.com",password: "password")
  user= User.create(email:"user@example.com", password: "password")

  Permission.create(user_id:admin.id,role_id:Role.first.id)
  Permission.create(user_id:user.id,role_id:Role.second.id)
end
