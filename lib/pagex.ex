defmodule Pagex do
  @moduledoc """
  Documentation for `Pagex`.
  """

  defmodule Page do
    defstruct [:list, :current_list, :per_page, :current_page]
  end

  def page(list, current_list, per_page, current_page) do
    %Page{
      list: list,
      current_list: current_list,
      per_page: per_page,
      current_page: current_page
    }
  end

  @doc """
  Calc next page.

  ## Examples

      iex> %Pagex.Page{list: [1, 2, 3, 4, 5, 6, 7, 8], current_list: [], per_page: 3, current_page: 0} |> Pagex.next
      %Pagex.Page{
        current_list: [1, 2, 3],
        current_page: 1,
        list: [1, 2, 3, 4, 5, 6, 7, 8],
        per_page: 3
      }

      iex> %Pagex.Page{list: [1, 2, 3, 4, 5, 6, 7, 8], current_list: [], per_page: 3, current_page: 0} |> Pagex.next |> Pagex.next
      %Pagex.Page{
        current_list: [4, 5, 6],
        current_page: 2,
        list: [1, 2, 3, 4, 5, 6, 7, 8],
        per_page: 3
      }

      iex> %Pagex.Page{list: [1, 2, 3, 4, 5, 6, 7, 8], per_page: 3, current_page: 2} |> Pagex.next
      %Pagex.Page{
        current_list: [7, 8],
        current_page: 3,
        list: [1, 2, 3, 4, 5, 6, 7, 8],
        per_page: 3
      }

  """
  def next(%Page{list: list, current_list: _, per_page: per_page, current_page: current_page}) do
    %Page{
      list: list,
      current_list: list |> Enum.slice(current_page * per_page, per_page),
      per_page: per_page,
      current_page: current_page + 1
    }
  end
end
