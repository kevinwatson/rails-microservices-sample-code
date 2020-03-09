ActionSubscriber.draw_routes do
    default_routes_for EmployeeSubscriber
end

ActionSubscriber.configure do |config|
    config.hosts = ["host.docker.internal"]
      config.port = 5672
end

