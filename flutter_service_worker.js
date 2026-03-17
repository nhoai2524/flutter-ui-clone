'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d98f23b45155194d41a9a0b398eb9a1d",
"assets/AssetManifest.bin.json": "f1a9cd1646ef7f2d8225f99caaf0d20a",
"assets/AssetManifest.json": "8692b71d9b3970977a6c31df8514433c",
"assets/assets/img/add1.jpg": "a8c0ecf44f82b789bc47c4ba04984fb1",
"assets/assets/img/add10.jpg": "442becb984a3c507d981ec0de638b722",
"assets/assets/img/add2.jpg": "46229bb45db66b8780df370dc9e3e672",
"assets/assets/img/add3.jpg": "7e1a570e94ba369c3825de6f24d24762",
"assets/assets/img/add4.jpg": "377ced5a60b558fc36dd924268168c5d",
"assets/assets/img/add5.jpg": "7863efc118a4adce023bb3f742cf0b09",
"assets/assets/img/add6.jpg": "19e12bce311b26f4230dcd9d07f6867d",
"assets/assets/img/add7.jpg": "3b2a10e049470a87b1594fd175ab646e",
"assets/assets/img/add8.jpg": "827491a6b4d6d5592e93bad3d88b4d61",
"assets/assets/img/add9.jpg": "846bafc66829d1587cdfaf876f52f153",
"assets/assets/img/arrow_back.png": "fac5aa3b358c4a573ac1ee67fa150296",
"assets/assets/img/audio.mp3": "a84887d31f72d794c7ab959aee316e0b",
"assets/assets/img/bg.webp": "d9954ab5125a08dd30ff69ba12b93f64",
"assets/assets/img/bunker.png": "2eb308905bb2360af6ee479ce1ee1322",
"assets/assets/img/china.png": "881209066113f9b16d42aa5364a43ef1",
"assets/assets/img/download.png": "a6c58b32bd5738725b535d389be4b8ca",
"assets/assets/img/english.png": "625e83cfa91bafc8ca4b5cdcf9a9ff10",
"assets/assets/img/france.png": "a7d33e1998b1eee77ff4bf6a742be232",
"assets/assets/img/german.png": "0003352237e762ae1b17668eb3ace5d9",
"assets/assets/img/ground.png": "5537af679b688c6cf070f66285132092",
"assets/assets/img/japan.png": "5ac5e61b29a6a3cbfa2bedd75edd6cd7",
"assets/assets/img/keyboard.png": "d5e1a8ad57dd43652a37fd4da2043644",
"assets/assets/img/korea.png": "5e6c7e3bad60859538e6aec7d4392a1e",
"assets/assets/img/L1.png": "21f9833bc548ad9a1769c365336d60a8",
"assets/assets/img/L2.png": "f3508c1add097a35ee3f4a0bd8caf1c9",
"assets/assets/img/L3.png": "09ca5d59d373524eebd504d30e1cff57",
"assets/assets/img/L4.png": "f69db218de4aeff8e6421f4d733367d1",
"assets/assets/img/language.png": "b35b0529194fe0fb8bc8247e41ea0285",
"assets/assets/img/list.png": "cee29eab54f99e0c679e3d8614e468bd",
"assets/assets/img/logo.jpg": "7f8c3e562cd66f7a337edc7e71ede5b6",
"assets/assets/img/logo.png": "b5db46df808065687d8c2a21b27382a2",
"assets/assets/img/map.png": "24f4493f22580af496a2febb335b4fb5",
"assets/assets/img/menu.png": "bb5e675412adbe0eb276d5246a871f11",
"assets/assets/img/place.jpg": "d78408c13d8ea51132809a028abb02ed",
"assets/assets/img/place.webp": "eed49c6155a827035f725baa68d0ef37",
"assets/assets/img/place2.jpg": "40247cdefa76af64c40977d08ad72e4b",
"assets/assets/img/place3.jpg": "895b5ac6564c825caec8336cece2e1fd",
"assets/assets/img/start.png": "f94129fe46437693c48e1d834a3c5b59",
"assets/assets/img/vietnam.png": "fc99f5e77ee5733071178217db5a5376",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "e858481298b57300d353cbc8ced0db97",
"assets/NOTICES": "231ea66cf1e09071eaf81f1bd4225762",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "97a4811dad86f02ecc83318d4b4e142e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "71e7e642f4dd1fd68d4a65a89ddf5108",
"/": "71e7e642f4dd1fd68d4a65a89ddf5108",
"main.dart.js": "e11d5caed74b87a156769c72052d77d3",
"manifest.json": "d28bf9b0795e0205c1c656544d97ed14",
"version.json": "58f430bc1352865fe89ef6ee142282d8"};
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
