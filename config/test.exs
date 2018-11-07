use Mix.Config

config :smartware_ex, SmartwareEx.Repo,
       username: "root",
       password: "root",
       database: "smartware",
       hostname: "localhost",
       pool: Ecto.Adapters.SQL.Sandbox