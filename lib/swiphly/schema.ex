# Define a module to be used as base
defmodule Swiphly.Schema do
  # from https://stackoverflow.com/questions/58206597/how-to-set-datetime-in-ecto-schemas-and-timestamp-with-time-zone-timestamp
  defmacro __using__(_) do
    quote do
      use TypedEctoSchema

      # ------------------------------------
      @timestamps_opts [type: :utc_datetime_usec]
    end
  end
end
