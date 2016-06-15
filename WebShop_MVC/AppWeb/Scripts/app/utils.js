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