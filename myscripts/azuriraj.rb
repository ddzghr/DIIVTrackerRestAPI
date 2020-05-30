# STOREDACC --> INPROGRESS
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('INPROGRESS').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# STOREDACC --> STOREDREJ
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STOREDREJ').id, device_type_id: DeviceType.find_by_code('CLIMOBDEV').id)
# STOREDACC --> STORED
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('APISER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('DIIVWEBSER').id)
Workflow.create!(old_status_id: Status.find_by_code('STOREDACC').id, new_status_id: Status.find_by_code('STORED').id, device_type_id: DeviceType.find_by_code('CLIWEBSER').id)
