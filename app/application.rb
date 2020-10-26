class Application

  @@cart = ["Apples","Carrots","Pears"]

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/cart/)
      @@cart.each do |item|
        resp.write "#{item}\n"
      end
    elsif req.path.match(/search/)
      search_term = req.params["q"]
      resp.write handle_search(search_term)
    else
      resp.write "Path Not Found"
    end

    resp.finish
  end

  def handle_search(search_term)
    if @@cart.include?(search_term)
      return "#{search_term} is in your cart"
    else
      return "Couldn't find #{search_term}"
    end
  end
end


# class Application

#   @@items = ["Apples","Carrots","Pears"]

#   def call(env)
#     resp = Rack::Response.new
#     req = Rack::Request.new(env)

#     if req.path.match(/items/)
#       @@items.each do |item|
#         resp.write "#{item}\n"
#       end
#     elsif req.path.match(/search/)

#       search_term = req.params["q"]

#       if @@items.include?(search_term)
#         resp.write "#{search_term} is one of our items"
#       else
#         resp.write "Couldn't find #{search_term}"
#       end

#     else
#       resp.write "Path Not Found"
#     end

#     resp.finish
#   end
# end 