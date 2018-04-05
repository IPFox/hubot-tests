apiUrl = "https://jsonplaceholder.typicode.com/posts/1"

module.exports = (robot) ->
  robot.respond(/REST/i, (msg) ->
    request = robot.http(apiUrl).header('Accept', 'application/json')
      .get()

    request((err, res, body) ->
      if err
        msg.send("There was some error")
        return

      results = JSON.parse body

      if results?
        respond = "Here's the result from REST Test:\n"
        respond += "Title: " results.title
        msg.send(respond)
      else
        msg.send("Sorry we didn't find anything")
    )
  )