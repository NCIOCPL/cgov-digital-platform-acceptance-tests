export function extractImgName(imageFullName) {
    let str = '';
    for (let i = 0; i < imageFullName.length; i++) {
        let stringToRemove = '';
        if (imageFullName.charAt(i) === '/') {
            for (let j = i; j < imageFullName.length; j++) {
                stringToRemove += imageFullName.charAt(j);
                if (imageFullName.charAt(i + 1) === '/') {
                    return;
                }
            }
            str = stringToRemove;
        }
    }
    return str;
}