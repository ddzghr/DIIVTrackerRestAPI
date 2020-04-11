# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
# ruby encoding: utf-8

AccountType.create(code: 'APIMASTER',
                   name:'API Master account',
                   internal_admin_type: true,
                   internal_application_type: false,
                   ordering_party_type: false,
                   courier_type: false,
                   supplier_type: false,
                   has_duration: false,
                   has_invoice: false)

AccountType.create(code: 'TRACKSERV',
                   name:'DIIV Tracker Server',
                   internal_admin_type: false,
                   internal_application_type: true,
                   ordering_party_type: false,
                   courier_type: false,
                   supplier_type: false,
                   has_duration: false,
                   has_invoice: false)

AccountType.create(code: 'ORDCUST',
                   name:'Ordering customer',
                   internal_admin_type: false,
                   internal_application_type: false,
                   ordering_party_type: true,
                   courier_type: false,
                   supplier_type: false,
                   has_duration: false,
                   has_invoice: false)

AccountType.create(code: 'COURCUST',
                   name:'Courier customer',
                   internal_admin_type: false,
                   internal_application_type: false,
                   ordering_party_type: false,
                   courier_type: true,
                   supplier_type: false,
                   has_duration: true,
                   has_invoice: true)

AccountType.create(code: 'SUPPCUST',
                   name:'Supplier customer',
                   internal_admin_type: false,
                   internal_application_type: false,
                   ordering_party_type: false,
                   courier_type: false,
                   supplier_type: true,
                   has_duration: true,
                   has_invoice: true)

DeviceType.create(code: 'APISER',
                  name: 'REST Api Server',
                  internal_api_server_type: true,
                  internal_web_server_type: false,
                  desktop_type: false,
                  web_server_type: false,
                  mobile_type: false)

DeviceType.create(code: 'DIIVWEBSER',
                  name: 'DIIVTracker WEB Server',
                  internal_api_server_type: false,
                  internal_web_server_type: true,
                  desktop_type: false,
                  web_server_type: false,
                  mobile_type: false)

DeviceType.create(code: 'CLIDESKTOP',
                  name: 'DIIVTracker WEB Server',
                  internal_api_server_type: false,
                  internal_web_server_type: false,
                  desktop_type: true,
                  web_server_type: false,
                  mobile_type: false)

DeviceType.create(code: 'CLIWEBSER',
                  name: 'Client WEB Server',
                  internal_api_server_type: false,
                  internal_web_server_type: false,
                  desktop_type: false,
                  web_server_type: true,
                  mobile_type: false)

DeviceType.create(code: 'CLIMOBDEV',
                  name: 'Client Mobile device',
                  internal_api_server_type: false,
                  internal_web_server_type: false,
                  desktop_type: false,
                  web_server_type: false,
                  mobile_type: true)

parent = Status.create(code:'NULL',
                       name:'Unknown status',
                       new_type_status: false,
                       in_progress_type_status: false,
                       stored_type_status: false,
                       delivered_type_status: false)

parent = Status.create(code:'NEW',
                       name:'New request',
                       new_type_status: true,
                       in_progress_type_status: false,
                       stored_type_status: false,
                       delivered_type_status: false)

subparent = Status.create(code:'ACCNEW',
                          name:'Accepted new request',
                          new_type_status: true,
                          in_progress_type_status: false,
                          stored_type_status: false,
                          delivered_type_status: false,
                          status_id: parent.id)

Status.create(code:'ACCNEWASS',
              name:'Accepted new request - assigned to courier',
              new_type_status: true,
              in_progress_type_status: false,
              stored_type_status: false,
              delivered_type_status: false,
              status_id: subparent.id)

Status.create(code:'ACCNEWACC',
              name:'Accepted new request - accepted by courier',
              new_type_status: true,
              in_progress_type_status: false,
              stored_type_status: false,
              delivered_type_status: false,
              status_id: subparent.id)

Status.create(code:'ACCNEWREJ',
              name:'Accepted new request - rejected from courier',
              new_type_status: true,
              in_progress_type_status: false,
              stored_type_status: false,
              delivered_type_status: false,
              status_id: subparent.id)

