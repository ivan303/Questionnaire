module ApplicationHelper

  def bootstrap_class_for (flash_type)
    case flash_type
      when "success"
        "alert-success"
      when "alert"
        "alert-warning"
      when "notice"
        "alert-info"
      when "error"
        "alert-danger"
      else
        flash_type.to_s
    end
  end

  def sortable (column, title)
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"
    if column == params[:sort]
      if direction == "asc"
        link_to non_alphabetical(title), :sort => column, :direction => direction
      else
        link_to alphabetical(title), :sort => column, :direction => direction
      end
    else
      link_to title, :sort => column, :direction => direction
    end

  end

  def alphabetical (title)
    content_tag(:span, title) + " " + content_tag(:span, "", class: "glyphicon glyphicon-sort-by-alphabet")
  end

  def non_alphabetical (title)
    content_tag(:span, title) + " " + content_tag(:span, "", class: "glyphicon glyphicon-sort-by-alphabet-alt")
  end

end
