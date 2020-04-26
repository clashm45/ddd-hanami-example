require 'hanami/interactor'

module BooksInteractor
  class List
    include Hanami::Interactor

    expose :books

    def initialize(repository: BookRepository.new)
      @repository = repository
    end

    def call
      @books = @repository.all
    end
  end
end
