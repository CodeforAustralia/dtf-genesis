window.findContractId = function() {
$('.contracts-row').on('click', function(){
    idClick = $(this).attr("data-id");
    // window.open( "http://localhost:3000/contracts/" + idClick, "_self"); //for development <--still need to fix this in the future
    window.open( "http://dtf-genesis.herokuapp.com/contracts/" + idClick, "_self");
  });
};