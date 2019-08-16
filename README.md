# Conference service for Bethel Community's interpreters (visit us at http://bethel.community)

To set up your environment, you need export the following env variables, i.e.

```
# JSON encoded array of phone numbers (as strings)
export INTERPRETERS="[\"+13034567890\",\"+13039087654\"]"

# generate with 'mix phx.gen.secret'
export SECRET_KEY_BASE="very long string"
```

Then start your Phoenix server:

- Install dependencies with `mix deps.get`
- Start Phoenix endpoint with `mix phx.server`

Test with `curl`. Notice that the response depends on whether the 'From' number is one of the interpreters/moderators or not. Make sure that the 'plus' sign is url encoded.

```
curl -d "From=%2B13034567890&To=blah" -X POST http://localhost:4000/interpreter
```

Ready to run in production? [Deploy to Heroku](https://hexdocs.pm/phoenix/heroku.html).
