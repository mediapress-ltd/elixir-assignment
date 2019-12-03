defmodule AssignmentWeb.Router do
  use AssignmentWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    # forward "/graphiql", Absinthe.Plug.GraphiQL,
    #   schema: <Enter the name of your Schema here>,
    #   interface: :playground
  end
end
