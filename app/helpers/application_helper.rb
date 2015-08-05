module ApplicationHelper
  include HtmlBuilder

  def document_title
    if @title.present?
      "#{@title} - Outlaw Guild"
    else
      'Outlaw Guild'
    end
  end
end
