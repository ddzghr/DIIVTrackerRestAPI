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
    
    http://api.diivtracker.com/api/v1/diiv/system/roles
    
    http://api.diivtracker.com/api/v1/diiv/system/device-types
    
    http://api.diivtracker.com/api/v1/diiv/system/roles-device-types
    
    http://api.diivtracker.com/api/v1/diiv/system/statuses
                        
    http://api.diivtracker.com/api/v1/diiv/system/workflows
    
    http://api.diivtracker.com/api/v1/diiv/system/users
    
    
######Client sub-zone
    
    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/login

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/logout

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/user-roles

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/user-roles/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/devices

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/devices/{uuid}

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/devices/{uuid}/issue-token

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/devices/{uuid}/gps-locations

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/devices/{uuid}/roles

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/devices/{uuid}/roles/{uuid}

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/assign

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/reject

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/accept

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/take

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/store

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/deliver

    http://api.diivtracker.com/api/v1/diiv/clients/{uuid}/deliveries/{uuid}/delivery-statuses/{id}/gps-locations
    
######Administrator sub-zone
    
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/users    
        
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/users/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/users/{uuid}/user-roles
    
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/users/{uuid}/user-roles/{uuid}
    
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/devices
        
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/devices/{uuid}/gps-locations
    
    http://api.diivtracker.com/api/v1/diiv/admins/{uuid}/devices/{uuid}/gps-locations/{id}    
    
##Supplier

    http://api.diivtracker.com/api/v1/supplier/desktop/deliveries
    
    http://api.diivtracker.com/api/v1/supplier/desktop/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/supplier/desktop/deliveries/{uuid}/delivery-statuses

##Courier
    http://api.diivtracker.com/api/v1/courier/deliveries
    
######WEB server sub-zone

    http://api.diivtracker.com/api/v1/courier/web/devices
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries
        
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/assign
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/reject
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/accept
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/take
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/store
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/devices/{uuid}/deliver
    
    http://api.diivtracker.com/api/v1/courier/web/deliveries/{uuid}/delivery-statuses/{id}/gps-locations
        
######Mobile device sub-zone
            
    http://api.diivtracker.com/api/v1/courier/mobile/gps-locations
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries
        
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/gps-locations
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/assign
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/reject
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/accept
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/take
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/store
    
    http://api.diivtracker.com/api/v1/courier/mobile/deliveries/{uuid}/delivery-statuses/{id}/deliver
