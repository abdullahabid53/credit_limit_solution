/*!
 * jquery-legacy-compat.js
 * Restores the three pre-jQuery-1.9 APIs that jQuery Migrate 3.x does NOT bring back,
 * but which the bundled legacy plugins still rely on:
 *   - $.browser              (used by jquery.simplemodal.js, jquery.wysiwyg.js)
 *   - $.boxModel / support   (used by jquery.simplemodal.js)
 *   - event .toggle(fn,fn..) (used by handler_jquery.js)
 *
 * Load order MUST be: jquery-3.x  ->  jquery-migrate-3.x  ->  THIS FILE  ->  plugins/app code.
 * Implementations mirror the original jQuery Migrate 1.x behaviour so the UI is unchanged.
 */
(function (jQuery) {
	"use strict";
	if (!jQuery) { return; }
	var $ = jQuery;

	/* ---- $.browser (removed in jQuery 1.9) ---- */
	if (!$.browser) {
		$.uaMatch = function (ua) {
			ua = ("" + ua).toLowerCase();
			var match =
				/(edge)\/([\w.]+)/.exec(ua) ||
				/(opr)[\/]([\w.]+)/.exec(ua) ||
				/(chrome)[ \/]([\w.]+)/.exec(ua) ||
				/(webkit)[ \/]([\w.]+)/.exec(ua) ||
				/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(ua) ||
				/(msie) ([\w.]+)/.exec(ua) ||
				/(trident)(?:.*? rv:([\w.]+)|)/.exec(ua) ||
				(ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(ua)) ||
				[];
			var name = match[1] || "";
			if (name === "trident") { name = "msie"; }       // IE 11
			if (name === "opr") { name = "opera"; }
			return { browser: name, version: match[2] || "0" };
		};

		var matched = $.uaMatch(window.navigator.userAgent);
		var browser = {};
		if (matched.browser) {
			browser[matched.browser] = true;
			browser.version = matched.version;
		}
		// Chrome is Webkit, but Webkit is also Safari (preserve original jQuery quirk).
		if (browser.chrome) {
			browser.webkit = true;
		} else if (browser.webkit) {
			browser.safari = true;
		}
		$.browser = browser;
	}

	/* ---- $.boxModel / $.support.boxModel (removed in jQuery 1.8) ----
	   Always true outside of IE quirks mode, which is the case for every page here. */
	if (typeof $.boxModel === "undefined") {
		$.boxModel = true;
	}
	if (!$.support) { $.support = {}; }
	if (typeof $.support.boxModel === "undefined") {
		$.support.boxModel = true;
	}

	/* ---- event-style .toggle(fn1, fn2 [, fn3 ...]) (removed in jQuery 1.9) ----
	   Two or more functions => click-alternation handler (legacy behaviour).
	   Anything else (no args, numbers, booleans, single complete-callback) falls
	   through to jQuery 3's native animation toggle untouched. */
	var nativeToggle = $.fn.toggle;
	var toggleSeq = 0;

	$.fn.toggle = function () {
		var args = arguments;
		var n = args.length;
		var i;

		if (n < 2) {
			return nativeToggle.apply(this, args);
		}
		for (i = 0; i < n; i++) {
			if (typeof args[i] !== "function") {
				return nativeToggle.apply(this, args);
			}
		}

		var fns = args;
		var dataKey = "legacyToggle_" + (toggleSeq++);
		var handler = function (event) {
			var el = $(this);
			var idx = (el.data(dataKey) || 0) % n;
			el.data(dataKey, idx + 1);
			event.preventDefault();
			return fns[idx].apply(this, arguments) || false;
		};
		return this.on("click", handler);
	};

})(window.jQuery);
