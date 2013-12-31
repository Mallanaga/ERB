class BoxesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: boxes.total_count,
      iTotalDisplayRecords: boxes.total_count,
      aaData: data
    }
  end

private

  def data
    boxes.map do |b|
      [
        link_to(b.uin, [b.box, b], target: '_blank'),
        b.active,
        b.locations.size
      ]
    end
  end

  def boxes
    @boxes ||= fetch_boxes
  end

  def fetch_boxes
    box = Box.find(params[:box_id])
    boxes = box.unique_numbers.order("#{sort_column} #{sort_direction}").page(page).per(per_page)
    if params[:sSearch].present?
      if Rails.env.production?
        boxes = boxes.where("uin ILIKE :search", search: "%#{params[:sSearch]}%")
      else
        boxes = boxes.where("uin LIKE :search", search: "%#{params[:sSearch]}%")
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
    columns = %w[uin]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end