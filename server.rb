require 'webrick'
server = WEBrick::HTTPServer.new({
  :DocumentRoot => '.',
  :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
  :Port => '3000',
})
['INT', 'TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}
server.mount('/', WEBrick::HTTPServlet::ERBHandler, 'index.html.erb')
server.mount('/all.cgi', WEBrick::HTTPServlet::ERBHandler, 'all.html.erb')
server.mount('/poor.cgi', WEBrick::HTTPServlet::ERBHandler, 'poor.html.erb')
server.start