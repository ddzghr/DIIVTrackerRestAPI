# ruby encoding: utf-8
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
