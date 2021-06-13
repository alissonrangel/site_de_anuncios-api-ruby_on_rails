class StatesController < AuthorizationController 
  
  def list
    @states = State.all.order(:id).map do |state|
      {
        _id: "#{state.id}",
        name: state.name
      }
    end
    render json: { states: @states }
  end

end