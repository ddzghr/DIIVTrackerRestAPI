after :users, :roles do
  UserRole.create(user_id: User.find_by_email('admin@diiv.local').id,
                  role_id: Role.find_by_code('APIMASTER').id)

  UserRole.create(user_id: User.find_by_email('tracker@diiv.local').id,
                  role_id: Role.find_by_code('TRACKSERV').id)

  UserRole.create(user_id: User.find_by_email('web@diiv.local').id,
                  role_id: Role.find_by_code('TRACKSERV').id)

  UserRole.create(user_id: User.find_by_email('dobavljac@diiv.local').id,
                  role_id: Role.find_by_code('SUPPCUST').id)

  UserRole.create(user_id: User.find_by_email('kurir@diiv.local').id,
                  role_id: Role.find_by_code('COURCUST').id)

  UserRole.create(user_id: User.find_by_email('narucitelj@diiv.local').id,
                  role_id: Role.find_by_code('ORDCUST').id)
end
