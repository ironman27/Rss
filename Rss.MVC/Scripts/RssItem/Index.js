$(document).ready(function () {
});

$('#pager').on('click', 'a', function (e) {
    e.preventDefault();
    $.ajax({
        url: this.href,
        type: 'POST',
        cache: false,
        success: function (result) {
            $('#results').html(result);
        }
    });
});