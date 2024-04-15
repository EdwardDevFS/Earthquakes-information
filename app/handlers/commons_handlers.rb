class CommonsHandlers
    
    def self.paginate(data, perpage, page, total)
        offset = perpage.to_i * (page.to_i - 1) ;
        @data_paginaded = data.limit(perpage).offset(offset)

        return {
            data: @data_paginaded,
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

