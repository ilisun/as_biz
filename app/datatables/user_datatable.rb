class UserDatatable < AjaxDatatablesRails::Base
  include AjaxDatatablesRails::Extensions::Kaminari

  def_delegators :@view, :link_to, :edit_user_path, :user_path

  def sortable_columns
    @sortable_columns ||= ['users.id']
  end

  def searchable_columns
    @searchable_columns ||= ['users.id']
  end

  private

  def data
    records.map do |record|
      [
          record.id,
          link_to(record.username, user_path(record)),
          record.last_name + ' ' + record.first_name + ' ' + record.middle_name,
          record.w_phone,
          record.email,
          link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_user_path(record)) + '&nbsp&nbsp'.html_safe +
              link_to('<i class="fa fa-trash-o"> </i>'.html_safe, user_path(record), method: :delete, data: { confirm: 'Вы уверены?' }),
      ]
    end
  end

  def get_raw_records
    User.all
  end

end
