Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FEB1FAC0
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 21:30:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4894E8925E;
	Wed, 15 May 2019 19:30:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC25B8925E;
 Wed, 15 May 2019 19:30:02 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 May 2019 12:30:01 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 15 May 2019 12:29:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 15 May 2019 22:29:56 +0300
Date: Wed, 15 May 2019 22:29:56 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v10 12/12] drm/i915: Add state readout for DRM infoframe
Message-ID: <20190515192956.GG24299@intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
 <1557855394-12214-13-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557855394-12214-13-git-send-email-uma.shankar@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, intel-gfx@lists.freedesktop.org,
 emil.l.velikov@gmail.com, dri-devel@lists.freedesktop.org,
 seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMTE6MDY6MzRQTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gQWRkZWQgc3RhdGUgcmVhZG91dCBmb3IgRFJNIGluZm9mcmFtZSBhbmQgZW5hYmxlZAo+
IHN0YXRlIHZhbGlkYXRpb24gZm9yIERSTSBpbmZvZnJhbWUuCj4gCj4gdjI6IEFkZHJlc3NlZCBW
aWxsZSdzIHJldmlldyBjb21tZW50cyBhbmQgZHJvcHBlZCB0aGUKPiB1bnVzZWQgZHJtIGluZm9m
cmFtZSByZWFkIGF0IGludGVsX2hkbWlfaW5pdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVbWEgU2hh
bmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9kZGkuYyAgICAgfCA0ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
ZGlzcGxheS5jIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKPiBpbmRleCAwYWY0N2YzLi5mNTc0MzE1IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKPiBAQCAtMzgzNCw2ICszODM0LDEwIEBAIHZvaWQgaW50
ZWxfZGRpX2dldF9jb25maWcoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCj4gIAlpbnRl
bF9yZWFkX2luZm9mcmFtZShlbmNvZGVyLCBwaXBlX2NvbmZpZywKPiAgCQkJICAgICBIRE1JX0lO
Rk9GUkFNRV9UWVBFX1ZFTkRPUiwKPiAgCQkJICAgICAmcGlwZV9jb25maWctPmluZm9mcmFtZXMu
aGRtaSk7Cj4gKwlpZiAoKElOVEVMX0dFTihkZXZfcHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFL
RShkZXZfcHJpdikpKQoKU2lsbHkgZXh0cmEgcGFyZW5zLiBBY3R1YWxseSwgSSB0aGluayB0aGUg
Y2hlY2sgY2FuIGJlCnJlbW92ZWQgZW50aXJlbHkgc2luY2UgaW50ZWxfcmVhZF9pbmZvZnJhbWUo
KSBhbHNvIGNoZWNrcwppbmZvZnJhbWVzLmVuYWJsZS4KCj4gKwkJaW50ZWxfcmVhZF9pbmZvZnJh
bWUoZW5jb2RlciwgcGlwZV9jb25maWcsCj4gKwkJCQkgICAgIEhETUlfSU5GT0ZSQU1FX1RZUEVf
RFJNLAo+ICsJCQkJICAgICAmcGlwZV9jb25maWctPmluZm9mcmFtZXMuZHJtKTsKPiAgfQo+ICAK
PiAgc3RhdGljIGVudW0gaW50ZWxfb3V0cHV0X3R5cGUKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
ZGlzcGxheS5jCj4gaW5kZXggZTM1YmE4ZC4uYzg5YjIxNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9kaXNwbGF5LmMKPiBAQCAtMTIyNzQsNiArMTIyNzQsNyBAQCBzdGF0aWMgYm9vbCBm
YXN0Ym9vdF9lbmFibGVkKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKPiAgCVBJ
UEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoYXZpKTsKPiAgCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJB
TUUoc3BkKTsKPiAgCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoaGRtaSk7Cj4gKwlQSVBFX0NP
TkZfQ0hFQ0tfSU5GT0ZSQU1FKGRybSk7Cj4gIAo+ICAjdW5kZWYgUElQRV9DT05GX0NIRUNLX1gK
PiAgI3VuZGVmIFBJUEVfQ09ORl9DSEVDS19JCj4gLS0gCj4gMS45LjEKCi0tIApWaWxsZSBTeXJq
w6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
