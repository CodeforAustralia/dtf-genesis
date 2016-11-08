window.findContractId = function() {
$('.contracts-row').on('click', function(){
    idClick = $(this).attr("data-id");
    window.location = ROUTES.CONTRACT_PATH + "/" + idClick;
  });
};