defmodule Sekun.Posts do
  def list() do
    {:ok, res} =
      :get
      |> Finch.build("https://blog.sekun.net/index.xml")
      |> Finch.request(MyFinch)

    {:ok, posts} = FastRSS.parse(res.body)

    Enum.take(posts["items"], 8)
  end
end
