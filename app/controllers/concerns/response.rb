# app/controllers/concerns/response.rb
module Response
  def json_response(object, status = :ok)
    render json: object, status: status
  end

  def jason_message(name, value)
    ('{"' + name + '":"' + value + '"}')
  end
end