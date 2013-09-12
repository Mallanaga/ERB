class BoxesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Box.count,
      iTotalDisplayRecords: boxes.total_count,
      aaData: data
    }
  end

private

  def data
    boxes.map do |box|
      [
        link_to(box.uid, box, target: '_blank'),
        box.in - box.out,
        box.out,
        box.trips / box.in
      ]
    end
  end

  def boxes
    @boxes ||= fetch_boxes
  end

  def fetch_boxes
    company_id = params[:company_id]
    user = User.find(params[:user_id])
    current_user = User.find(params[:current_user_id])
    company = current_user.admin? ? Company.find(company_id) : user.company
    boxes = company.boxes.order("#{sort_column} #{sort_direction}").page(page).per(per_page)
    if params[:sSearch].present?
      if Rails.env.production?
        boxes = boxes.where("uid ILIKE :search", search: "%#{params[:sSearch]}%")
      else
        boxes = boxes.where("uid LIKE :search", search: "%#{params[:sSearch]}%")
      end
    end
    boxes
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[uid]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end