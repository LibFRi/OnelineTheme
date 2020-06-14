/* move extension toolbar to panel wrapper */
setTimeout(function wait() {
    const browser = document.getElementById('browser');
    if (browser) {
        const toolbarExtensions = document.querySelector('.toolbar-extensions');
        document.querySelector('.addwebpanel-wrapper').prepend(toolbarExtensions);
    }
    else {
        setTimeout(wait, 300);
    }
}, 300);

