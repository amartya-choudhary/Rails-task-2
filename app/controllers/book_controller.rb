class BookController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        books = Book.includes(:author)
        # books = Author.select('*').joins(:books)
        render json: books.to_json(include: [:author])
    end

    def create
        author = Author.find(params[:author_id])
        book = author.books.create(title: params[:title], isbn: params[:isbn], content: params[:content], published_at: params[:published_at], pages: params[:pages]);
        render json: book
    end

    def update
        book = Book.find(params[:id])
        if(params[:isbn])
            book.isbn = params[:isbn]
        end
        if params[:title]
            book.title = params[:title]
        end
        if params[:content]
            book.content = params[:content]
        end
        if params[:published_at]
            book.published_at = params[:published_at]
        end
        if params[:pages]
            book.pages = params[:pages]
        end

        book.save
        render json: book
    end

    def delete
        Book.destroy_by(id: params[:id])
        render json: Book.all()
    end
end
