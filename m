Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DACA298017
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 18:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B296E990;
	Wed, 21 Aug 2019 16:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D8336E975
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 16:30:13 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 09:30:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="172825319"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com) ([10.54.75.49])
 by orsmga008.jf.intel.com with ESMTP; 21 Aug 2019 09:30:12 -0700
Date: Wed, 21 Aug 2019 09:31:45 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: Simon Ser <simon.ser@intel.com>
Subject: Re: [PATCH] drm/i915: add port info to debugfs
Message-ID: <20190821163144.GA31265@intel.com>
References: <20190821141554.18347-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190821141554.18347-1-simon.ser@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMjEsIDIwMTkgYXQgMDU6MTU6NTRQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkcyBhIGxpbmUgd2l0aCB0aGUgcG9ydCBuYW1lIHRvIGNvbm5lY3Rv
cnMgaW4KPiBkZWJ1Z2ZzL2k5MTZfZGlzcGxheV9pbmZvLiBBIGhpbnQgaXMgcHJpbnRlZCBpZiB0
aGUgcG9ydCBpcyB0eXBlLUMuCgpUeXBvIGhlcmUsIHNob3VsZCBiZSBpOTE1X2Rpc3BsYXlfaW5m
bwoKTWFuYXNpCgo+IAo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVs
LmNvbT4KPiBDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYyB8IDkgKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMu
Ywo+IGluZGV4IGIzOTIyNmQ3ZjhkMi4uNzE4YTMzN2M4ZjBhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9kZWJ1Z2ZzLmMKPiBAQCAtMjU1Nyw5ICsyNTU3LDExIEBAIHN0YXRpYyB2b2lkIGlu
dGVsX2x2ZHNfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4gIHN0YXRpYyB2b2lkIGludGVsX2Nv
bm5lY3Rvcl9pbmZvKHN0cnVjdCBzZXFfZmlsZSAqbSwKPiAgCQkJCSBzdHJ1Y3QgZHJtX2Nvbm5l
Y3RvciAqY29ubmVjdG9yKQo+ICB7Cj4gKwlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9
IHRvX2k5MTUoY29ubmVjdG9yLT5kZXYpOwo+ICAJc3RydWN0IGludGVsX2Nvbm5lY3RvciAqaW50
ZWxfY29ubmVjdG9yID0gdG9faW50ZWxfY29ubmVjdG9yKGNvbm5lY3Rvcik7Cj4gIAlzdHJ1Y3Qg
aW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciA9IGludGVsX2Nvbm5lY3Rvci0+ZW5jb2RlcjsK
PiAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlOwo+ICsJZW51bSB0Y19wb3J0IHRjX3Bv
cnQ7Cj4gCj4gIAlzZXFfcHJpbnRmKG0sICJjb25uZWN0b3IgJWQ6IHR5cGUgJXMsIHN0YXR1czog
JXNcbiIsCj4gIAkJICAgY29ubmVjdG9yLT5iYXNlLmlkLCBjb25uZWN0b3ItPm5hbWUsCj4gQEAg
LTI1NzgsNiArMjU4MCwxMyBAQCBzdGF0aWMgdm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhzdHJ1
Y3Qgc2VxX2ZpbGUgKm0sCj4gIAlpZiAoIWludGVsX2VuY29kZXIpCj4gIAkJcmV0dXJuOwo+IAo+
ICsJaWYgKGludGVsX2VuY29kZXItPnBvcnQgIT0gUE9SVF9OT05FKSB7Cj4gKwkJdGNfcG9ydCA9
IGludGVsX3BvcnRfdG9fdGMoaTkxNSwgaW50ZWxfZW5jb2Rlci0+cG9ydCk7Cj4gKwkJc2VxX3By
aW50ZihtLCAiXHRwb3J0OiAlYyVzXG4iLAo+ICsJCQkgICBwb3J0X25hbWUoaW50ZWxfZW5jb2Rl
ci0+cG9ydCksCj4gKwkJCSAgIHRjX3BvcnQgIT0gUE9SVF9UQ19OT05FID8gIiAodHlwZS1DKSIg
OiAiIik7Cj4gKwl9Cj4gKwo+ICAJc3dpdGNoIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlKSB7
Cj4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDoKPiAgCWNhc2UgRFJNX01P
REVfQ09OTkVDVE9SX2VEUDoKPiAtLQo+IDIuMjIuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
