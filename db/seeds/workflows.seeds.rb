# ruby encoding: utf-8
after :statuses, :device_types do
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
  end