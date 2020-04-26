module Web
  module Controllers
    module Books
      class Index
        include Web::Action

        expose :books

        def initialize(interactor: BooksInteractor::List.new)
          @interactor = interactor
        end

        def call(params)
          @books = @interactor.call.books
        end
      end
    end
  end
end
