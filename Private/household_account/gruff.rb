require 'gnuplot'

=begin #gnuplot is output graph

Gnuplot.open do |gp|
  Gnuplot::Plot.new(gp) do |plot|
    plot.xrange "[-3:3]"
    f = "x ** 4 + 2 * 5 ** 3 - 10 * x ** 2 + 5 * x  + 4"
    plot.data << Gnuplot::DataSet.new(f)
  end
  gets
end

=end