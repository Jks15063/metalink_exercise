# MetalinkExercise

To run the project and view the top 10 OpenSea collections by `floor_price`:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install` inside the `assets` directory
  * Start Phoenix endpoint with `mix phx.server`
  * Visit [`localhost:4000/opensea`](http://localhost:4000/opensea).
  * The page may display as blank for a few seconds after startup.  The genserver makes a request to the Opensea `collections` endpoint every 5 seconds and broadcasts the top 10 list using Phoenix pubsub which is subscribed to by the liveview page.  It doesn't usually change every 5 seconds, but if you stare at it for a minute you should see a few updates.
  
  The Opensea API docs state that you need to request an API key to use their API.  I requested a key several days ago and have not recieved a response of any kind.  However, the API is sending me responses without it.  This may explain the problem with the `collections` endpoint.

  The Opensea `collections` endpoint returns 0s for all stats and the `stats` endpoint returns stats for a single, specified collection.  So to actually find the top 10 collections by `floor_price` using their API with it's current functionality, I would need to call `collections` and then request `stats` for each one.  I decided not to do this.  My implementation sorts the collections received back from the `collections` endpoint in decending order, but every `floor_price` is 0 so it really just displays a random 10 collections.  The test I wrote shows that it would sort them correctly if the stats were correct.
  
  I asked about the `collections` endpoint and the stats in the Opensea discord several times and was basically told, "that's the way it works".  So I'm not sure having an API key would change anything.

