# ruby encoding: utf-8
RoleType.create(code: 'APIMASTER',
                name:'API Master account',
                internal_admin_type: true,
                internal_application_type: false,
                ordering_party_type: false,
                courier_type: false,
                supplier_type: false,
                has_duration: false,
                has_invoice: false)

RoleType.create(code: 'TRACKSERV',
                name:'DIIV Tracker Server',
                internal_admin_type: false,
                internal_application_type: true,
                ordering_party_type: false,
                courier_type: false,
                supplier_type: false,
                has_duration: false,
                has_invoice: false)

RoleType.create(code: 'ORDCUST',
                name:'Ordering customer',
                internal_admin_type: false,
                internal_application_type: false,
                ordering_party_type: true,
                courier_type: false,
                supplier_type: false,
                has_duration: false,
                has_invoice: false)

RoleType.create(code: 'COURCUST',
                name:'Courier customer',
                internal_admin_type: false,
                internal_application_type: false,
                ordering_party_type: false,
                courier_type: true,
                supplier_type: false,
                has_duration: true,
                has_invoice: true)

RoleType.create(code: 'SUPPCUST',
                name:'Supplier customer',
                internal_admin_type: false,
                internal_application_type: false,
                ordering_party_type: false,
                courier_type: false,
                supplier_type: true,
                has_duration: true,
                has_invoice: true)
