after "production:users", :roles do
  UserRole.create(user_id: User.find_by_email('admin@diiv.local').id,
                  role_id: Role.find_by_code('APIMASTER').id)

  UserRole.create(user_id: User.find_by_email('tracker@diiv.local').id,
                  role_id: Role.find_by_code('TRACKSERV').id)

  UserRole.create(user_id: User.find_by_email('web@diiv.local').id,
                  role_id: Role.find_by_code('TRACKSERV').id)

  UserRole.create(user_id: User.find_by_email('ivor.andelkovic@racunarstvo.hr').id,
                  role_id: Role.find_by_code('SUPPCUST').id)

  UserRole.create(user_id: User.find_by_email('opacak.ivan@racunarstvo.hr').id,
                  role_id: Role.find_by_code('COURCUST').id)

  UserRole.create(user_id: User.find_by_email('dominik.dukic@racunarstvo.hr').id,
                  role_id: Role.find_by_code('ORDCUST').id)
end
