defmodule Sekun.Projects do
  alias Sekun.Repo
  alias Sekun.Projects.Entry

  import Ecto.Query

  def list_featured do
    query =
      from e in Entry,
        where: e.featured? == true

    Repo.all(query)
  end
end
