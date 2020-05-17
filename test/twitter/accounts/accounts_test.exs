defmodule Twitter.AccountsTest do
    use Twitter.DataCase

    alias Twitter.Accounts

    describe "users" do
        alias Twitter.Accounts.User

        @valid_attrs %{email: "some_email", password_hash: "some_password_hash", username: "some_username"}

        def user_fixture(attrs \\ %{}) do
            {:ok, user} =
                attrs
                |> Enum.into(@valid_attrs)
                |> Accounts.create_user()

            user
        end

        test "create_user with valid data creates a user" do
            assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
            assert user.email == "some_email"
            assert user.password_hash == "some_password_hash"
            assert user.username == "some_username"
        end

    end
end
