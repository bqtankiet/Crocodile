var tb = $('table.my-table').DataTable({
    buttons: [
        {
            extend: 'copy',
            exportOptions: {
                columns: ':not(.action-column)'  // Loại bỏ cột có class action-column
            }
        },
        {
            extend: 'excel',
            exportOptions: {
                columns: ':not(.action-column)'
            }
        },
        {
            extend: 'pdf',
            exportOptions: {
                columns: ':not(.action-column)'
            }
        },
        {
            extend: 'print',
            exportOptions: {
                columns: ':not(.action-column)'
            }
        }
    ],
    "ordering": true,
    "columnDefs": [
        { "orderable": false, "targets": [0, -1] } // cột checkbox và action
    ],
    "order": [],
    "language": {
        "search": "Tìm kiếm:",
        "lengthMenu": "Hiển thị _MENU_ mục",
        "info": "Hiển thị _START_ đến _END_ trong tổng số _TOTAL_ mục",
        "paginate": {
            "first": "Đầu",
            "last": "Cuối",
            "next": "Sau",
            "previous": "Trước"
        }
    }
});

$(document).ready(function () {
    $('.dropdown-menu').on('click', '.dropdown-item', function (e) {
        e.preventDefault();

        var action = $(this).data('action');
        if (action) {

            if (action === 'copy') {
                tb.button(0).trigger();
            } else if (action === 'print') {
                tb.button(3).trigger();
            } else if (action === 'excel') {
                tb.button(1).trigger();
            } else if (action === 'pdf') {
                tb.button(2).trigger();
            }
        }
    });
});