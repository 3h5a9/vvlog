module ApplicationHelper
  
  def full_title(page_title = "")
    base_title = "A simple ruby on rails blog application"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def backtotop
    link_to "", class: 'bttop btn btn-sm btn-danger' do
      fa_icon('hand-pointer')
    end
  end


end
