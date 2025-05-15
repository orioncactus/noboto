const { FONTFAMILY, getFontList, subsets } = require("subset-utils");

const fontList = getFontList(FONTFAMILY.Noboto);

subsets(
    // Noboto woff2
    ["complete", "woff2", fontList]
);
