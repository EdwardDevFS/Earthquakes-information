class Api::Features::CommentsController < ApplicationController
    def index
        @comments = Comment.where(earthquake_id: params[:feature_id])
        render json: { data: @comments, message: "Comments of Earthquake feature" }, status: 200
    end 

    def create
        @comment = Comment.new(earthquake_id: params[:feature_id], description: params[:comment])
        if @comment.description.present? && @comment.save
            render json: { data: [], message: "Comment created successfully" }, status: :created
        else
            render json: { errors: ["Description can't be blank"], message: "Failed to create comment" }, status: :unprocessable_entity
        end
    end
    
end
