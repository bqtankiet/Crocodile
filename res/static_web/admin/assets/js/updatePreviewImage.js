$(document).ready(function () {
   $(document).on('change', '.upload-image input[type="file"]', function (){
       const file = this.files[0];
       $(this).closest('.upload-image').find('.preview').attr('src', URL.createObjectURL(file));0
       $(this).closest('.upload-image').find('.add-img-icon').remove();
       console.log(URL.createObjectURL(file));
   });
});