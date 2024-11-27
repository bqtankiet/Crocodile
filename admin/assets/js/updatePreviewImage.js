function updatePreviewImage(input, index) {
    const file = input.files[0]; // Lấy tệp đầu tiên từ input
    const preview = input.closest('.upload-image').querySelector('.preview');
    const addIcon = input.closest('.upload-image').querySelector('.add-img-icon');
    addIcon.classList.add('d-none');
    // preview.src = e.target.result; // Gán nội dung file vào thuộc tính `src`
    preview.src = URL.createObjectURL(file);
    // active next upload image
    document.querySelector(`.upload-image.disabled`).classList.remove('disabled');
}