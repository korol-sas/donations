# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    tabs do
      DonationType.all.each do |type|
        tab type.name do
          div do
            line_chart Donation.where(donation_type: type).group_by_day(:donated_at).count
          end
        end
      end
    end

    columns do
      column do
        panel I18n.t('active_admin.panels.top_donors') do
          ul do
            table_for User.left_joins(:donations).group(:id).order('count(donations.id) DESC').limit(20) do
              column 'User' do |user|
                link_to(user.email, admin_user_path(user))
              end
              column 'Donations' do |user|
                user.donations.count
              end
            end
          end
        end
      end

      column do
        panel I18n.t('active_admin.panels.calendar') do
          div(id: 'donations-calendar') do
          end
        end
      end
    end
  end
end
