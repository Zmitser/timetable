$(document).ready(function () {
    function show(lang) {
        window.location.href = window.location.href.split('?')[0] + '?lang=' + lang;
    }
    $("#demo02").animatedModal({
        modalTarget: 'modal-02',
        animatedIn: 'lightSpeedIn',
        animatedOut: 'bounceOutDown',
        color: '#3498db'
    });

    $('.particles').particleground({
        dotColor: '#5cbdaa',
        lineColor: '#5cbdaa'
    });
});
(function() {
    var docElem = window.document.documentElement, didScroll, scrollPosition;
    function noScrollFn() {
        window.scrollTo( scrollPosition ? scrollPosition.x : 0, scrollPosition ? scrollPosition.y : 0 );
    }
    function noScroll() {
        window.removeEventListener( 'scroll', scrollHandler );
        window.addEventListener( 'scroll', noScrollFn );
    }
    function scrollFn() {
        window.addEventListener( 'scroll', scrollHandler );
    }
    function canScroll() {
        window.removeEventListener( 'scroll', noScrollFn );
        scrollFn();
    }
    function scrollHandler() {
        if( !didScroll ) {
            didScroll = true;
            setTimeout( function() { scrollPage(); }, 60 );
        }
    }
    function scrollPage() {
        scrollPosition = { x : window.pageXOffset || docElem.scrollLeft, y : window.pageYOffset || docElem.scrollTop };
        didScroll = false;
    }
    scrollFn();
    [].slice.call( document.querySelectorAll( '.morph-button' ) ).forEach( function( bttn ) {
        new UIMorphingButton( bttn, {
            closeEl : '.icon-close',
            onBeforeOpen : function() {
            },
            onAfterOpen : function() {
                canScroll();
            },
            onBeforeClose : function() {
                noScroll();
            },
            onAfterClose : function() {
                canScroll();
            }
        } );
    } );
})();
