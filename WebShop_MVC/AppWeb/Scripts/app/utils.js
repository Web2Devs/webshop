function chunkArray(array, chunkSize) {
    var result = [];
    var currentChunk = [];
    for (var i = 0; i < array.length; i++) {
        currentChunk.push(array[i]);
        if (currentChunk.length == chunkSize) {
            result.push(currentChunk);
            currentChunk = [];
        }
    }
    if (currentChunk.length > 0) {
        result.push(currentChunk);
    }
    return result;
}

appmvc.filter('getById', function () {
    return function (input, id) {
        var i = 0, len = input.length;
        for (; i < len; i++) {
            if (+input[i].id == +id) {
                return input[i];
            }
        }
        return null;
    }
});



alertify.defaults = {
    // dialogs defaults
    modal: true,
    basic: false,
    frameless: false,
    movable: true,
    moveBounded: false,
    resizable: true,
    closable: true,
    closableByDimmer: true,
    maximizable: true,
    startMaximized: false,
    pinnable: true,
    pinned: true,
    padding: true,
    overflow: true,
    maintainFocus: true,
    transition: 'pulse',
    autoReset: true,

    // notifier defaults
    notifier: {
        // auto-dismiss wait time (in seconds)  
        delay: 5,
        // default position
        position: 'bottom-right'
    },

    // language resources 
    glossary: {
        // dialogs default title
        title: 'WebShop',
        // ok button text
        ok: 'OK',
        // cancel button text
        cancel: 'Cancel'
    },

    // theme settings
    theme: {
        // class name attached to prompt dialog input textbox.
        input: 'ajs-input',
        // class name attached to ok button
        ok: 'ajs-ok',
        // class name attached to cancel button 
        cancel: 'ajs-cancel'
    }
};
