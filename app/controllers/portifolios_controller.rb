class PortifoliosController < ApplicationController
    def index 
        @portfolio_items = Portifolio.all
    end
    def flutter
      @flutter_portfolio_item = Portifolio.flutter
    end
    def new 
        @portfolio_item = Portifolio.new 
        3.times {
          @portfolio_item.technologies.build
        }
    end

    def create
        @portfolio_item = Portifolio.new(params.require(:portifolio).permit(:title,:subtitle, :body,technologies_attributes: [:name]))
    
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portifolios_path, notice: "portfolio_item was successfully created." }
          else
            format.html { render :new, status: :unprocessable_entity }
          end
        end
      end
    
    def edit
        @portfolio_item = Portifolio.find(params[:id])
    end

    def update
      
        @portfolio_item = Portifolio.find(params[:id])
        respond_to do |format| 
          if @portfolio_item.update(params.require(:portifolio).permit(:title,:subtitle, :body))
            format.html { redirect_to portifolios_path, notice: "portfolio_item was successfully updated." }    
          elseend
            format.html { render :edit, status: :unprocessable_entity }
          end
        end
      end
    
    def show
      
      @portfolio_item = Portifolio.find(params[:id])
    end

    def destroy
    
        @portfolio_item = Portifolio.find(params[:id])
        @portfolio_item.destroy
        respond_to do |format|
          format.html { redirect_to portifolios_url, notice: "portifolio item was successfully destroyed." }
        end
    end

    

end
