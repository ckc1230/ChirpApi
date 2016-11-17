class ChirpsController < ApplicationController
	def index
		render :json => Chirp.all, status: 200
	end
	
	def show
		render :json => Chirp.find(params[:id]), status: 200
	end
	
	def create
        chirp = Chirp.create(chirp_params)

        if chirp.valid?
            render :json => chirp, status: 201
        else
            render :json => {error: "Chirp validation failed"}, status: 400
        end
    end

    def edit
        render :json => Chirp.find(params[:id]), status: 200
    end

    def update
        chirp = Chirp.find(params[:id])
        chirp.update_attributes(chirp_params)

        if chirp
            render :json => {success: "Chirp updated successfully"}, status: 204
        else
            render :json => {error: "Failed to update chirp"}, status: 400
        end
    end

	def destroy
        chirp = Chirp.find(params[:id])

        chirp.destroy

        if chirp.destroyed?
            render :json => {success: "Chirp destroyed successfully"}, status: 204
        else
            render :json => {error: "Error removing chirp"}, status: 400
        end
    end

private

    def chirp_params
        params.require(:chirp).permit(:content)
    end

end
