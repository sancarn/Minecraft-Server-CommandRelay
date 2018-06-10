require 'webrick'
<<<<<<< HEAD
Dir = File.dirname(__FILE__)
DefaultBody = File.open("#{Dir}/main.html", "r").read
=======
dir = File.dirname(__FILE__)
DefaultBody = File.open(dir + "/main.html", "r").read
>>>>>>> 9146d31267434cf143bad23a50204c157b34dafa

class NullStream
   def <<(o); self; end
end

$server = WEBrick::HTTPServer.new(
  :Port=> 48772,
  :DocumentRoot => Dir.pwd,
  :Logger => WEBrick::Log.new(NullStream.new),  #fixes some bugs...
  :AccessLog => [],
)
trap 'INT' do $server.shutdown end


class RequestHandler < WEBrick::HTTPServlet::AbstractServlet
    def do_GET(request,response)
        if request.path == "/"
            response.body = DefaultBody
        end
    end

    def do_EVAL(request,response)
        $stdout.puts(request.body)
        $stdout.flush
    end
end
$server.mount '/', RequestHandler
$server.start
