class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name, :kana_family_name, :kana_first_name, :birthday, :postal_code, :prefecture_id, :city, :street_address, :building, :phone_number, :shoe_size,
                                                      :display_name, :company_name, :family_name_in_charge, :first_name_in_charge, :kana_family_name_in_charge, :kana_first_name_in_charge, :mobile_number])
  end

  def set_style_search_query
    @p = Style.ransack(params[:q])
    @styles = @p.result(distinct: true)
  end

end
