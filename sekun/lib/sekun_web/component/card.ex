defmodule SekunWeb.Component.Card do
  use Phoenix.Component

  # Components
  import SekunWeb.Component.Tag

  alias SekunWeb.Router.Helpers, as: Routes
  import Phoenix.HTML.Link

  def card (assigns) do
    ~H"""
    <div class="sm:flex md:space-x-4 md:space-x-8">
      <div class="sm:w-1/2 md:w-1/3 flex flex-col justify-center gap-y-2.5 sm:gap-y-4">
        <!--
        <div class="h-12 w-12 sm:h-20 sm:w-20 bg-gray-200 dark:bg-su-dark-fg rounded"></div>
        -->

        <!-- Card title -->
        <%= if @loading do %>
          <h2 class="bg-su-bg-alt dark:bg-su-dark-bg-alt animate-pulse h-12 w-2/3 rounded">
          </h2>
        <% else %>
          <h2 class="text-3xl md:text-5xl text-su-fg opacity-90 dark:text-su-dark-fg font-serif font-medium">
            <%= @title %>
          </h2>
        <% end %>

        <!-- Card description -->
        <%= if @loading do %>
          <p class="h-10 bg-su-bg-alt dark:bg-su-dark-bg-alt rounded">
          </p>
        <% else %>
          <p class="sm:text-lg md:text-xl text-su-fg dark:text-su-dark-fg opacity-70 font-sans">
            <%= @description %>
          </p>
        <% end %>

        <!-- Tags -->
        <%= if not @loading do %>
          <div class="space-y-1">
            <%= for tag <- @tags do %>
              <.tag>
                <%= tag %>
              </.tag>
            <% end %>
          </div>
        <% end %>

        <div class="flex gap-4 opacity-80">
          <%= if assigns[:github_owner] && assigns[:github_repo] do %>
            <%= link to: @github_url, target: "_blank", class: "text-su-fg dark:text-su-dark-fg", title: "GitHub Repo" do %>
              <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24" aria-hidden="true">
                <path fill-rule="evenodd" d="M12 2C6.477 2 2 6.484 2 12.017c0 4.425 2.865 8.18 6.839 9.504.5.092.682-.217.682-.483 0-.237-.008-.868-.013-1.703-2.782.605-3.369-1.343-3.369-1.343-.454-1.158-1.11-1.466-1.11-1.466-.908-.62.069-.608.069-.608 1.003.07 1.531 1.032 1.531 1.032.892 1.53 2.341 1.088 2.91.832.092-.647.35-1.088.636-1.338-2.22-.253-4.555-1.113-4.555-4.951 0-1.093.39-1.988 1.029-2.688-.103-.253-.446-1.272.098-2.65 0 0 .84-.27 2.75 1.026A9.564 9.564 0 0112 6.844c.85.004 1.705.115 2.504.337 1.909-1.296 2.747-1.027 2.747-1.027.546 1.379.202 2.398.1 2.651.64.7 1.028 1.595 1.028 2.688 0 3.848-2.339 4.695-4.566 4.943.359.309.678.92.678 1.855 0 1.338-.012 2.419-.012 2.747 0 .268.18.58.688.482A10.019 10.019 0 0022 12.017C22 6.484 17.522 2 12 2z" clip-rule="evenodd" />
              </svg>
            <% end %>
          <% end %>

          <%= if assigns[:website_url] do %>
            <%= link to: @website_url, target: "_blank", class: "text-su-fg dark:text-su-dark-fg", title: "Project Website" do %>
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9" />
              </svg>
            <% end %>
          <% end %>

          <%= if assigns[:learnings_url] do %>
            <%= link to: @learnings_url, target: "_blank", class: "text-su-fg dark:text-su-dark-fg", title: "What I learned from making this" do %>
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.228 9c.549-1.165 2.03-2 3.772-2 2.21 0 4 1.343 4 3 0 1.4-1.278 2.575-3.006 2.907-.542.104-.994.54-.994 1.093m0 3h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
              </svg>
            <% end %>
          <% end %>

          <%= if assigns[:youtube_url] do %>
            <%= link to: @youtube_url, target: "_blank", class: "text-su-fg dark:text-su-dark-fg", title: "A video of me probably making this" do %>
              <svg class="h-6 w-6" fill="currentColor" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                <path fill="none" d="M0 0h24v24H0z"/>
                <path d="M19.606 6.995c-.076-.298-.292-.523-.539-.592C18.63 6.28 16.5 6 12 6s-6.628.28-7.069.403c-.244.068-.46.293-.537.592C4.285 7.419 4 9.196 4 12s.285 4.58.394 5.006c.076.297.292.522.538.59C5.372 17.72 7.5 18 12 18s6.629-.28 7.069-.403c.244-.068.46-.293.537-.592C19.715 16.581 20 14.8 20 12s-.285-4.58-.394-5.005zm1.937-.497C22 8.28 22 12 22 12s0 3.72-.457 5.502c-.254.985-.997 1.76-1.938 2.022C17.896 20 12 20 12 20s-5.893 0-7.605-.476c-.945-.266-1.687-1.04-1.938-2.022C2 15.72 2 12 2 12s0-3.72.457-5.502c.254-.985.997-1.76 1.938-2.022C6.107 4 12 4 12 4s5.896 0 7.605.476c.945.266 1.687 1.04 1.938 2.022zM10 15.5v-7l6 3.5-6 3.5z"/>
              </svg>
            <% end %>
          <% end %>
        </div>
      </div>

      <div class="mt-2.5 sm:mt-0 sm:w-1/2 md:w-2/3 sm:flex sm:items-center">
        <%= if @loading do %>
          <div class="animate-pulse bg-su-bg-alt dark:bg-su-dark-bg-alt rounded-xl aspect-video shadow-lg dark:shadow-none h-96 w-full">
          </div>
        <% else %>
          <img
            loading="lazy"
            alt={"A photo of the project called " <> @title}
            class="rounded-xl aspect-video shadow-lg dark:shadow-none"
            src={Routes.static_path(@socket, @media)} />
        <% end %>
      </div>
    </div>
    """
  end
end
