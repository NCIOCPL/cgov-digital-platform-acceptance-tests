export function getClickBeacon(storage) {
    let clickBeacon;
    for (let i = 0; i < storage.length; i++) {
        const singleBeacon = storage[i];
        if (!(singleBeacon.linkType === undefined)) {
            if (singleBeacon.linkType.includes('lnk_o') && !singleBeacon.pev2.includes('Resized')) {
                clickBeacon = singleBeacon;
            }
        }
    }    
    
    return clickBeacon;
}