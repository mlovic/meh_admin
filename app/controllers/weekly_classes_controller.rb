class WeeklyClassesController < ApplicationController
  def index
    if params[:group_id]
      @classes = WeeklyClass.where(group_id: params[:group_id])
    else
      @classes = WeeklyClass.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @classes }
    end
  end
end
