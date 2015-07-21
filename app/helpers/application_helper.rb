module ApplicationHelper

  def number_generator(obj_data)
    if (obj_data.count != 0 ) and (/\/\d{2}\//.match(obj_data.last.number).to_s == "/#{Date.today.strftime("%m")}/") then
      number = "#{/\d+/.match(obj_data.last.number).to_s.to_i + 1}/#{Date.today.strftime("%m/%y")}"
    else
      number = "1/#{Date.today.strftime("%m/%y")}"
    end
  end

end
