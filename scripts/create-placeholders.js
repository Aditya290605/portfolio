const fs = require('fs');
const path = require('path');

const projectsDir = path.join(__dirname, '..', 'public', 'projects');
const techDir = path.join(projectsDir, 'tech');
const skillsDir = path.join(__dirname, '..', 'public', 'skills');

// Create minimal valid WebP placeholder (1x1 transparent pixel)
const webpBuffer = Buffer.from(
    'UklGRiQAAABXRUJQVlA4IBgAAAAwAQCdASoBAAEAAkA4JZQCdAEO/hepAAA=',
    'base64'
);

const projects = [
    'gradevise', 'itineraryai', 'fitness-geni', 'cricket-scorer',
    'pneumonia-prediction', 'ai-voice-assistant', 'expense-tracker',
    'dailyflow', 'perplexity-clone', 'neo-route', 'signbridge', 'clipforge'
];

projects.forEach(function (p) {
    var filePath = path.join(projectsDir, p + '.webp');
    if (!fs.existsSync(filePath)) {
        fs.writeFileSync(filePath, webpBuffer);
        console.log('Created placeholder:', p + '.webp');
    } else {
        console.log('Already exists:', p + '.webp');
    }
});

// SVG icons needed for skills
var svgIcons = {
    'dart': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path d="M27.8 97.4L7.1 76.8 27.6 16l19 11.2z" fill="#00d2b8"/><path d="M27.8 97.4l52.8 7.3 19.5-19.5-11.4-58.6z" fill="#55ddca"/><path d="M100.1 85.2L88.7 26.6 108.2 16l12.7 61.1z" fill="#65b0d8"/><path d="M100.1 85.2l20.8-8.1L108.2 16l-19.5 10.6z" fill="#00d2b8"/><path d="M38.8 111.5l42 2.5 19.3-28.8-52.5-58.6z" fill="#00a8e1"/><path d="M27.8 97.4l11 14.1 8.8-84.9L27.6 16z" fill="#00b6c7"/></svg>',
    'python': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><linearGradient id="a" x1="70.252" x2="41.862" y1="1237.399" y2="1309.259" gradientTransform="matrix(.563 0 0 -.568 -29.215 748.404)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#5A9FD4"/><stop offset="1" stop-color="#306998"/></linearGradient><path fill="url(#a)" d="M63.391 1.988c-4.222.02-8.252.379-11.8 1.007-10.45 1.846-12.346 5.71-12.346 12.837v9.411h24.693v3.137h-33.96c-7.176 0-13.46 4.313-15.426 12.521-2.268 9.405-2.368 15.275 0 25.096 1.755 7.311 5.947 12.519 13.124 12.519h8.491v-11.282c0-8.151 7.051-15.34 15.426-15.34h24.665c6.866 0 12.346-5.655 12.346-12.548v-23.51c0-6.693-5.646-11.72-12.346-12.836-4.244-.706-8.645-1.027-12.866-1.008zM50.037 9.557c2.55 0 4.634 2.117 4.634 4.721 0 2.593-2.083 4.69-4.634 4.69-2.56 0-4.633-2.097-4.633-4.69-.001-2.604 2.073-4.72 4.633-4.72z"/><linearGradient id="b" x1="209.474" x2="255.862" y1="1098.811" y2="1024.528" gradientTransform="matrix(.563 0 0 -.568 -29.215 748.404)" gradientUnits="userSpaceOnUse"><stop offset="0" stop-color="#FFD43B"/><stop offset="1" stop-color="#FFE873"/></linearGradient><path fill="url(#b)" d="M91.682 28.38v10.966c0 8.5-7.208 15.655-15.426 15.655h-24.665c-6.756 0-12.346 5.783-12.346 12.549v23.509c0 6.691 5.818 10.628 12.346 12.547 7.816 2.297 15.312 2.713 24.665 0 6.216-1.801 12.346-5.423 12.346-12.547v-9.412h-24.665v-3.138h37.012c7.176 0 9.852-5.005 12.346-12.519 2.578-7.735 2.467-15.174 0-25.096-1.774-7.145-5.161-12.521-12.346-12.521h-9.268zm-13.869 59.665c2.56 0 4.633 2.097 4.633 4.692 0 2.602-2.074 4.72-4.633 4.72-2.55 0-4.633-2.117-4.633-4.72 0-2.595 2.083-4.692 4.633-4.692z"/></svg>',
    'java': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path fill="#0074BD" d="M47.617 98.12s-4.767 2.774 3.397 3.71c9.892 1.13 14.947.968 25.845-1.092 0 0 2.871 1.795 6.873 3.351-24.439 10.47-55.308-.607-36.115-5.969zM44.629 84.455s-5.348 3.959 2.823 4.805c10.567 1.091 18.91 1.18 33.354-1.6 0 0 1.993 2.025 5.132 3.131-29.542 8.64-62.446.68-41.309-6.336z"/><path fill="#EA2D2E" d="M69.802 61.271c6.025 6.935-1.58 13.17-1.58 13.17s15.289-7.891 8.269-17.777c-6.559-9.215-11.587-13.792 15.635-29.58 0 .001-42.731 10.67-22.324 34.187z"/><path fill="#0074BD" d="M102.123 108.229s3.529 2.91-3.888 5.159c-14.102 4.272-58.706 5.56-71.094.171-4.451-1.938 3.899-4.625 6.526-5.192 2.739-.593 4.303-.485 4.303-.485-4.953-3.487-32.013 6.85-13.743 9.815 49.821 8.076 90.817-3.637 77.896-9.468zM49.912 70.294s-22.686 5.389-8.033 7.348c6.188.828 18.518.638 30.011-.326 9.39-.789 18.813-2.474 18.813-2.474s-3.308 1.419-5.704 3.053c-23.042 6.061-67.544 3.238-54.731-2.958 10.832-5.239 19.644-4.643 19.644-4.643zM90.609 93.041c23.421-12.167 12.591-23.86 5.032-22.285-1.848.385-2.677.72-2.677.72s.688-1.079 2-1.543c14.953-5.255 26.451 15.503-4.823 23.725 0-.002.359-.327.468-.617z"/><path fill="#EA2D2E" d="M76.491 1.587S89.459 14.563 63.3 33.514c-21.084 15.246-4.809 23.935-.009 33.874-12.308-11.105-21.34-20.865-15.28-29.963C56.97 25.283 81.395 19.098 76.491 1.587z"/><path fill="#0074BD" d="M52.214 126.021c22.476 1.437 57-.8 57.817-11.436 0 0-1.571 4.032-18.577 7.231-19.186 3.612-42.854 3.191-56.887.874 0 .001 2.875 2.381 17.647 3.331z"/></svg>',
    'flutter': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path fill="#3FB6D3" d="M12.3 64.2L76.3 0h39.4L32.1 83.6zM76.3 128h39.4L81.6 93.9l34.1-34.8H76.3L42.2 93.5z"/><path fill="#27AACD" d="M81.6 93.9l-20-20-19.4 19.6 19.4 19.6z"/><path fill="#19599A" d="M115.7 128L81.6 93.9l-20 19.2L76.3 128z"/></svg>',
    'supabase': '<svg viewBox="0 0 109 113" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M63.7076 110.284C60.8481 113.885 55.0502 111.912 54.9813 107.314L53.9738 40.0627L99.1935 40.0627C107.384 40.0627 111.952 49.5228 106.859 55.9374L63.7076 110.284Z" fill="url(#paint0_linear)"/><path d="M63.7076 110.284C60.8481 113.885 55.0502 111.912 54.9813 107.314L53.9738 40.0627L99.1935 40.0627C107.384 40.0627 111.952 49.5228 106.859 55.9374L63.7076 110.284Z" fill="url(#paint1_linear)" fill-opacity=".2"/><path d="M45.317 2.07103C48.1765 -1.53037 53.9745 .442937 54.0434 5.041L54.4849 72.2922H9.83113C1.64038 72.2922 -2.92775 62.8321 2.1655 56.4175L45.317 2.07103Z" fill="#3ECF8E"/><defs><linearGradient id="paint0_linear" x1="53.9738" y1="54.974" x2="94.1635" y2="71.8295" gradientUnits="userSpaceOnUse"><stop stop-color="#249361"/><stop offset="1" stop-color="#3ECF8E"/></linearGradient><linearGradient id="paint1_linear" x1="36.1558" y1="30.578" x2="54.4844" y2="65.0806" gradientUnits="userSpaceOnUse"><stop/><stop offset="1" stop-opacity="0"/></linearGradient></defs></svg>',
    'fastapi': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path fill="#009688" d="M64 0C28.654 0 0 28.654 0 64s28.654 64 64 64 64-28.654 64-64S99.346 0 64 0zm0 5.322c32.431 0 58.678 26.247 58.678 58.678S96.431 122.678 64 122.678 5.322 96.431 5.322 64 31.569 5.322 64 5.322z"/><path fill="#009688" d="M64 14c-27.614 0-50 22.386-50 50s22.386 50 50 50 50-22.386 50-50-22.386-50-50-50zm-4 22h12l-4 20h12L52 96l8-28H48z"/></svg>',
    'github': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" clip-rule="evenodd" d="M64 5.103c-33.347 0-60.388 27.035-60.388 60.388 0 26.682 17.303 49.317 41.297 57.303 3.017.56 4.125-1.31 4.125-2.905 0-1.44-.056-6.197-.082-11.243-16.8 3.653-20.345-7.125-20.345-7.125-2.747-6.98-6.705-8.836-6.705-8.836-5.48-3.748.413-3.67.413-3.67 6.063.425 9.257 6.223 9.257 6.223 5.386 9.23 14.127 6.562 17.573 5.02.542-3.903 2.107-6.568 3.834-8.076-13.413-1.525-27.514-6.704-27.514-29.843 0-6.593 2.36-11.98 6.223-16.21-.628-1.52-2.695-7.662.584-15.98 0 0 5.07-1.623 16.61 6.19C53.7 35 58.867 34.327 64 34.304c5.13.023 10.3.694 15.127 2.033 11.526-7.813 16.59-6.19 16.59-6.19 3.287 8.317 1.22 14.46.593 15.98 3.872 4.23 6.215 9.617 6.215 16.21 0 23.194-14.127 28.3-27.574 29.796 2.167 1.874 4.097 5.55 4.097 11.183 0 8.08-.07 14.583-.07 16.572 0 1.607 1.088 3.49 4.148 2.897 23.98-7.994 41.263-30.622 41.263-57.294C124.388 32.14 97.35 5.104 64 5.104z" fill="#fff"/></svg>',
    'vscode': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path d="M96.887 126.171L33.479 97.614.903 72.221a5.8 5.8 0 01-.13-8.895l32.62-25.282L96.887 1.83A7.992 7.992 0 01109 8.737v110.39a8 8 0 01-12.113 6.908zM39.5 64l-20 18.289L39.5 64zm0 0l46-35.705v71.41z" fill="#0065A9"/><path d="M96.887 126.171L33.479 97.614.903 72.221a5.8 5.8 0 01-.13-8.895l32.62-25.282L96.887 1.83A7.992 7.992 0 01109 8.737v110.39a8 8 0 01-12.113 6.908z" fill="#007ACC" opacity=".25"/><path fill="#1F9CF0" d="M96.887 126.171A7.987 7.987 0 01109 119.127V8.737A7.99 7.99 0 0096.887 1.83L39.5 64z"/></svg>',
    'android-studio': '<svg viewBox="0 0 128 128" xmlns="http://www.w3.org/2000/svg"><path fill="#73be4a" d="M25.6 101.6l11.7-21.5L15 105.8c3.2 3.4 6.7 5-1.7-1.1l12.3-3.1z"/><path fill="#4caf50" d="M100.6 105.8l-21-25.5 11.8 21.1 12.3 3.1c-3.3 3.5-6.7 5.1-3.1 1.3z"/><path fill="#2e7d32" d="M64 126c17.2 0 32.3-9 40.6-22.6L80.2 76H47.8l-24 27.4C32 116.6 47 126 64 126z"/><path fill="#7cb342" d="M37.4 80.2l-24.1-27c-5.2 8-8.3 17.3-8.3 27.3 0 9.6 2.8 18.5 7.6 26.1l24.8-26.4z"/><path fill="#aed581" d="M64 2C46.5 2 31.2 11.4 23 25.4L47.7 52h32.6l24.4-26.3C96.6 11.6 81.4 2 64 2z"/><path fill="#689f38" d="M104.7 25.7l-24 26.5L91.4 80l24 27.2c5-7.9 7.6-17.1 7.6-26.7-.1-19.8-7-27.5-18.3-54.8z"/><rect width="40" height="40" x="44" y="44" fill="#fff" rx="3"/><path fill="#1a237e" d="M52 52h24l-12 24z"/></svg>'
};

// Create missing skill icons
Object.entries(svgIcons).forEach(function (entry) {
    var name = entry[0];
    var svg = entry[1];
    var skillPath = path.join(skillsDir, name + '.svg');
    if (!fs.existsSync(skillPath)) {
        fs.writeFileSync(skillPath, svg);
        console.log('Created skill icon:', name + '.svg');
    } else {
        console.log('Skill icon exists:', name + '.svg');
    }
});

// Also create tech icons for projects
var techIcons = ['flutter', 'dart', 'python', 'supabase'];
techIcons.forEach(function (name) {
    var techPath = path.join(techDir, name + '.svg');
    if (!fs.existsSync(techPath)) {
        var skillPath = path.join(skillsDir, name + '.svg');
        if (fs.existsSync(skillPath)) {
            fs.copyFileSync(skillPath, techPath);
            console.log('Copied tech icon:', name + '.svg');
        }
    } else {
        console.log('Tech icon exists:', name + '.svg');
    }
});

console.log('All done!');
