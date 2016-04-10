var sendUrl = "/ajax/user/users/sendEmail";
var sendButton = $(".send-email");
var emailForm = $("#send-email-form");
var emailModal = $('#send-email-modal');
$(function () {
    sendButton.click(function () {
        emailForm.find(":input").val("");
        emailModal.openModal();
    });

    emailForm.submit(function(){
        $.ajax({
            type: "POST",
            url: sendUrl,
            data: emailForm.serialize(),
            success: function () {
                successNoty("Письмо было успешно отправлено");
                emailModal.closeModal();
            }
        });
        return false
    });


    function successNoty(text) {
        noty({
            text: text,
            type: 'information',
            layout: 'top',
            timeout: 2000,
            animation: {
                open: 'animated bounceInLeft', // Animate.css class names
                close: 'animated bounceOutLeft', // Animate.css class names
                easing: 'swing', // unavailable - no need
                speed: 500 // unavailable - no need
            }
        });
    }

});
