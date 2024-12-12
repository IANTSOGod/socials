defmodule Socials.HelloChannel do
  use Phoenix.Channel

  def join("hello:lobby", _params, socket) do
    send(self(), :greet)
    {:ok, socket}
  end

  def handle_info(:greet, socket) do
    push(socket, "greet", %{"message" => "Bonjour"})
    {:noreply, socket}
  end

  # def handle_in("message", %{"text" => "bonjour"}, socket) do
  #   push(socket, "response", %{"message" => "bonjour"})
  #   {:noreply, socket}
  # end
end
