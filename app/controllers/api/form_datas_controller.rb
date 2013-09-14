class Api::FormDatasController < ApplicationController

  def update
    @form_data = CompanyInformation.last
    if @form_data.update_attributes(form_parameters)
      render json: @form_data.to_json      
    end
  end

  def show
    render json: CompanyInformation.last.to_json 
  end

  private

    def form_parameters
      params[:form_data].permit(:area, :business_type, :developer_quantity, :designer_quantity,
        :square_feet, :legal_hours, :domain_name_quantity)
    end
end