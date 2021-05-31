defmodule SekunWeb.Page.HomeLive.Index do
  use Phoenix.LiveView, layout: {SekunWeb.LayoutView, "live.html"}

  import SekunWeb.Component.Card

  alias SekunWeb.Router.Helpers, as: Routes

  @impl true
  def mount(_, _, socket) do
    send(self(), :load_featured_projects)

    {:ok, assign(socket, loading: true), temporary_assigns: [projects: nil]}
  end

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
        <!--
        <h2 class="text-center text-4xl font-serif text-su-fg dark:text-su-dark-fg">
          Featured Projects
        </h2>
        -->

        <div id="featured-projects" class="sm:space-y-24 space-y-16">
          <%= if @loading do %>
            <.card {assigns} loading={@loading} />
            <.card {assigns} loading={true} />
          <% else %>
            <%= for project <- @projects do %>
              <div id={"project - " <> Integer.to_string(project.id)}>
                <.card {assigns}
                  tags={ project.tags }
                  loading={@loading}
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
      <div class="py-24 w-full space-y-4 sm:space-y-12">
        <h2 class="text-4xl font-serif text-su-fg dark:text-su-dark-fg">
          Recent Posts
        </h2>
        <div class="text-su-fg dark:text-su-dark-fg opacity-70">
          Still working on it. It'll be here when it gets here!
        </div>
        <%= if false do %>
          <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 xl:grid-cols-4 gap-6 md:gap-16 w-full">
            <%= for _ <- 1..8 do %>
              <div class="bg-su-bg-alt dark:bg-su-dark-bg-alt h-72 rounded-lg animate-pulse">
              </div>
            <% end %>
          </div>
          <%= live_redirect to: Routes.home_index_path(@socket, :index), class: "hover:animate-pulse flex items-center justify-center space-x-2 text-lg text-su-fg dark:text-su-dark-fg" do %>
            <span>
              View all posts
            </span>
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
              <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 8l4 4m0 0l-4 4m4-4H3" />
            </svg>
          <% end %>
        <% end %>
      </div>
    </div>
    """
  end

  @impl true
  def handle_info(event, socket) do
    socket =
      case event do
        :load_featured_projects ->
          projects = Sekun.Projects.list_featured()

          socket
          |> assign(projects: projects)
          |> assign(loading: false)

        _ -> socket
      end

    {:noreply, socket}
  end

  defp github_url(owner, repo) do
    "https://github.com/#{owner}/#{repo}"
  end
end
