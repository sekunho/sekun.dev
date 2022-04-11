defmodule SekunWeb.Page.HomeLive.Index do
  use Phoenix.LiveView, layout: {SekunWeb.LayoutView, "live.html"}

  import SekunWeb.Component.Card
  import Phoenix.HTML.Link

  alias SekunWeb.Router.Helpers, as: Routes

  @impl true
  def mount(_, _, socket) do
    socket =
      socket
      |> fetch_projects()
      |> fetch_posts()

    {:ok, socket, temporary_assigns: [projects: nil, posts: nil]}
  end

  # TODO: Work on blog section. Thinking of having Phoenix serve the static
  # files that Hakyll generates. Also, parse the RSS feed and display the contents
  # on the recent blog posts section.

  # TODO: Work on the portfolio page. This will be where all of the projects
  # will be if it's not featured. Would be nice to sort by tags, and other filters.

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col items-center py-7 sm:py-14">
      <div class="flex items-center py-12 sm:pt-16 sm:pb-24">
        <div class="flex flex-col items-center">
          <span class="block font-sans text-base text-center text-su-accent-1 font-semibold tracking-wide">
            Hey, I'm
          </span>
          <h1 class="text-center text-6xl sm:text-9xl font-serif text-su-fg dark:text-su-dark-fg">
            SEKUN
          </h1>
          <h2 class="text-lg sm:text-xl text-center text-su-fg dark:text-su-dark-fg opacity-70 w-2/3">
            ...and I like programming languages, Web Dev, and DevOps.
          </h2>
        </div>
      </div>

      <!-- Featured projects section -->
      <div class="min-h-screen space-y-12 w-full">
        <div id="featured-projects" class="sm:space-y-24 space-y-16">
          <%= for project <- @projects do %>
            <div id={"project - " <> Integer.to_string(project.id)}>
              <.card {assigns}
                tags={ project.tags }
                loading={false}
                title={ project.title }
                description={ project.description}
                icon={ project.icon }
                media={ project.media }
                github_owner={ project.github_owner }
                github_repo={ project.github_repo }
                website_url={ project.website_url }
                learnings_url={ project.learnings_url }
                youtube_url={ project.youtube_url }
                github_url={ github_url(project.github_owner, project.github_repo) }
                />
            </div>
          <% end %>

          <!--
          <%= live_redirect to: Routes.home_index_path(@socket, :index), class: "hover:animate-pulse flex items-center justify-center space-x-2 text-lg text-su-fg dark:text-su-dark-fg" do %>
            <span>
              View all
            </span>

            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          <% end %>
          -->
        </div>
      </div>

      <!-- Blog section -->
      <div id="posts" class="py-24 w-full space-y-4 sm:space-y-12">
        <a href="#posts" class="text-4xl font-serif text-su-fg dark:text-su-dark-fg hover:underline">
          Recent Posts
        </a>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-6 md:gap-16 w-full">
          <%= for post <- @posts do %>
            <div class="text-su-fg dark:text-su-dark-fg">
              <a href={post["link"]} class="font-semibold text-2xl font-serif hover:underline">
                <%= post["title"] %>
              </a>
              <p class="font-sans opacity-70 truncate"><%= Phoenix.HTML.raw(post["description"]) %></p>
            </div>
          <% end %>
        </div>
        <%= link to: "https://blog.sekun.dev", class: "hover:animate-pulse flex items-center justify-center space-x-2 text-lg text-su-fg dark:text-su-dark-fg" do %>
          <span>
            View all posts
          </span>
          <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
          </svg>
        <% end %>
      </div>
    </div>
    """
  end

  defp fetch_projects(socket) do
    projects = Sekun.Projects.list_featured()

    assign(socket, projects: projects)
  end

  defp fetch_posts(socket) do
    posts = Sekun.Posts.list()

    assign(socket, posts: posts)
  end

  defp github_url(owner, repo) do
    "https://github.com/#{owner}/#{repo}"
  end
end
