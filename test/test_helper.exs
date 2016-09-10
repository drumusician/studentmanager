ExUnit.configure(
  exclude: [pending: true],
  async: true)

ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Studentmanager.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Studentmanager.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Studentmanager.Repo)

