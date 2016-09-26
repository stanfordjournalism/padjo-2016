class AssignmentResource < MiddlemanContentResource
  attr_reader :due_date, :points, :category
  def initialize(resource)
    super(resource)
    @_due_time = resource.data.due_time || '23:59'
    @_due_date = resource.data.due_date
    @due_date = Chronic.parse("#{@_due_date} #{@_due_time}")
    @points = resource.data.points
    @category = resource.data.category
  end




end

