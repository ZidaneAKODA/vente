// Define a cache name and the files to cache
const CACHE_NAME = 'africaphone-cache-v1';
const urlsToCache = [
  './index.html',
  './login.html',
  './manifest.json',
  // External libraries and assets
  'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js',
  'https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js',
  'https://www.gstatic.com/firebasejs/9.17.2/firebase-app-compat.js',
  'https://www.gstatic.com/firebasejs/9.17.2/firebase-auth-compat.js',
  'https://www.gstatic.com/firebasejs/9.17.2/firebase-firestore-compat.js',
  'https://unpkg.com/lucide@latest'
  // Add additional local CSS, JavaScript, images, etc., as needed.
];

// Install event - cache core files
self.addEventListener('install', event => {
  console.log('[Service Worker] Installing...');
  event.waitUntil(
    caches.open(CACHE_NAME)
      .then(cache => {
        console.log('[Service Worker] Caching app shell');
        return cache.addAll(urlsToCache);
      })
  );
});

// Activate event - delete old caches if necessary
self.addEventListener('activate', event => {
  console.log('[Service Worker] Activating...');
  event.waitUntil(
    caches.keys().then(keyList => {
      return Promise.all(
        keyList.map(key => {
          if (key !== CACHE_NAME) {
            console.log('[Service Worker] Deleting old cache:', key);
            return caches.delete(key);
          }
        })
      );
    })
  );
});

// Fetch event - serve cached content when offline
self.addEventListener('fetch', event => {
  event.respondWith(
    caches.match(event.request)
      .then(response => {
        // Cache hit - return the cached response
        if (response) {
          return response;
        }
        // Otherwise, fetch from network.
        return fetch(event.request);
      })
  );
});
