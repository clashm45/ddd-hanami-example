# spec/web/controllers/books/create_spec.rb

RSpec.describe Web::Controllers::Books::Create do
  let(:action) { described_class.new(interactor: interactor) }
  let(:interactor) { instance_double('BooksInteractor::Create', call: nil) }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  context 'with valid params' do
    let(:params) { Hash[book: { title: 'Confident Ruby', author: 'Avdi Grimm' }] }

    it 'calls interactor' do
      expect(interactor).to receive(:call)
      action.call(params)
    end

    it 'redirects the user to the books listing' do
      response = action.call(params)

      expect(response[0]).to eq(302)
      expect(response[1]['Location']).to eq('/books')
    end

    context "persistence" do
      let(:interactor) { BooksInteractor::Create.new }

      it 'creates a new book' do
        action.call(params)
        book = repository.last

        expect(book.id).to_not be_nil
        expect(book.title).to eq(params.dig(:book, :title))
      end
    end
  end

  context 'with invalid params' do
    let(:params) { Hash[book: {}] }

    it 'does not call interactor' do
      expect(interactor).to_not receive(:call)
      action.call(params)
    end

    it 'returns HTTP client error' do
      response = action.call(params)
      expect(response[0]).to eq(422)
    end

    it 'dumps errors in params' do
      action.call(params)
      errors = action.params.errors

      expect(errors.dig(:book, :title)).to eq(['is missing'])
      expect(errors.dig(:book, :author)).to eq(['is missing'])
    end
  end
end