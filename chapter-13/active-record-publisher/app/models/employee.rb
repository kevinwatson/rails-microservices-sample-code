require 'protobuf'

class Employee < ApplicationRecord
  protobuf_message :employee_message

  after_create :publish_created
  after_update :publish_updated

  scope :by_guid, lambda { |*values| where(guid: values) }
  scope :by_first_name, lambda { |*values| where(first_name: values) }
  scope :by_last_name, lambda { |*values| where(last_name: values) }

  field_scope :guid
  field_scope :first_name
  field_scope :last_name

  def publish_created
    Rails.logger.info "Publishing employee object #{self.inspect} on the employee.created queue."
    ::ActivePublisher.publish("employee.created", self.to_proto.encode, "events", {})
  end

  def publish_updated
    Rails.logger.info "Publishing employee object #{self.inspect} on the employee.updated queue."
    ::ActivePublisher.publish("employee.updated", self.to_proto.encode, "events", {})
  end
end
