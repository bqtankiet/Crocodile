<style>
    #modalLogDetail {
        margin: 0 auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    #modalLogDetail p {
        margin-bottom: 10px;
        font-size: 16px;
    }

    #detailTable {
        width: 100%;
        max-width: 100%;
        overflow-x: auto;
        margin-top: 20px;
    }

    .table {
        width: 100%;
        table-layout: auto;
        border-collapse: collapse;
        border: 1px solid #ddd;
    }

    .table th, .table td {
        padding: 12px 15px;
        text-align: left;
        font-size: 14px;
        border-bottom: 1px solid #ddd;
        word-wrap: break-word;
    }

    .table th {
        background-color: #f8f8f8;
        font-weight: bold;
        color: #333;
    }

    .table td {
        max-width: 30ch;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
        color: #555;
    }

    .table-bordered {
        border: 1px solid #ddd;
    }

    .badge-create {
        background-color: #28a745;
        color: white;
        padding: 5px 10px;
        border-radius: 12px;
        font-size: 14px;
    }

    .badge-update {
        background-color: #ffc107;
        color: white;
        padding: 5px 10px;
        border-radius: 12px;
        font-size: 14px;
    }

    .badge-delete {
        background-color: #dc3545;
        color: white;
        padding: 5px 10px;
        border-radius: 12px;
        font-size: 14px;
    }

    .badge-new {
        background-color: #28a745;
        color: white;
        padding: 5px 10px;
        border-radius: 12px;
        font-size: 14px;
    }

    .badge-old {
        background-color: #dc3545;
        color: white;
        padding: 5px 10px;
        border-radius: 12px;
        font-size: 14px;
    }

    .action-section {
        margin-bottom: 15px;
        font-size: 16px;
        font-weight: bold;
        color: #007bff;
    }
</style>

<div id="modalLogDetail">
    <div class="action-section">
        <p>Event ID: <span id="detail_eventId"></span></p>
        <p>Table: <span id="detail_tableName"></span></p>
        <p>Action: <span id="detail_action"></span></p>
    </div>
    <div id="detailTable">
    </div>
</div>

<script>
    function fetchLogDetailData(eventId) {
        $.ajax({
            url: 'http://localhost:8080/api/admin/log-detail',
            type: 'GET',
            data: {eventId: eventId},
            dataType: 'json',
            success: function (data) {
                renderModal(data);
            },
            error: function (xhr, status, error) {
                // console.error("Error:", error);
                console.log("Error Message:", xhr.responseText);
                // Nếu có lỗi (không tìm thấy dữ liệu), hiển thị thông báo
                $('#modalLogDetail').html("<p style='color: red; font-size: 16px;'>Don't have detail for eventId: " + eventId + "</p>");
            }
        });
    }

    function renderModal(data) {
        const $modal = $('#modalLogDetail');

        // event id
        $modal.find('#detail_eventId').text(data.metadata['eventId']);

        // table name
        $modal.find('#detail_tableName').text(data.metadata['tableName']);

        // Tạo badge cho Action (CREATE, UPDATE, DELETE)
        let actionBadge = '';
        if (data.metadata['action'] === 'CREATE') {
            actionBadge = '<span class="badge-create">CREATE</span>';
        } else if (data.metadata['action'] === 'UPDATE') {
            actionBadge = '<span class="badge-update">UPDATE</span>';
        } else if (data.metadata['action'] === 'DELETE') {
            actionBadge = '<span class="badge-delete">DELETE</span>';
        }
        $modal.find('#detail_action').html(actionBadge);

        const keys = data.keys;
        const values = data.values;
        renderTable('#detailTable', keys, values);
    }

    function renderTable(selector, keys, values) {
        const table = $('<table class="table table-bordered"></table>');
        const thead = $('<thead></thead>');
        const headerRow = $('<tr></tr>');

        keys.forEach(function (key) {
            const th = $('<th></th>').text(key);
            headerRow.append(th);
        });
        thead.append(headerRow);
        table.append(thead);

        const tbody = $('<tbody></tbody>');
        values.forEach(function (value) {
            const row = $('<tr></tr>');
            keys.forEach(function (key) {
                const td = $('<td></td>');
                let cellValue = value[key] || '';

                // Kiểm tra ô version để thêm badge NEW/OLD
                if (key === 'version') {
                    const versionBadge = cellValue === 'NEW' ?
                        '<span class="badge-new">NEW</span>' :
                        '<span class="badge-old">OLD</span>';
                    td.html(versionBadge);
                } else {
                    td.text(cellValue);
                }

                row.append(td);
            });
            tbody.append(row);
        });
        table.append(tbody);

        $(selector).html(table);
    }
</script>
