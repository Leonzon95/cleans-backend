class ReviewsController < ApplicationController
    before_action :login_required

    def create
        byebug
    end

    private

    def review_params
        parmas.require(:review).permit(:comment, :rating)
    end
end
