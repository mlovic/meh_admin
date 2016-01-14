class CalendarsController < ApplicationController
  def show
  end

  def all_classes
    params[:start] && params[:end] or raise 'No start and end params'

    @classes = 
      Group.all.flat_map do |group|
        group.classes_between Time.parse(params[:start]), 
                              Time.parse(params[:end])
      end
    p @classes.first
    p @classes.first.class

    respond_to do |format|
      #format.html
      format.json { render 'classes' }
    end
  end

end
