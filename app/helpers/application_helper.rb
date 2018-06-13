module ApplicationHelper

  def self.get_image_name_from_subject(subject)
    case subject
    when "c++"
      "c"
    when "html/css"
      "html"
    else  
      subject
    end
  end
end
