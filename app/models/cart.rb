class Cart
  attr_reader :session_data

  def initialize(session_data)
    @session_data = session_data || Hash.new(0)
  end

  def data
    data = {}
    session_data.each do |key, value|
      data[Item.find(key)] = value
    end
    data
  end

  def add_item(id)
    eventual_session_data = session_data || Hash.new(0)
    eventual_session_data[id] += 1
    eventual_session_data
  end

end
