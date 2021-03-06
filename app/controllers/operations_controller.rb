class OperationsController < ApplicationController
  # authorization via cancan
  load_and_authorize_resource

  def index
  end

  def show
  end

  def destroy
    destroy_and_handle_errors(@operation)
    redirect_to(index_url_with_page_num)
  end

  def clear
    @operations.each do |op|
      op.destroy if can?(:destroy, op)
    end

    redirect_to(index_url_with_page_num)
  end
end
