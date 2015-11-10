class LogBeforeTimeout
  def initialize(app)
    @app = app
  end

  def call(env)
    thr = Thread.new do
      sleep(UNICORN_TIMEOUT - 1) # set this to Unicorn timeout - 1
      unless Thread.current[:done]
        path = env["PATH_INFO"]
        qs = env["QUERY_STRING"] and path = "#{path}?#{qs}"
        Rails.logger.warn "#{path} I’m about to timeout bringing down my unicorn worker too :("
      end
    end
    @app.call(env)
  ensure
    thr[:done] = true
    thr.run
  end
end