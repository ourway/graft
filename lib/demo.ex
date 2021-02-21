defmodule MyMapMachine do
    @moduledoc false
    use Graft.Machine

    @impl Graft.Machine
    def init([]) do
        {:ok, %{}}
    end

    @impl Graft.Machine
    def handle_entry({:get, key}, state) do
        {state, Map.get(state, key)}
    end

    def handle_entry({:put, key, value}, state) do
        {Map.put(state, key, value), :ok}
    end

    def handle_entry(_default, state) do
        {state, :error}
    end
end
