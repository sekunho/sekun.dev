defmodule Sekun.Repo.Migrations.CreateProjectEntry do
  use Ecto.Migration

  def change do
    create table(:project_entry) do
      add :title, :string
      add :description, :string
      add :github_owner, :string
      add :github_repo, :string
      add :website_url, :string
      add :icon, :string
      add :media, :string
      add :learnings_url, :string
      add :youtube_url, :string
      add :featured?, :boolean
      add :tags, {:array, :string}

      timestamps()
    end
  end
end
