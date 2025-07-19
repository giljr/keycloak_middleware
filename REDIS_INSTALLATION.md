### 🧰 Install Redis on Ubuntu

If You’re on Ubuntu Linux, so:

#### 🔷 Step 1: Install
```bash
sudo apt update
sudo apt install redis-server
```
Confirm:
```bash
redis-server --version
```
You should see something like:
```bash
Redis server v=7.2.4 …
```
#### 🔷 Step 2: Start Redis

Start and enable the Redis service:
```bash
sudo systemctl enable redis-server
sudo systemctl start redis-server
```
Check status:
```bash
sudo systemctl status redis-server
```
You should see it active (running).

#### 🔷 Step 3: Test Redis CLI

You can test it:
```bash
redis-cli
127.0.0.1:6379> ping
PONG
```

If you see **PONG**, Redis is running properly.

#### 🔷 Step 4: Run your Rails app

Now you can restart your Rails app and it will talk to Redis for session storage.

✅ Summary:
```bash
    Install: sudo apt install redis-server

    Start it: sudo systemctl start redis-server

    Test: redis-cli + ping
```
🚀If RAILS 8 - Use a compatible gem: 

redis-session-store

✅ The redis-session-store gem works well and is Rails 8-compatible.

Run:
```bash
bundle add redis-session-store
```
then in your `config/initializers/session_store.rb` use:
```bash
Rails.application.config.session_store :redis_session_store,
  servers: [
    {
      host: ENV.fetch("REDIS_HOST", "localhost"),
      port: ENV.fetch("REDIS_PORT", 6379),
      db: ENV.fetch("REDIS_DB_SESSION", 0),
      namespace: "sessions"
    }
  ],
  key: "_keycloak_app_session",
  expire_after: 90.minutes
```
✅ Note the symbol: `:redis_session_store`.

## Authors

- [@jaythree](https://medium.com/jungletronics)


## License

[MIT](https://choosealicense.com/licenses/mit/)

