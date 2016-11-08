$(document).ready(function() {
    var changeTooltipPosition = function (event) {
        var tooltipX = event.pageX - 8;
        var tooltipY = event.pageY + 8;
        $('div.tooltip').css({top: tooltipY, left: tooltipX});
    };

    var showTooltip = function (event) {
        $('div.tooltip').remove();
        var text = $(this).attr('data-hint');
        if(text) {
            $('<div class="tooltip">' + text + '</div>').appendTo('body');
            changeTooltipPosition(event);
        }
    };

    var hideTooltip = function () {
        $('div.tooltip').remove();
    };

    $(".hint").bind({
        mousemove: changeTooltipPosition,
        mouseenter: showTooltip,
        mouseleave: hideTooltip
    });
});