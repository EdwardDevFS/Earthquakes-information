require 'kaminari'
class CommonsHandlers
    
  def self.paginate(data, perpage, page, total)
      @response = Kaminari.paginate_array(data).page(page).per(perpage)
      return {
          data: @response,
          links: {
              external_url: "https://www.usgs.gov/"
          },
          pagination: {
              current_page: page.to_i,
              per_page: perpage.to_i,
              total: total
          }
      }
  end



end

