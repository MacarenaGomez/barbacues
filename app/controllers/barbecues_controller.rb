class BarbecuesController < ApplicationController
  def index
    @barbecues = Barbecue.order(:date)
  end

  def show
    # Don't add any code to this show action.
    # Implement your barbecue API in another action.
  end

  def json
    barbecue = Barbecue.find_by(id: params[:id])
    render json: barbecue
  end

  def join
    bbq = Barbecue.find_by(id: params[:id])
    user = bbq.users << current_user
    
    render(json: user, status: 200)
  end

  def new
    @bbq = Barbecue.new
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end
end
