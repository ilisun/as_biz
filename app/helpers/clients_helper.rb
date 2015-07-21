module ClientsHelper


  def type_name(type_structure)
    if type_structure == 0
      return 'Юр. лицо'.html_safe
    elsif type_structure == 1
      return 'ИП'.html_safe
    elsif type_structure == 2
      return 'Физ. лицо'.html_safe
    end
  end

  def render_name(type_structure)
    if type_structure == 0
      return render 'clients/show_entity'
    elsif type_structure == 1
      return render 'clients/show_individual_entrep'
    elsif type_structure == 2
      return render 'clients/show_individual'
    end
  end



end
