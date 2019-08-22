Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E90993FA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 14:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33EBA6E113;
	Thu, 22 Aug 2019 12:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E276E45C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 12:39:32 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 05:39:31 -0700
X-IronPort-AV: E=Sophos;i="5.64,416,1559545200"; d="scan'208";a="354270998"
Received: from ideak-desk.fi.intel.com ([10.237.68.142])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 05:39:30 -0700
Date: Thu, 22 Aug 2019 15:38:31 +0300
From: Imre Deak <imre.deak@intel.com>
To: Simon Ser <simon.ser@intel.com>
Subject: Re: [PATCH] drm/i915: add port info to debugfs
Message-ID: <20190822123831.GB452@ideak-desk.fi.intel.com>
References: <20190822110927.28249-1-simon.ser@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190822110927.28249-1-simon.ser@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Reply-To: imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org, Manasi Navare <nabasi.d.navare@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMjIsIDIwMTkgYXQgMDI6MDk6MjdQTSArMDMwMCwgU2ltb24gU2VyIHdyb3Rl
Ogo+IFRoaXMgcGF0Y2ggYWRkcyBhIGxpbmUgd2l0aCB0aGUgcG9ydCBuYW1lIHRvIGNvbm5lY3Rv
cnMgaW4KPiBkZWJ1Z2ZzL2k5MTVfZGVidWdfaW5mby4gSWYgdGhlIHBvcnQgaXMgVHlwZS1DLCB0
aGUgVHlwZS1DIHBvcnQgbnVtYmVyIGlzCj4gcHJpbnRlZCB0b28uCj4gCj4gU2lnbmVkLW9mZi1i
eTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgo+IENjOiBJbXJlIERlYWsgPGltcmUu
ZGVha0BpbnRlbC5jb20+Cj4gQ2M6IE1hbmFzaSBOYXZhcmUgPG5hYmFzaS5kLm5hdmFyZUBpbnRl
bC5jb20+CgpMb29rcyBvayB0byBtZToKUmV2aWV3ZWQtYnk6IEltcmUgRGVhayA8aW1yZS5kZWFr
QGludGVsLmNvbT4KCj4gLS0tCj4gCj4gVGhhbmtzIGZvciB5b3VyIGNvbW1lbnRzLCBJbXJlIGFu
ZCBNYW5hc2kuIEhlcmUgaXMgdjI6Cj4gCj4gLSBVc2Ugc2FtZSBwb3J0IGZvcm1hdHRpbmcgYXMg
aW50ZWxfdGNfcG9ydF9pbml0IChlLmcuICJDL1RDIzEiKQo+IC0gRml4IHR5cG8gaW4gY29tbWl0
IG1lc3NhZ2UKPiAKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMgfCAxMCAr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kZWJ1Z2ZzLmMKPiBpbmRleCBiMzkyMjZkN2Y4ZDIuLjRiYTUwOGM5NTRm
OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2RlYnVnZnMuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZGVidWdmcy5jCj4gQEAgLTI1NTcsOSArMjU1
NywxMSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9sdmRzX2luZm8oc3RydWN0IHNlcV9maWxlICptLAo+
ICBzdGF0aWMgdm9pZCBpbnRlbF9jb25uZWN0b3JfaW5mbyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sCj4g
IAkJCQkgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPiAgewo+ICsJc3RydWN0IGRy
bV9pOTE1X3ByaXZhdGUgKmk5MTUgPSB0b19pOTE1KGNvbm5lY3Rvci0+ZGV2KTsKPiAgCXN0cnVj
dCBpbnRlbF9jb25uZWN0b3IgKmludGVsX2Nvbm5lY3RvciA9IHRvX2ludGVsX2Nvbm5lY3Rvcihj
b25uZWN0b3IpOwo+ICAJc3RydWN0IGludGVsX2VuY29kZXIgKmludGVsX2VuY29kZXIgPSBpbnRl
bF9jb25uZWN0b3ItPmVuY29kZXI7Cj4gIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsK
PiArCWVudW0gdGNfcG9ydCB0Y19wb3J0Owo+IAo+ICAJc2VxX3ByaW50ZihtLCAiY29ubmVjdG9y
ICVkOiB0eXBlICVzLCBzdGF0dXM6ICVzXG4iLAo+ICAJCSAgIGNvbm5lY3Rvci0+YmFzZS5pZCwg
Y29ubmVjdG9yLT5uYW1lLAo+IEBAIC0yNTc4LDYgKzI1ODAsMTQgQEAgc3RhdGljIHZvaWQgaW50
ZWxfY29ubmVjdG9yX2luZm8oc3RydWN0IHNlcV9maWxlICptLAo+ICAJaWYgKCFpbnRlbF9lbmNv
ZGVyKQo+ICAJCXJldHVybjsKPiAKPiArCWlmIChpbnRlbF9lbmNvZGVyLT5wb3J0ICE9IFBPUlRf
Tk9ORSkgewo+ICsJCXNlcV9wcmludGYobSwgIlx0cG9ydDogJWMiLCBwb3J0X25hbWUoaW50ZWxf
ZW5jb2Rlci0+cG9ydCkpOwo+ICsJCXRjX3BvcnQgPSBpbnRlbF9wb3J0X3RvX3RjKGk5MTUsIGlu
dGVsX2VuY29kZXItPnBvcnQpOwo+ICsJCWlmICh0Y19wb3J0ICE9IFBPUlRfVENfTk9ORSkKPiAr
CQkJc2VxX3ByaW50ZihtLCAiL1RDIyVkIiwgdGNfcG9ydCArIDEpOwo+ICsJCXNlcV9wcmludGYo
bSwgIlxuIik7Cj4gKwl9Cj4gKwo+ICAJc3dpdGNoIChjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBl
KSB7Cj4gIAljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydDoKPiAgCWNhc2UgRFJN
X01PREVfQ09OTkVDVE9SX2VEUDoKPiAtLQo+IDIuMjIuMQo+IApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
