# ruby encoding: utf-8
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
                  name: 'Client desktop application',
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
