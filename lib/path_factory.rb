class PathFactory

  def initialize(from:, to:)
    @from = from
    @to = to
  end

  def all_possible_paths(segments:)
    if segments == nil || segments == []
      []
    else



    end
  end

  private

  def make_path(path_list)
    if path_list.length == 0
      0
    else
      head of array + sum_array(tail of array)
    end
  end
end