require 'protobuf'

class Employee < ApplicationRecord
  protobuf_message :employee_message

  after_create :publish_created
  after_update :publish_updated

  def publish_created
    Rails.logger.info "Publishing employee object #{self.inspect} on the employee.created queue."
    ::ActivePublisher.publish("employee.created", self.to_proto.encode, "events", {})
  end

  def publish_updated
    Rails.logger.info "Publishing employee object #{self.inspect} on the employee.updated queue."
    ::ActivePublisher.publish("employee.updated", self.to_proto.encode, "events", {})
  end
end
