require 'lib/hash_resource'
class ScheduleResource < MiddlemanContentResource
  attr_reader :agenda, :week_number
  def initialize(resource, agenda)
    super(resource)
    # # _a = Array(resource.data.agenda)
    # @agenda = _a.map{|a| HashResource.new(a) }
    @agenda = agenda
    @week_number = resource.data.week_number
  end
end
