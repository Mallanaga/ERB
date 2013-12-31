jQuery ->
  $('#companyBoxList').dataTable
    sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
    sPaginationType: "bootstrap"
    bProcessing: true
    bServerSide: true
    sAjaxSource: $('#companyBoxList').data('source')
    aoColumnDefs: [ { 'bSortable': false, 'aTargets': [ 0,1,2 ] } ]  