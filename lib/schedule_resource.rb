require 'lib/hash_resource'
class ScheduleResource < MiddlemanContentResource
  attr_reader :agenda
  def initialize(resource, agenda)
    super(resource)
    # # _a = Array(resource.data.agenda)
    # @agenda = _a.map{|a| HashResource.new(a) }
    @agenda = agenda
  end
end
