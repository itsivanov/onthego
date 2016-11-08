window.callbackManager = {
    _callbacks : {},
    push: function(type, callback) {
        this._callbacks[type] = this._callbacks[type] || [];
        this._callbacks[type].push(callback);
    },
    call: function() {
        var args = [];
        Array.prototype.push.apply(args, arguments);
        var type = args.shift();

        if (this._callbacks[type]) {
            for(var i = 0; i < this._callbacks[type].length; i++) {
                this._callbacks[type][i].apply(this, args);
            }
        }
    }
};


$(document).ready(function(){

    var sending = false;

    $(document).on('submit','#loginForm', function(e){
        e.preventDefault();
        if (sending) return false;
        sending  = true;

        $.post('/users/login',
            $('#loginForm').serialize(),
            function(data){
                if (!data.error) {
                    window.callbackManager.call('after-login', data);
                }
                if (data.url) {
                    if (!data.noredirect) {
                        var currentUrl = window.location.pathname;

                        $.pnotify({ text: 'Welcome ' + (data.user.UserInfo.first_name || '') + ' ' + (data.user.UserInfo.last_name || ''), type: 'success'});
                        setTimeout(function() {
                            window.location.href = currentUrl == '/products/cart' ? '/products/checkout' : data.url;
                        }, 2000);

                    } else {
                    }
                }else{
                    $.pnotify({ text: (data.error ? data.error : 'Undefined error'), type: 'warning'});
                }
                sending = false;
                closeAllModal();
            },'json');
    });

    $(document).on('submit','#registerForm', function(e){
        var regButton = $('#registerButton'),
            regLoading = $('#registerLoading');

        e.preventDefault();

        regButton.hide();
        regLoading.show();

        if (sending) return false;
        sending  = true;

        $.post('/users/register',
            $('#registerForm').serialize(),
            function(data){
                if (!data.error) {
                    window.callbackManager.call('after-register', data);
                    window.callbackManager.call('after-login', data);
                }
                sending = false;

                if (!data.error) {
                    $.pnotify({ text: data.msg, type: 'info'});
                    if (!data.noredirect) {
                        $.pnotify({ text: 'Thank you for registering, you will receive an email shortly.', type: 'success'});
                        setTimeout(function() {
                            window.location.href = data.url;
                        }, 2000);
                    } else {
                    }
                } else {
                    regButton.show();
                    regLoading.hide();

                    $.pnotify({ text: data.errorDesc, type: 'error', title: 'Error'});
                }
                closeAllModal();
            },'json');
    });

    $(document).on('submit','#resetForm', function(e){
        e.preventDefault();
        if (sending) return false;
        sending  = true;

        $.post('/users/reset',
            $('#resetForm').serialize(),
            function(data){
                sending = false;

                if (!data.error) {
                    $.pnotify({ text: data.message, type: 'success', title: 'Success'});
                    $('.resetModal').fadeOut();
                } else {
                    $.pnotify({ text: data.errorDesc, type: 'error', title: 'Error'});
                }

            },'json');
    });

    $(document).on('click','.sendShippingForm', function(e){
        e.preventDefault();
        $( ".shippingFormButton" ).trigger( "click" );
    });

    $(document).on('submit','form.feedbackForm', function(e){
        e.preventDefault();
        if (sending) return false;
        sending  = true;

        var $form = $(e.currentTarget);

        $.post('/users/feedback',
            $form.serialize(),
            function(data){
                sending = false;

                if (!data.error) {
                    //$.pnotify({ text: data.message, type: 'success', title: 'Success'});
                    $('.feedbackModal').fadeOut();
                    $('#ButtonFeedback2').click();
                } else {
                    $.pnotify({ text: data.errorDesc, type: 'error', title: 'Error'});
                }

            },'json');
    });

});