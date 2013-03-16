setting = (name, value) -> process.env[name] or value

global.settings =

  port: setting 'PORT', 3000
  db_port: setting 'DB_PORT', 27017
  db_server: setting 'DB_Server', 'hetmax_db_server'

settings.db = "#{settings.db_server}:#{settings.db_port}"