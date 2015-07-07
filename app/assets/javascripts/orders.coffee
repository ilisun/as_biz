
$ ->
  $('#datatable-order').dataTable
    processing: false
    serverSide: true
    ajax: $('#datatable-order').data('source')
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

    # работа в модальном окне
    $('#order_client_name').click (e) ->
      $('#select_client').modal('show');
    $('#input_select_client').bind 'keyup', (e) ->
      name = $('#input_select_client').val()
      client_path = "/clients/get_clients?name=#{name}"
      if name
        $.ajax client_path,
          type: 'GET'
          dataType: 'script'
    $('#area_select_client').change (e) ->
      $('#input_select_client').val $('#area_select_client :selected').text()
    # ??? нужно объединить два ожидания ниже
    $('#autos_modal_ok').click (e) ->
      $('#order_client_name').val $('#area_select_client :selected').text()
      $('#order_client_id').val $('#area_select_client :selected').val()
      $('#select_client').modal('hide');
    $('#area_select_client').dblclick (e) ->
      $('#order_client_name').val $('#area_select_client :selected').text()
      $('#order_client_id').val $('#area_select_client :selected').val()
      $('#select_client').modal('hide');
