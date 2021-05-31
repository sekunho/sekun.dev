defmodule Sekun.Projects.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "project_entry" do
    field :description, :string
    field :github_owner, :string
    field :github_repo, :string
    field :icon, :string
    field :media, :string
    field :title, :string
    field :website_url, :string
    field :learnings_url, :string
    field :youtube_url, :string
    field :featured?, :boolean
    field :tags, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:title, :description, :github_owner, :github_repo, :website_url, :icon, :media])
    |> validate_required([:title, :description, :icon, :media])
  end
end
