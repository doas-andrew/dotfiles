////////////////////////////////////////////////////////////////////////////////
// user-overrides.js
// Read the wiki: https://github.com/arkenfox/user.js/wiki
//
// Update:
// Close Firefox
// cd ~/.mozilla/firefox/<PROFILE>
// sh updater.sh
// sh prefsCleaner.sh

// DNS over HTTPS
// Protects web requests from an ISP
// Disable if you use PiHole, but tools like pfBlocker work fine
// Cloudflare (default in US & Canada)
// Quad 9: https://dns.quad9.net/dns-query
user_pref("network.trr.uri", "https://mozilla.cloudflare-dns.com/dns-query");
user_pref("network.trr.mode", 2);

// WebRTC; Things like video calls
user_pref("media.peerconnection.enabled", false);

// Firefox stores passwords in plaintext
user_pref("signon.rememberSignons", false);

// Disable history
user_pref("places.history.enabled", false);

// Disable Pocket
user_pref("extensions.pocket.enabled", false);

// Disable Mozilla account
user_pref("identity.fxaccounts.enabled", false);

// Disable Media Plugins
user_pref("media.gmp-provider.enabled", false);

// Disable Widevine CDM (Content Decryption Module)
// Should be covered by disabling EME master switch
user_pref("media.gmp-widevinecdm.enabled", false);

// Enable userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("devtools.debugger.remote-enabled", true);


////////////////////////////////////////////////////////////////////////////////
// Quality of life
// Things that 'should' be enabled but I can't be bothered

// Enable favicons in browser tab and bookmarks
user_pref("browser.shell.shortcutFavicons", true);

// Don't obfuscate viewport size with extra margins
user_pref("privacy.resistFingerprinting.letterboxing", false);

// Enable searching from the URL bar
// Still does not phone home for suggestions
// Use a sane default. IE not google
user_pref("keyword.enabled", true);


////////////////////////////////////////////////////////////////////////////////
// Arkenfox defaults
// Common causes of breakage that may need overrides

// Strict third party requests may cause images/video to break
//
// When to send a cross-origin referer:
// 0: Always (FF default)
// 1: Only if base domains match
// 2: Only if hosts match (AF default)
//
// NOTE: If "2" is too strict, then override to "0" and use
// Smart Referer extension (Strict mode + add exceptions) ***/
user_pref("network.http.referer.XOriginPolicy", 0);
// The amount of cross-origin information sent
// 0: Full URI (FF default)
// 1: Scheme, host, port, path
// 2: Scheme, host, port (AF default)
// user_pref("network.http.referer.XOriginTrimmingPolicy", 2);

// Disable WebGL
// user_pref("webgl.disabled", true);

// Disable DRM
// user_pref("media.eme.enabled", false);

// Disable IPv6
// user_pref("network.dns.disableIPv6", true);

// Autoplay settings
// 0: Allow all
// 1: Block non-muted media (FF default)
// 5: Block all             (AF default)
user_pref("media.autoplay.default", 1);
// 0: Sticky (FF default)
// 1: Transient
// 2: User (AF default)
// user_pref("media.autoplay.blocking_policy", 2);
