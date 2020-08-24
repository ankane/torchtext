require_relative "test_helper"

class DataTest < Minitest::Test
  def test_tokenizer
    tokenizer = TorchText::Data.tokenizer("basic_english")
    tokens = tokenizer.call("You can now install TorchText using pip!")
    expected = ["you", "can", "now", "install", "torchtext", "using", "pip", "!"]
    assert_equal expected, tokens
  end

  def test_ngrams_iterator
    token_list = ["here", "we", "are"]
    ngrams = TorchText::Data::Utils.ngrams_iterator(token_list, 2).to_a
    expected = ["here", "we", "are", "here we", "we are"]
    assert_equal expected, ngrams
  end

  def test_ngrams_iterator2
    token_list = ["here", "we", "are", "!"]
    ngrams = TorchText::Data::Utils.ngrams_iterator(token_list, 2).to_a
    expected = ["here", "we", "are", "!", "here we", "we are", "are !"]
    assert_equal expected, ngrams
  end

  def test_ngrams_iterator3
    token_list = ["here", "we", "are", "!"]
    ngrams = TorchText::Data::Utils.ngrams_iterator(token_list, 3).to_a
    expected = ["here", "we", "are", "!", "here we", "we are", "are !", "here we are", "we are !"]
    assert_equal expected, ngrams
  end
end