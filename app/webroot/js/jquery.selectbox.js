/*
 * jQuery SelectBox Styler v1.0.1
 * http://dimox.name/styling-select-boxes-using-jquery-css/
 *
 * Copyright 2012 Dimox (http://dimox.name/)
 * Released under the MIT license.
 *
 * Date: 2012.10.07
 *
 */

(function($) {
	$.fn.selectbox = function() {
		$(this).each(function() {
			var select = $(this);
			var select_id = this.id;
			if (select.prev('span.selectbox').length < 1) {
				function doSelect() {
					var option = select.find('option');
					var optionSelected = option.filter(':selected');
					var optionText = option.filter(':first').text();
					if (optionSelected.length) optionText = optionSelected.text();
					var ddlist = '';
					for (i = 0; i < option.length; i++) {
                        var optionValue = option.eq(i).val();
						var selected = '';
						var disabled = ' class="disabled"';
						if (option.eq(i).is(':selected')) selected = ' class="selected sel"';
						if (option.eq(i).is(':disabled')) selected = disabled;
						ddlist += '<li' + selected + '  data-value="'+optionValue+'">'+ option.eq(i).text() +'</li>';
					}
					var selectbox =
						$('<span class="selectbox" id="'+select_id+'_id" style="display:block;position:relative">'+
								'<div class="select" style="float:left;position:relative;z-index:10000"><div class="text">' + optionText + '</div>'+
									'<b class="trigger"><i class="arrow"></i></b>'+
								'</div>'+
								'<div class="dropdown" style="position:absolute;z-index:9999;overflow:auto;overflow-x:hidden;list-style:none">'+
									'<ul>' + ddlist + '</ul>'+
								'</div>'+
							'</span>');
					select.before(selectbox).css({position: 'absolute', top: -9999});
					var divSelect = selectbox.find('div.select');
					var divText = selectbox.find('div.text');
					var dropdown = selectbox.find('div.dropdown');
					var li = dropdown.find('li');
					var selectHeight = selectbox.outerHeight();
					dropdown.css({left: 0});
					dropdown.css({top: selectHeight});
					var liHeight = li.outerHeight();
					var position = dropdown.css('top');
					dropdown.hide();
					/* при клике на псевдоселекте */
					divSelect.click(function() {
						/* умное позиционирование */
						//var topOffset = selectbox.offset().top;
						//var bottomOffset = $(window).height() - selectHeight - (topOffset - $(window).scrollTop());
						//if (bottomOffset < 0 || bottomOffset < liHeight * 6)	{
						//	dropdown.height('auto').css({top: 'auto', bottom: position});
						//	if (dropdown.outerHeight() > topOffset - $(window).scrollTop() - 20 ) {
						//		dropdown.height(Math.floor((topOffset - $(window).scrollTop() - 20) / liHeight) * liHeight);
						//	}
						//}
						//else if (bottomOffset > liHeight * 6) {
						//	dropdown.height('auto').css({bottom: 'auto', top: position});
						//	if (dropdown.outerHeight() > bottomOffset - 20 ) {
						//		dropdown.height(Math.floor((bottomOffset - 20) / liHeight) * liHeight);
						//	}
						//}
						$('span.selectbox').css({zIndex: 1}).removeClass('focused');
						selectbox.css({zIndex: 9999});
						if (dropdown.is(':hidden')) {
							$('div.dropdown:visible').slideUp('fast');
                            $('.select.active').removeClass('active');
							dropdown.slideDown('fast');
                            $(this).addClass('active');
                            $(this).next().find('li').on('click', function(){
                                $(this).parents('.dropdown').prev().removeClass('active');
                            });


						} else {
							dropdown.slideUp('fast');
                            $(this).removeClass('active');
						}

						return false;

					});
					/* при наведении курсора на пункт списка 
					li.hover(function() {
						$(this).siblings().removeClass('selected');
					});*/
					var selectedText = li.filter('.selected').text();
					/* при клике на пункт списка */
					li.filter(':not(.disabled)').click(function() {
						var liText = $(this).text();
                        var index_new = $(this).index();
						if ( selectedText != liText ) {
							$(this).addClass('selected sel').siblings().removeClass('selected sel');
                            option.removeAttr('selected');
                            option.eq(index_new).attr('selected', 'selected');
							selectedText = liText;
							divText.text(liText);
                            var liValue = $(this).data('value');
                            select.val(liValue);
							select.change();
						}
						dropdown.slideUp('fast');
					});
					dropdown.mouseout(function() {
						dropdown.find('li.sel').addClass('selected');
					});
					/* фокус на селекте */
					select.focus(function() {
						$('span.selectbox').removeClass('focused');
						selectbox.addClass('focused');
					})
					/* меняем селект с клавиатуры */
					.keyup(function() {
						divText.text(option.filter(':selected').text());
						li.removeClass('selected sel').eq(option.filter(':selected').index()).addClass('selected sel');
					});
					/* прячем выпадающий список при клике за пределами селекта */
					$(document).on('click', function(e) {
						if (!$(e.target).parents().hasClass('selectbox')) {
							dropdown.slideUp('fast').find('li.sel').addClass('selected');
							selectbox.removeClass('focused');
                            $('.select.active').removeClass('active');
						}
					});
				}
				doSelect();
				// обновление при динамическом изменении
				select.on('refresh', function() {
					select.prev().remove();
					doSelect();
				})
			}
		});
	}
})(jQuery);