class Public::SegmentsController < ApplicationController

  def show
  end

  private
  
    helper_method :current_segment
  
    def current_segment
      @current_segment ||= Segment.live.find_by_permalink params[:permalink]
    end

end