Status.create(code:'INPROGRESS',
              name:'In progress',
              new_type_status: false,
              in_progress_type_status: true,
              stored_type_status: false,
              delivered_type_status: false)

parent = Status.create(code:'STORED',
                       name:'Stored in warehouse or some other facility',
                       new_type_status: false,
                       in_progress_type_status: false,
                       stored_type_status: true,
                       delivered_type_status: false)

Status.create(code:'STOREDASS',
              name:'Stored in warehouse or some other facility - assigned to courier',
              new_type_status: false,
              in_progress_type_status: false,
              stored_type_status: true,
              delivered_type_status: false,
              status_id: parent.id)

Status.create(code:'STOREDACC',
              name:'Stored in warehouse or some other facility - accepted by courier',
              new_type_status: false,
              in_progress_type_status: false,
              stored_type_status: true,
              delivered_type_status: false,
              status_id: parent.id)

Status.create(code:'STOREDREJ',
              name:'Stored in warehouse or some other facility - rejected from courier',
              new_type_status: false,
              in_progress_type_status: false,
              stored_type_status: true,
              delivered_type_status: false,
              status_id: parent.id)

Status.create(code:'REJECTED',
              name:'Rejected from courier service',
              new_type_status: true,
              in_progress_type_status: false,
              stored_type_status: true,
              delivered_type_status: false)

Status.create(code:'DELIVERED',
              name:'Delivered',
              new_type_status: false,
              in_progress_type_status: false,
              stored_type_status: false,
              delivered_type_status: true)

Status.create(code:'LOST',
              name:'Delivery has been permanently lost',
              new_type_status: false,
              in_progress_type_status: false,
              stored_type_status: false,
              delivered_type_status: true)

Status.create(code:'CANCELED',
              name:'Delivery has been permanently canceled',
              new_type_status: false,
              in_progress_type_status: false,
              stored_type_status: false,
              delivered_type_status: true)


# NULL --> NEW
Workflow.create(old_status_id: Status.find_by_code('NULL').id, new_status_id: Status.find_by_code('NEW').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('NULL').id, new_status_id: Status.find_by_code('NEW').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NULL').id, new_status_id: Status.find_by_code('NEW').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id)
Workflow.create(old_status_id: Status.find_by_code('NULL').id, new_status_id: Status.find_by_code('NEW').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)

# NEW --> CANCELED
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('CANCELED').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('CANCELED').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('CANCELED').id, device_type_id: DeviceType.find_by_code('CLIDESKTOP').id)
# NEW --> ACCNEW
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEW').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEW').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEW').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# NEW --> REJECTED
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('REJECTED').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('REJECTED').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('REJECTED').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# NEW --> ACCNEWACC
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# NEW --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('NEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# ACCNEW --> ACCNEWASS
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWASS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWASS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWASS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# ACCNEW --> ACCNEWACC
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# ACCNEW --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEW').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# ACCNEWASS --> ACCNEWACC
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWACC').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# ACCNEWASS --> ACCNEWREJ
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# ACCNEWASS --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# ACCNEWACC --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# ACCNEWACC --> ACCNEWREJ
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWACC').id, new_status_id: Status.find_by_code('ACCNEWREJ').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# ACCNEWREJ --> ACCNEW
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('ACCNEW').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('ACCNEW').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('ACCNEW').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# ACCNEWREJ --> ACCNEWASS
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('ACCNEWASS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('ACCNEWASS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('ACCNEWASS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# ACCNEWREJ --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('ACCNEWREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# INPROGRESS --> STORED
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# INPROGRESS --> DELIVERED
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('DELIVERED').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('DELIVERED').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('DELIVERED').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('DELIVERED').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# INPROGRESS --> LOST
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('INPROGRESS').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# STORED --> LOST
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('LOST').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# STORED --> STOREDASS
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDASS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDASS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDASS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# STORED --> STOREDACC
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# STORED --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STORED').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# STOREDASS --> STOREDACC
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDACC').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# STOREDASS --> STOREDREJ
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# STOREDASS --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDASS').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)

# STOREDREJ --> STORED
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# STOREDREJ --> STOREDASS
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('STOREDASS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('STOREDASS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('STOREDASS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
# STOREDREJ --> INPROGRESS
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create(old_status_id: Status.find_by_code('STOREDREJ').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)