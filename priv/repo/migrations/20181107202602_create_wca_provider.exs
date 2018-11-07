defmodule SmartwareEx.Repo.Migrations.CreateWcaProvider do
  use Ecto.Migration

  def change do
    create table(:wca_providers) do
      add :client_id, references(:clients)
      add :eps_id, :string, null: false
      add :uri, :string, null: false
      add :resume, :string, null: false
      add :unblock, :string, null: false
      add :download, :string, null: false

      timestamps(inserted_at: :created_at)
    end
  end
end
