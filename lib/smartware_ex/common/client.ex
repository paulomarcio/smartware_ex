defmodule SmartwareEx.Common.Client do
  import Ecto.Query, only: [from: 2]

  alias SmartwareEx.Schemas.Client
  alias SmartwareEx.Repo

  def get do
    Repo.all(
      from(
        c in Client,
        where: c.wca == 1,
        select: c,
        preload: :provider
      )
    )
  end
end