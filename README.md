# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# API Resources

##Free API zone:

    http://api.diivtracker.com/api/v1/diiv/free/deliveries/{UUID}

    http://api.diivtracker.com/api/v1/diiv/free/users/signup
    
    http://api.diivtracker.com/api/v1/diiv/free/users/confirm
    
    http://api.diivtracker.com/api/v1/diiv/free/users/reset
    
    http://api.diivtracker.com/api/v1/diiv/free/devices/confirm
    
    http://api.diivtracker.com/api/v1/diiv/free/devices/unlock

##DIIV WEB server zone

######System sub-zone

    http://api.diivtracker.com/api/v1/diiv/system/address-types
    
    http://api.diivtracker.com/api/v1/diiv/system/role-types
    
    http://api.diivtracker.com/api/v1/diiv/system/device-types
    
    http://api.diivtracker.com/api/v1/diiv/system/role-type-device-types
    
    http://api.diivtracker.com/api/v1/diiv/system/statuses
                        
    http://api.diivtracker.com/api/v1/diiv/system/workflows
    
    http://api.diivtracker.com/api/v1/diiv/system/users/{e-mail}
    
######Client sub-zone
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/validate
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/roles
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/roles/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/roles/{uuid}/devices
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/roles/{uuid}/devices/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/devices
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/devices/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/devices/{uuid}/issue-token
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/devices/{uuid}/locations
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/devices/{uuid}/roles
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/devices/{uuid}/roles/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/devices/{uuid}/assign
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/devices/{uuid}/reject
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/devices/{uuid}/accept
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/devices/{uuid}/take
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/devices/{uuid}/store
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/devices/{uuid}/deliver
    
    http://api.diivtracker.com/api/v1/diiv/client/{uuid}/deliveries/{uuid}/statuses/{id}/locations
    
######Administrator sub-zone
    
    http://api.diivtracker.com/api/v1/diiv/admin/users    
        
    http://api.diivtracker.com/api/v1/diiv/admin/users/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/admin/users/{uuid}/roles
    
    http://api.diivtracker.com/api/v1/diiv/admin/users/{uuid}/roles/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/admin/users/{uuid}/roles/{uuid}/devices
    
    http://api.diivtracker.com/api/v1/diiv/admin/users/{uuid}/roles/{uuid}/devices/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/admin/devices
    
    http://api.diivtracker.com/api/v1/diiv/admin/devices/{uuid}/roles
    
    http://api.diivtracker.com/api/v1/diiv/admin/devices/{uuid}/roles/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/admin/devices/{uuid}/locations
    
    http://api.diivtracker.com/api/v1/diiv/admin/devices/{uuid}/locations/{id}    
    
##Supplier

    http://api.diivtracker.com/api/v1/supplier/desktop/deliveries
    
    http://api.diivtracker.com/api/v1/supplier/desktop/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/supplier/desktop/deliveries/{uuid}/statuses

##Courier

######WEB server sub-zone

    http://api.diivtracker.com/api/v1/courier/web/devices
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries
        
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/devices/{uuid}/assign
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/devices/{uuid}/reject
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/devices/{uuid}/accept
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/devices/{uuid}/take
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/devices/{uuid}/store
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/devices/{uuid}/deliver
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/statuses/{id}/locations
        
######Mobile device sub-zone
            
    http://api.diivtracker.com/api/v1/courier/mobile/locations
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries
        
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/locations
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/assign
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/reject
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/accept
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/take
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/store
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/deliver
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/statuses/{id}/locations
    