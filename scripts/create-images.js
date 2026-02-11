const fs = require('fs');
const path = require('path');

// Create a minimal valid PNG (100x100 solid color)
// PNG structure: signature + IHDR + IDAT + IEND
function createSolidPNG(r, g, b) {
    const width = 600;
    const height = 400;

    // PNG signature
    const signature = Buffer.from([137, 80, 78, 71, 13, 10, 26, 10]);

    // IHDR chunk
    const ihdrData = Buffer.alloc(13);
    ihdrData.writeUInt32BE(width, 0);
    ihdrData.writeUInt32BE(height, 4);
    ihdrData[8] = 8; // bit depth
    ihdrData[9] = 2; // color type (RGB)
    ihdrData[10] = 0; // compression
    ihdrData[11] = 0; // filter
    ihdrData[12] = 0; // interlace
    const ihdr = createChunk('IHDR', ihdrData);

    // IDAT chunk - raw image data
    // Each row: filter byte (0) + RGB pixels
    const rawRow = Buffer.alloc(1 + width * 3);
    rawRow[0] = 0; // no filter
    for (let x = 0; x < width; x++) {
        rawRow[1 + x * 3] = r;
        rawRow[1 + x * 3 + 1] = g;
        rawRow[1 + x * 3 + 2] = b;
    }

    // Build full raw data
    const rawData = Buffer.alloc(rawRow.length * height);
    for (let y = 0; y < height; y++) {
        rawRow.copy(rawData, y * rawRow.length);
    }

    // Compress with zlib
    const zlib = require('zlib');
    const compressed = zlib.deflateSync(rawData);
    const idat = createChunk('IDAT', compressed);

    // IEND chunk
    const iend = createChunk('IEND', Buffer.alloc(0));

    return Buffer.concat([signature, ihdr, idat, iend]);
}

function createChunk(type, data) {
    const length = Buffer.alloc(4);
    length.writeUInt32BE(data.length, 0);
    const typeBuffer = Buffer.from(type, 'ascii');
    const crcData = Buffer.concat([typeBuffer, data]);
    const crc = crc32(crcData);
    const crcBuffer = Buffer.alloc(4);
    crcBuffer.writeUInt32BE(crc >>> 0, 0);
    return Buffer.concat([length, typeBuffer, data, crcBuffer]);
}

function crc32(buf) {
    let crc = 0xFFFFFFFF;
    const table = new Uint32Array(256);
    for (let i = 0; i < 256; i++) {
        let c = i;
        for (let j = 0; j < 8; j++) {
            c = (c & 1) ? (0xEDB88320 ^ (c >>> 1)) : (c >>> 1);
        }
        table[i] = c;
    }
    for (let i = 0; i < buf.length; i++) {
        crc = table[(crc ^ buf[i]) & 0xFF] ^ (crc >>> 8);
    }
    return (crc ^ 0xFFFFFFFF) >>> 0;
}

function hexToRGB(hex) {
    const r = parseInt(hex.slice(1, 3), 16);
    const g = parseInt(hex.slice(3, 5), 16);
    const b = parseInt(hex.slice(5, 7), 16);
    return [r, g, b];
}

const projects = [
    { name: 'gradevise', color: '#6366F1' },
    { name: 'itineraryai', color: '#0EA5E9' },
    { name: 'fitness-geni', color: '#10B981' },
    { name: 'cricket-scorer', color: '#F59E0B' },
    { name: 'pneumonia-prediction', color: '#EF4444' },
    { name: 'ai-voice-assistant', color: '#8B5CF6' },
    { name: 'expense-tracker', color: '#14B8A6' },
    { name: 'dailyflow', color: '#3B82F6' },
    { name: 'perplexity-clone', color: '#334155' },
    { name: 'neo-route', color: '#22C55E' },
    { name: 'signbridge', color: '#F97316' },
    { name: 'clipforge', color: '#6D28D9' },
];

const dir = path.join(__dirname, '..', 'public', 'projects');

projects.forEach(function (p) {
    const rgb = hexToRGB(p.color);
    const png = createSolidPNG(rgb[0], rgb[1], rgb[2]);
    // Save as .webp extension but it's actually a PNG - Next.js handles this fine
    // since it processes images through its optimizer
    fs.writeFileSync(path.join(dir, p.name + '.webp'), png);
    console.log('Created:', p.name + '.webp (' + png.length + ' bytes)');
});

console.log('Done! All placeholder images created.');
