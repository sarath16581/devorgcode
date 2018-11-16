trigger debugLog on Account (before insert) {
System.debug('Hello World');
}