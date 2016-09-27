require 'lib/hash_resource'
class ScheduleResource < MiddlemanContentResource
  attr_reader :agenda
  def initialize(resource)
    super(resource)
    _a = Array(resource.data.agenda)
    @agenda = _a.map{|a| HashResource.new(a) }

  end
end
