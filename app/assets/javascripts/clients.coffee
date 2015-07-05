# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


#$(document).ready ->
#  $('#datatable-editable').dataTable()
#      'scrollY': '100px'
#      'scrollCollapse': true
#      'paging': false
#  return
$ ->
  $('#datatable-default').dataTable
    processing: false
    serverSide: true
    ajax: $('#datatable-default').data('source')
    pagingType: 'full_numbers'
    oLanguage: {
#      "sProcessing": "<img src='loading.gif'>"
      "sInfo": "Показано c _START_ по _END_ из _TOTAL_ записей"
      "sSearch": ""
      "sLengthMenu": "\_MENU_"
      "sEmptyTable": "Данных нет"
      "oPaginate": {
        "sFirst": "В начало"
        "sPrevious": "<"
        "sNext": ">"
        "sLast": "В конец"
      }
    }


$(document).on "page:change", ->

  $("input[data-radio='radio-org']").click (e) ->
    type = $(this).data('type')
    $('.all-content').find('input:text').val('')
    $(".all-content").hide()
    $("#fieldset-"+type+"-content").show()

    $('#new_client').on 'submit', (e) ->
      e.preventDefault()
      # Сохраняем сслыку на форму
      form = this
      if type == "one"
        name = $("#client_client_entity_attributes_li_company_name").val()
        $("#client_name").val(name)
      else if type == "two"
        name = $("#client_client_individual_entrep_attributes_li_company_name").val()
        $("#client_name").val(name)
      else if type == "three"
        last = $("#client_client_individual_attributes_last_name").val()
        first = $("#client_client_individual_attributes_first_name").val()
        middle = $("#client_client_individual_attributes_middle_name").val()
        $("#client_name").val(last+" "+first+" "+middle)
      form.submit()



  # подставляем по БИК'у имя банка и корр счет
  $("#bik_ent, #bik_ind").change (e) ->
    bik = $("input[id='bik_ent']").val()
    if !bik
      bik = $("input[id='bik_ind']").val()
    banks_path = "/clients/get_banks?bik=#{bik}"
    if bik
      $.ajax banks_path,
        type: 'GET'
        dataType: 'script'

  # подставляем города в селект зная country_id
  $('#client_country_id').change (e) ->
    e.preventDefault()
    country_id = $('#client_country_id :selected').val()
    city_path = "/clients/get_cities?country_id=#{country_id}"
    if country_id
      $.ajax city_path,
        type: 'GET'
        dataType: 'script'



#  удаление в селекте ненужных элементов
#  cities = $('#client_city_id').html()
#  $('#client_country_id').change (e) ->
#    e.preventDefault()
#    country = $('#client_country_id :selected').text()
#    options = $(cities).filter("optgroup[label='#{country}']").html()
#    if options
#      $('#client_city_id').html(options)
#      $('#client_city_id').parent().show()
#    else
#      $('#client_city_id').empty()
#      $('#client_city_id').parent().hide()