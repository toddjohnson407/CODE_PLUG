module ApplicationHelper

  def self.get_image_name_from_subject(subject)
    case subject
    when "c++"
      "c.png"
    when "html/css"
      "html.png"
    else
      subject + ".png"
    end
  end
end
