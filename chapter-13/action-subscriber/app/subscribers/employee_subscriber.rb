class EmployeeSubscriber < ::ActionSubscriber::Base
  def created
    Rails.logger.info "Received created message: #{EmployeeMessage.decode(payload).inspect}"
  end

  def updated
    Rails.logger.info "Received updated message: #{EmployeeMessage.decode(payload).inspect}"
  end
end

