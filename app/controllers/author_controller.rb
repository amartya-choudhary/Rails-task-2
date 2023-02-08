class AuthorController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        if params[:author_id]
            author = Author.find(params[:author_id])
            # author["books"] = author.books
            render json: {:author_details => author, :author_books => author.books}
        else
            render json: Author.all()
        end
    end

    def create
        render json: Author.create(name: params[:name], email: params[:email], phone: params[:phone], date_of_birth: params[:dob])
    end

    def update
        author = Author.find(params[:id])
        if(params[:name])
            author.name = params[:name]
        end
        if params[:email]
            author.email = params[:email]
        end
        if params[:dob]
            author.category = params[:category]
        end
        if params[:phone]
            author.phone = params[:phone]
        end
        author.save
        render json: author
    end

    def delete
        Author.destroy_by(id: params[:id])
        render json: Author.all()
    end
end
