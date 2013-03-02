---
---
;{% include js/jquery.min.js %}

$(function() {
    var $dropdown = $('.dropdown-menu');
    $dropdown.each(function(i, el) {
        $(this).hover(function() {
            $(this).addClass('open');
        }, function(e) {
            $(this).removeClass('open');
        });
    });

    $('.dropdown-hover').click(function() {
        return false;
    });
});
