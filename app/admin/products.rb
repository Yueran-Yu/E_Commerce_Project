ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :description, :discount_rate, :is_in_stock, :image, :category_id, :active_image
  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs # builds an input field for every attribute

    f.inputs do
      f.input :active_image, as: :file
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :discount_rate, :is_in_stock, :image, :category_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
