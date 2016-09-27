class AssignmentResource < MiddlemanContentResource
  attr_reader :due_date, :due_time, :points, :category, :deliverables, :type,
    :requirements
  def initialize(resource)
    super(resource)
    @due_time = resource.data.due_time || '11:59 PM'
    @_due_date = resource.data.due_date
    @due_date = Chronic.parse(@_due_date)
    @points = resource.data.points
    @category = resource.data.category
    @deliverables = Array(resource.data.deliverables)
    @requirements = Array(resource.data.requirements)
    @type = resource.data.type || 'Homework'
  end


  def friendly_deadline
    "#{@due_date.strftime('%A, %B %-d')} at #{@due_time}"
  end

  def friendly_short_deadline
    "#{@due_date.strftime('%b %-d')}, #{@due_time}"
  end
end

