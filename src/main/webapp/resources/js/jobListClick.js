$(function(){

  $('td.hide-html-tag *').css({
    'display': 'none',
  })

  $('.jobmodal-tbl1 tbody tr').css({ 'cursor': 'pointer', });
  $('.jobmodal-tbl2 tbody tr').css({ 'cursor': 'pointer', });

  $('.jobmodal-tbl1 > tbody  > tr').on('click', function() {

    addRowEvent($(this));

    $('#jobmodal').modal({
      backdrop: false,
      keyboard: false,
      show: true,
    });
    $('.modal-dialog').draggable({
      handle: ".modal-content",
    });
  });
  $('.jobmodal-tbl2 > tbody  > tr').on('click', function() {

    addRowEvent($(this));

    $('#jobmodal').modal({
      backdrop: false,
      keyboard: false,
      show: true,
    });
    $('.modal-dialog').draggable({
      handle: ".modal-content",
    });
  });


});
