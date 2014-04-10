== README

Rails example app to reproduce problem with not closing Live Streaming Server Events connection.

Only execute `rails s` and open webpage with console open.

If you want to send some message with Redis to the app use `redis-cli`:

```sh
redis 127.0.0.1:6379> publish events-channel "hello"
```

And you will see "hello" on browser console.
