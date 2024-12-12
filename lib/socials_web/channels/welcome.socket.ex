defmodule Socials.UserSocket do
  use Phoenix.Socket

  channel "hello:lobby", Socials.HelloChannel
  channel "message:converse", Socials.SendMessageChannel
  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
