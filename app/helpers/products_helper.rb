module ProductsHelper
    def form_title
        @product.new_record? ? "Publicar Producto" : "Modificar Producto"
    end

    def header_style
        if @product.photo.attached?
            %{ style="background-image: linear-gradient( rgba(0,0,0,0.5), rgba(0,0,0,0.5)), url('#{url_for(@product.photo)}'); background-size: cover; background-position: center;"}.html_safe
        else
            ""
        end
    end
end