require "formula"

class Word2vec < Formula
  homepage "https://code.google.com/p/word2vec/"
  head "http://word2vec.googlecode.com/svn/trunk/"

  def install
    # Temporarily fixes issues documented upstream, viz.
    # https://code.google.com/p/word2vec/issues/detail?id=1
    inreplace "distance.c", "<malloc.h>", "<stdlib.h>"
    inreplace "word-analogy.c", "<malloc.h>", "<stdlib.h>"
    inreplace "compute-accuracy.c", "<malloc.h>", "<stdlib.h>"

    system "make"
    bin.install "word2vec"
    bin.install "word2phrase"
    bin.install "distance"
    bin.install "word-analogy"
    bin.install "compute-accuracy"
  end

  test do
    system "#{bin}/word2vec"
  end
end
