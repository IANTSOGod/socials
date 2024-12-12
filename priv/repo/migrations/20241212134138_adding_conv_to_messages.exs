defmodule Socials.Repo.Migrations.AddingConvToMessages do
  use Ecto.Migration

  def change do
    alter table (:message) do
      add :conv_id, references(:conversation, on_delete: :nothing)
    end

  end

end
