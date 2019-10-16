class PagesController < ApplicationController
  def index

  end

  def films
    @arr = ["https://www.saporedicina.com/es/wp-content/uploads/2018/01/visita-monte-kailash-700x400.jpeg",
           "https://ywammontana.org/ywammontana.org/watertower-content/uploads/2016/04/happy-700x400.jpeg",
           "https://ywammontana.org/ywammontana.org/watertower-content/uploads/2016/05/doubt2-700x400.jpeg"]
  end

  def toys
    @arr = ["https://www.saporedicina.com/es/wp-content/uploads/2018/01/visita-monte-kailash-700x400.jpeg",
           "https://ywammontana.org/ywammontana.org/watertower-content/uploads/2016/04/happy-700x400.jpeg",
           "https://ywammontana.org/ywammontana.org/watertower-content/uploads/2016/05/doubt2-700x400.jpeg"]
  end

  def gadgets
    @arr = ["https://www.saporedicina.com/es/wp-content/uploads/2018/01/visita-monte-kailash-700x400.jpeg",
           "https://ywammontana.org/ywammontana.org/watertower-content/uploads/2016/04/happy-700x400.jpeg",
           "https://ywammontana.org/ywammontana.org/watertower-content/uploads/2016/05/doubt2-700x400.jpeg"]
  end

  def new

  end

end
