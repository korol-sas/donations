# frozen_string_literal: true

ActiveAdmin.register Donation do
  menu label: proc { I18n.t('active_admin.menu.donation') }

  permit_params :donation_type_id, :user_id, :donated_at

  config.sort_order = 'donated_at_desc'

  index do
    selectable_column
    id_column
    column :user
    column :donation_type
    column :donated_at
    actions
  end

  filter :name
  filter :donation_type
  filter :user
  filter :donated_at

  form do |f|
    f.inputs do
      f.input :donation_type_id, label: 'Donation type', as: :select, collection: DonationType.all
      f.input :user_id, label: 'User', as: :select, collection: User.all
      f.input :donated_at
    end
    f.actions
  end

  collection_action :calendar, method: :get do
    donations = Donation.all
    donations = donations.where(donated_at: params[:start].to_time..params[:end].to_time) if params[:start].present?
    grouped = donations.group_by_day(:donated_at).count
    response = grouped.map do |date, count|
      { title: "#{I18n.t('active_admin.menu.donation')}: #{count}",
        start: date }
    end

    render json: response.as_json
  end

  collection_action :list, method: :get do
    date = DateTime.parse(params[:date])
    donations = Donation.where('donated_at BETWEEN ? AND ?', date.beginning_of_day, date.end_of_day)
                        .preload(:user)
                        .all
    @grouped = donations.group_by(&:user)

    render 'list', layout: false
  end
end
