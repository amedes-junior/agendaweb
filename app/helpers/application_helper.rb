module ApplicationHelper

  def handle_field(field)
    field.blank? ? "n/d" : field
  end

  def header(title, path)
    header_title = content_tag :div, class: "col-md-6" do
              content_tag :h4, title
            end

    button = (
      content_tag :div, class: "col-md-6 text-right" do
        link_to t("app.new", name: title), path, class: "btn btn-success"
      end
    )
    content_tag :div, class: "well row" do
      concat(header_title)
      concat(button)
    end
  end

  def bootstrap_class_for flash_type
    type = {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }

    type[flash_type.to_sym]
  end

  def messages
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
          concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
          concat message
        end
      )
    end

    nil
  end
end
