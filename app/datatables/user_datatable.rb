class UserDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    @view_columns ||= {
      id:         { source: "User.id" },
      user_name: { source: "User.username", cond: :like, searchable: true, orderable: true },
      email:      { source: "User.email" },
      bio:        { source: "User.bio" },
    }
  end

  def data
    records.map do |user|
      [
        record.id,
        record.username,
        record.email,
        record.bio
      ]
    end
  end

  def get_raw_records
    User.all
  end
end
