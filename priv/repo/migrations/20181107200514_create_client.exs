defmodule SmartwareEx.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string, null: false
      add :wca, :boolean, default: false, null: false

      timestamps(inserted_at: :created_at)
    end
  end
end
