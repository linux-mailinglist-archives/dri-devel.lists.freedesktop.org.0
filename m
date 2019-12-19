Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6E4126354
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2019 14:21:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC616EB70;
	Thu, 19 Dec 2019 13:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0EB6EB6D;
 Thu, 19 Dec 2019 13:20:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 05:20:55 -0800
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; d="scan'208";a="206204530"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Dec 2019 05:20:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: Provide ddc symlink in hdmi connector sysfs
 directory
In-Reply-To: <48e69dff-84c2-8bb9-5568-6acc32110ff0@collabora.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <878so0m7dd.fsf@intel.com>
 <20191128150130.26266-1-andrzej.p@collabora.com>
 <48e69dff-84c2-8bb9-5568-6acc32110ff0@collabora.com>
Date: Thu, 19 Dec 2019 15:20:51 +0200
Message-ID: <8736dgxxho.fsf@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: intel-gfx@lists.freedesktop.org, kernel@collabora.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBEZWMgMjAxOSwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IDxhbmRyemVqLnBAY29s
bGFib3JhLmNvbT4gd3JvdGU6Cj4gVyBkbml1IDI4LjExLjIwMTkgb8KgMTY6MDEsIEFuZHJ6ZWog
UGlldHJhc2lld2ljeiBwaXN6ZToKPj4gVXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0
aGUgZ2VuZXJpYyBjb25uZWN0b3IuCj4+IAo+Cj4gQSBnZW50bGUgcGluZy4KClB1c2hlZCwgc29y
cnkgZm9yIHRoZSBkZWxheS4KCkJSLApKYW5pLgoKPgo+IEFuZHJ6ZWoKPgo+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+PiBB
Y2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgo+PiBSZXZpZXdlZC1ieTog
RW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KPj4gLS0tCj4+IFJlYmFz
ZWQgb250byBkcm0taW50ZWwtbmV4dC1xdWV1ZWQuCj4+IAo+PiAgIGRyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jIHwgMTIgKysrKysrKystLS0tCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4gCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jCj4+IGluZGV4IDI5YTE3NGFmNTMxNC4uNmVj
OGQxNGJjY2Q3IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2hkbWkuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hk
bWkuYwo+PiBAQCAtMzEzNCw2ICszMTM0LDcgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29ubmVj
dG9yKHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAo+PiAgIAlzdHJ1
Y3QgaW50ZWxfZW5jb2RlciAqaW50ZWxfZW5jb2RlciA9ICZpbnRlbF9kaWdfcG9ydC0+YmFzZTsK
Pj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGludGVsX2VuY29kZXItPmJhc2UuZGV2Owo+
PiAgIAlzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYgPSB0b19pOTE1KGRldik7Cj4+
ICsJc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4+ICAgCWVudW0gcG9ydCBwb3J0ID0gaW50ZWxf
ZW5jb2Rlci0+cG9ydDsKPj4gICAJc3RydWN0IGNlY19jb25uZWN0b3JfaW5mbyBjb25uX2luZm87
Cj4+ICAgCj4+IEBAIC0zMTQ5LDggKzMxNTAsMTMgQEAgdm9pZCBpbnRlbF9oZG1pX2luaXRfY29u
bmVjdG9yKHN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0LAo+PiAgIAkJ
IGludGVsX2VuY29kZXItPmJhc2UubmFtZSkpCj4+ICAgCQlyZXR1cm47Cj4+ICAgCj4+IC0JZHJt
X2Nvbm5lY3Rvcl9pbml0KGRldiwgY29ubmVjdG9yLCAmaW50ZWxfaGRtaV9jb25uZWN0b3JfZnVu
Y3MsCj4+IC0JCQkgICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOwo+PiArCWludGVsX2hkbWkt
PmRkY19idXMgPSBpbnRlbF9oZG1pX2RkY19waW4oZGV2X3ByaXYsIHBvcnQpOwo+PiArCWRkYyA9
IGludGVsX2dtYnVzX2dldF9hZGFwdGVyKGRldl9wcml2LCBpbnRlbF9oZG1pLT5kZGNfYnVzKTsK
Pj4gKwo+PiArCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsIGNvbm5lY3RvciwKPj4g
KwkJCQkgICAgJmludGVsX2hkbWlfY29ubmVjdG9yX2Z1bmNzLAo+PiArCQkJCSAgICBEUk1fTU9E
RV9DT05ORUNUT1JfSERNSUEsCj4+ICsJCQkJICAgIGRkYyk7Cj4+ICAgCWRybV9jb25uZWN0b3Jf
aGVscGVyX2FkZChjb25uZWN0b3IsICZpbnRlbF9oZG1pX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3Mp
Owo+PiAgIAo+PiAgIAljb25uZWN0b3ItPmludGVybGFjZV9hbGxvd2VkID0gMTsKPj4gQEAgLTMx
NjAsOCArMzE2Niw2IEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50
ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwKPj4gICAJaWYgKElOVEVMX0dFTihkZXZf
cHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpCj4+ICAgCQljb25uZWN0b3It
PnljYmNyXzQyMF9hbGxvd2VkID0gdHJ1ZTsKPj4gICAKPj4gLQlpbnRlbF9oZG1pLT5kZGNfYnVz
ID0gaW50ZWxfaGRtaV9kZGNfcGluKGRldl9wcml2LCBwb3J0KTsKPj4gLQo+PiAgIAlpbnRlbF9l
bmNvZGVyLT5ocGRfcGluID0gaW50ZWxfaHBkX3Bpbl9kZWZhdWx0KGRldl9wcml2LCBwb3J0KTsK
Pj4gICAKPj4gICAJaWYgKEhBU19EREkoZGV2X3ByaXYpKQo+PiAKPgoKLS0gCkphbmkgTmlrdWxh
LCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
