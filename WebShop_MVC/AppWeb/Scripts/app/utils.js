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