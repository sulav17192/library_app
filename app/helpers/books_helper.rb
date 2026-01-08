module BooksHelper
    def formatted_author(book)
        if book.rating.to_i > 4
            "Masterepiece by #{book.author}"
        else
            "by #{book.author}"
        end
    end
end
