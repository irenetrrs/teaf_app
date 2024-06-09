'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "0f7322bce65dc8aca73a5c6dbb3f4a4f",
"assets/AssetManifest.bin.json": "408c8f282b75e40a6fbe1600b29ccda3",
"assets/AssetManifest.json": "72dd12c5a12563ffd2534f0c28a98f30",
"assets/data/distanciapalpebral.csv": "385518b81e75c736d289d2ba10c65e68",
"assets/data/femaleheight.csv": "eb767e94ff7cb462bc8e4cf18deabcc7",
"assets/data/femaleweight.csv": "ec523a8036f313316b2399692697cc8c",
"assets/data/maleheight.csv": "4d33ee2980b7692b0ecbe4bd58cd4f83",
"assets/data/maleweight.csv": "a7ffc6f460529b141c07d205fe90e0c1",
"assets/data/perimetrocranealhombres.csv": "67c0c7be46c7edece8979cd3afbf97c8",
"assets/data/perimetrocranealmujeres.csv": "3b84ac5a7fb39045f91ed42f914bcc2c",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "f9e8bc079ee47665a66fab1819b2db4a",
"assets/i18n/en.json": "276cfb19d95751b8ee83c72507f5926e",
"assets/i18n/es.json": "9e384f0441c676245588e9f13babe3a6",
"assets/img/alcohol.png": "01d46f5f36c1fa31caa9fd8d963db678",
"assets/img/altura.png": "034c2459ce6a011723672094cf7d81a6",
"assets/img/atras.png": "dfd198a47237ec7191be8f6ea77a93e8",
"assets/img/bck.jpg": "5fc042303d572d732f703478343fa7dd",
"assets/img/cerebro.png": "6bd70b4c6d3008a1d197aa62f32ca077",
"assets/img/creditos.png": "63b04d14e47dcd2ebafaaf39c5127380",
"assets/img/creditos2.png": "e38ebc8b7fc2577c6ab9ce5a83f7a379",
"assets/img/descargar.png": "daf40c144641f60807dd75bf0652116e",
"assets/img/distancia.png": "f88178f563967f4dbafefb165d227a12",
"assets/img/esp.png": "0a184a86c37d9ba1892b2f85746e48e7",
"assets/img/fa1.png": "16aa095dda6391a64093f515d6118080",
"assets/img/fa2.png": "a8b7abb743076a48dbde6ca04c6cf49d",
"assets/img/fa3.png": "9d448fefe9e2d9878d9d28bdb8bc1c63",
"assets/img/fa4.png": "b5c064a5537adeb0235856dbcefead5e",
"assets/img/fa5.png": "20684f4645669daacded28fc3060e6ff",
"assets/img/faciales.png": "26b700beb21a9ab9fa9116de4f35200a",
"assets/img/fc1.png": "78ef4603c1ccd24fd887becaa6bd7908",
"assets/img/fc2.png": "a2397a1cafad26e9eaba26554575efd5",
"assets/img/fc3.png": "b9f7fc5067edae197d348eebbca1a571",
"assets/img/fc4.png": "751b61a1676bc39d75b433d2fca30d4b",
"assets/img/fc5.png": "1cf1de6f58d1d7e574ff6b4ff3a52a36",
"assets/img/filtrum.png": "1df333afd5ea57d635a32cfdb6836888",
"assets/img/icono.png": "fa1fe909b7b01f16ec0db32d51dc1bcb",
"assets/img/ing.png": "a32d9f52d0a1dc71675febd0bd90bfc1",
"assets/img/la1.png": "7240d46f87713ef301ae8e9d99ceafff",
"assets/img/la2.png": "da82ca05e1444e4de5ddadfbbb297a25",
"assets/img/la3.png": "9fa78b2d6cb99455ffb51532344493e7",
"assets/img/la4.png": "b5e467ad3b965439982b5ae2d01d8c87",
"assets/img/la5.png": "1e00370fb3267e79b015d6037d18c661",
"assets/img/labio.png": "84b4811775cf96859b3abe6d9000bf5b",
"assets/img/lc1.png": "9154e541a40563a67cab1ff31bfc2506",
"assets/img/lc2.png": "ba28fb06bd8d268627a25ed79b0150a7",
"assets/img/lc3.png": "a8039ba3fc5f2589625fb533c7e4997f",
"assets/img/lc4.png": "d43dfdbac3e66dbbd657714e963dfd62",
"assets/img/lc5.png": "9326fdd3d3fd70cd121d9c253d1e28f8",
"assets/img/logo.png": "a870195d49c61117814f23530562f555",
"assets/img/ministerio.png": "55dfaedb098398ede6fbfc52610d28b5",
"assets/img/papelera.png": "a839317b5202c9da89e7e99add28b557",
"assets/img/perimetro.png": "a30a1398b8bba0b40d7b56eac109bb8d",
"assets/img/peso.png": "0ce740fbcff08809266e586de9420421",
"assets/img/pregunta.png": "eb27df8f02f1264b5b37daf225a12525",
"assets/img/save.png": "3f9b7d5106bb4238e1edbdad4e40725a",
"assets/img/uc3m.png": "6cedec858918f3c212a3f0893f028deb",
"assets/img/user.png": "30236e7ec5f26698b2f37b599d8153c2",
"assets/NOTICES": "880dae61c43cab146216b8be1fa579ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/fluttertoast/assets/toastify.css": "a85675050054f179444bc5ad70ffc635",
"assets/packages/fluttertoast/assets/toastify.js": "56e2c9cedd97f10e7e5f1cebd85d53e3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "738255d00768497e86aa4ca510cce1e1",
"canvaskit/canvaskit.js.symbols": "74a84c23f5ada42fe063514c587968c6",
"canvaskit/canvaskit.wasm": "9251bb81ae8464c4df3b072f84aa969b",
"canvaskit/chromium/canvaskit.js": "901bb9e28fac643b7da75ecfd3339f3f",
"canvaskit/chromium/canvaskit.js.symbols": "ee7e331f7f5bbf5ec937737542112372",
"canvaskit/chromium/canvaskit.wasm": "399e2344480862e2dfa26f12fa5891d7",
"canvaskit/skwasm.js": "5d4f9263ec93efeb022bb14a3881d240",
"canvaskit/skwasm.js.symbols": "c3c05bd50bdf59da8626bbe446ce65a3",
"canvaskit/skwasm.wasm": "4051bfc27ba29bf420d17aa0c3a98bce",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "38f6a3e75d8ecf8827153d7412720d43",
"flutter.js": "383e55f7f3cce5be08fcf1f3881f585c",
"flutter_bootstrap.js": "8623fb9ddc23e264f24cce9ccf966f45",
"icons/Icon-192.png": "a0bbc34afc2ac1d41b2d2c1fafe36424",
"icons/Icon-512.png": "e32e4f0b7b17ef5d7e900e8231a74109",
"icons/Icon-maskable-192.png": "a0bbc34afc2ac1d41b2d2c1fafe36424",
"icons/Icon-maskable-512.png": "e32e4f0b7b17ef5d7e900e8231a74109",
"index.html": "cea094261d4b10ff7641ec466657c348",
"/": "cea094261d4b10ff7641ec466657c348",
"main.dart.js": "e5400d919c733b4e1ce597161ebd9e68",
"manifest.json": "5d664e04990e1dbb186109a4cb0ead7a",
"version.json": "de01a70a576128a5e692ec2cc94b3032"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
