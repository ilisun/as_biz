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

  $("input[data-radio='radio-org']").change (e) ->
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

  # подставляем города в селект зная country_id
  $('#client_country_id').click (e) ->
    e.preventDefault()
    country_id = $('#client_country_id :selected').val()
    city_path = "/clients/get_cities?country_id=#{country_id}"
    if country_id
      $.ajax city_path,
        type: 'GET'
        dataType: 'script'

  # подставляем реквизиты Банка по БИКу
  $('#bik_ent').focusout (e) ->
    e.preventDefault()
    bik_bank = $('#bik_ent').val()
    get_bik_bank = "/clients/get_banks?bik=#{bik_bank}"
    if bik_bank
      $.ajax get_bik_bank,
        type: 'GET'
        dataType: 'script'

  $('#bik_ind').focusout (e) ->
    e.preventDefault()
    bik_bank = $('#bik_ind').val()
    get_bik_bank = "/clients/get_banks?bik=#{bik_bank}"
    if bik_bank
      $.ajax get_bik_bank,
        type: 'GET'
        dataType: 'script'

  $('form#new_client').ready (e) ->
    $("#client_category_0").prop("checked", true)
    $("#client_type_structure_2").click()
    $("#client_service").val('частное лицо')
    $("#client_attraction").val('интернет поиск')
    $('#client_country_id').val('1')
    country_id = $('#client_country_id :selected').val()
    city_path = "/clients/get_cities?country_id=#{country_id}"
    if country_id
      $.ajax city_path,
        type: 'GET'
        dataType: 'script'



