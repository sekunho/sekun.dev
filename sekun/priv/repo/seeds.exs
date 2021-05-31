# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Sekun.Repo.insert!(%Sekun.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Sekun.Repo
alias Sekun.Projects.Entry

Repo.insert!(%Entry{
      id: 1,
      title: "Angelazy Doodles",
      description: "The official portfolio & catalogue of Angelazy Doodles",
      github_owner: nil,
      github_repo: nil,
      icon: "",
      media: "/images/projects/angelazydoodles.jpg",
      website_url: "https://angelazydoodles.com",
      learnings_url: nil,
      featured?: true,
      tags: ["elixir", "phoenix", "liveview", "docker", "tailwindcss", "strapi", "sqlite3"]
})

Repo.insert!(%Entry{
      id: 2,
      title: "swapi",
      description: "swapi-client is a Haskell client library for the Star Wars API",
      github_owner: "sekunho",
      github_repo: "swapi",
      icon: "",
      media: "/images/projects/swapi.png",
      website_url: nil,
      learnings_url: nil,
      featured?: true,
      tags: ["haskell", "api-client"]
})

Repo.insert!(%Entry{
      id: 3,
      title: "FENGEN",
      description: "Generate Forsyth-Edward notations from chess board images",
      github_owner: "sekunho",
      github_repo: "fen_gen",
      icon: "",
      media: "/images/projects/fen_gen.gif",
      website_url: nil,
      learnings_url: nil,
      featured?: true,
      tags: ["elixir", "python", "tensorflow", "phoenix", "liveview", "tailwindcss"]
})

Repo.insert!(%Entry{
      id: 4,
      title: "Butler",
      description: "An automated to-do scheduler based on your availability",
      github_owner: "butlerph",
      github_repo: "butler",
      icon: "",
      media: "/images/projects/butler.jpg",
      website_url: nil,
      learnings_url: nil,
      featured?: true,
      tags: ["elixir", "phoenix", "liveview", "alpinejs", "tailwindcss", "postgresql"]
})

Repo.insert!(%Entry{
      id: 5,
      title: "sekun.dev",
      description: "Something something recursion",
      github_owner: "sekunho",
      github_repo: "sekun.dev",
      icon: "",
      media: "/images/projects/sekun.png",
      website_url: "https://sekun.dev/",
      learnings_url: nil,
      featured?: true,
      tags: ["elixir", "phoenix", "liveview", "tailwindcss", "sqlite3", "fly.io"]
})
