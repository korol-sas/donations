# frozen_string_literal: true

ActiveAdmin.register DonationType do
  menu label: proc { I18n.t('active_admin.menu.donation_type') }

  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    column :donations_count do |dt|
      dt.donations.count
    end
    column :created_at
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end
end
