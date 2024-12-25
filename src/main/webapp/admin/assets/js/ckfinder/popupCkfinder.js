function popupCkfinder(startupPath, callback) {
    CKFinder.popup({
        connectorPath: '/crocodile/ckfinder/connector',
        connectorLanguage: 'java',
        chooseFiles: true,
        rememberLastFolder: false,
        startupPath: startupPath || 'Images:/',
        onInit: function(finder) {
            handleCKFinderEvents(finder, callback);
        },
    });
}

function handleCKFinderEvents(finder, callback) {
    finder.on('files:choose', function(evt) {
        const file = evt.data.files.first();
        const fileUrl = file.getUrl();
        callback(fileUrl);
    });

    finder.on('file:choose:resizedImage', function(evt) {
        const fileUrl = evt.data.resizedUrl;
        callback(fileUrl);
    });
}