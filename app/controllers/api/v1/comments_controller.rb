module Api
  module V1

    class CommentsController < ApplicationController
      before_action :set_fabmoment
      before_action :set_comment, only: [:edit, :update, :destroy]

      def index
        @comments = @fabmoment.comments

        render json: @comments
      end

      def create
        respond_to do |format|
          format.js
          format.html
        end
        @comment = @fabmoment.comments.build(comment_params)
        @comment.author = current_user
        authorize @comment, :create?

        if @comment.save
          flash[:notice] = 'Commentaar is succesvol toegevoegd.'
         # redirect_to @fabmoment
        else
          flash.now[:alert] = 'Commentaar is niet toegevoegd.'
          render 'fabmoments/show'
        end
      end

      def edit
        authorize @comment, :edit?

        respond_to :js
      end

      def update
        respond_to do |format|
          format.js
          format.html
        end
        authorize @comment, :update?
        @comment.update(comment_params)


        if @comment.save
          flash[:notice] = 'Commentaar is succesvol toegevoegd.'
        else
          flash.now[:alert] = 'Commentaar is niet toegevoegd.'
        end
      end

      def destroy
        authorize @comment, :destroy?

        @comment.destroy
        flash[:notice] = "Comment is verwijderd."
        # redirect_to @fabmoment
      end

      private

      def set_fabmoment
        @fabmoment = Fabmoment.find(params[:fabmoment_id])
      end

      def comment_params
        params.require(:comment).permit(:text)
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end
    end

  end
end
