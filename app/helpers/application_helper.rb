module ApplicationHelper
  def nav_link_class(page_name)
    if @active_nav_item == page_name
      'block py-2 px-3 text-white bg-lime-700 rounded'
    else
      'block py-2 px-3 text-gray-400 rounded hover:bg-gray-700 hover:text-white'
    end
  end
end
