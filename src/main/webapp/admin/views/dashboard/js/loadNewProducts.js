export function loadNewProducts() {
    $.ajax({
        url: newProductsUrl,
        method: "GET",
        success: function(data){
            $('#newProductsContainer').html(data);
        },
        error: function(err){
            console.log(err);
        }
    });
}