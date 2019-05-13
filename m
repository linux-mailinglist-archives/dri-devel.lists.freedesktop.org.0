Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D41BE35
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2019 21:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C52289175;
	Mon, 13 May 2019 19:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5458D89168;
 Mon, 13 May 2019 19:50:50 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 May 2019 12:50:49 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 13 May 2019 12:50:45 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 13 May 2019 22:50:45 +0300
Date: Mon, 13 May 2019 22:50:45 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [Intel-gfx] [v9 13/13] drm/i915: Add state readout for DRM
 infoframe
Message-ID: <20190513195044.GW24299@intel.com>
References: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
 <1557340733-9629-14-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557340733-9629-14-git-send-email-uma.shankar@intel.com>
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
 dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 ville.syrjala@intel.com, maarten.lankhorst@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMTI6MDg6NTNBTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gQWRkZWQgc3RhdGUgcmVhZG91dCBmb3IgRFJNIGluZm9mcmFtZSBhbmQgZW5hYmxlZAo+
IHN0YXRlIHZhbGlkYXRpb24gZm9yIERSTSBpbmZvZnJhbWUuCj4gCj4gU2lnbmVkLW9mZi1ieTog
VW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaW50ZWxfZGRpLmMgICAgIHwgNCArKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX2Rpc3BsYXkuYyB8IDEgKwo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1p
LmMgICAgfCA0ICsrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9kZGkuYwo+IGluZGV4IGQzNzUyNmIuLjNhMzhmMzIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9kZGkuYwo+IEBAIC0zODQ5LDYgKzM4NDksMTAgQEAgdm9pZCBpbnRl
bF9kZGlfZ2V0X2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiAgCWludGVs
X3JlYWRfaW5mb2ZyYW1lKGVuY29kZXIsIHBpcGVfY29uZmlnLAo+ICAJCQkgICAgIEhETUlfSU5G
T0ZSQU1FX1RZUEVfVkVORE9SLAo+ICAJCQkgICAgICZwaXBlX2NvbmZpZy0+aW5mb2ZyYW1lcy5o
ZG1pKTsKPiArCWlmICgoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCB8fCBJU19HRU1JTklMQUtF
KGRldl9wcml2KSkpCj4gKwkJaW50ZWxfcmVhZF9pbmZvZnJhbWUoZW5jb2RlciwgcGlwZV9jb25m
aWcsCj4gKwkJCQkgICAgIEhETUlfSU5GT0ZSQU1FX1RZUEVfRFJNLAo+ICsJCQkJICAgICAmcGlw
ZV9jb25maWctPmluZm9mcmFtZXMuZHJtKTsKPiAgfQo+ICAKPiAgc3RhdGljIGVudW0gaW50ZWxf
b3V0cHV0X3R5cGUKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlz
cGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jCj4gaW5kZXggYTM1
MWM4ZS4uNzRiNTE4OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9k
aXNwbGF5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNwbGF5LmMKPiBA
QCAtMTIyMzEsNiArMTIyMzEsNyBAQCBzdGF0aWMgYm9vbCBmYXN0Ym9vdF9lbmFibGVkKHN0cnVj
dCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdikKPiAgCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJB
TUUoYXZpKTsKPiAgCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoc3BkKTsKPiAgCVBJUEVfQ09O
Rl9DSEVDS19JTkZPRlJBTUUoaGRtaSk7Cj4gKwlQSVBFX0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKGRy
bSk7Cj4gIAo+ICAjdW5kZWYgUElQRV9DT05GX0NIRUNLX1gKPiAgI3VuZGVmIFBJUEVfQ09ORl9D
SEVDS19JCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwo+IGluZGV4IDIyNGQzM2UuLjM4ODYw
NjUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCj4gQEAgLTE4NjcsNiArMTg2Nywx
MCBAQCBzdGF0aWMgdm9pZCBpbnRlbF9oZG1pX2dldF9jb25maWcoc3RydWN0IGludGVsX2VuY29k
ZXIgKmVuY29kZXIsCj4gIAlpbnRlbF9yZWFkX2luZm9mcmFtZShlbmNvZGVyLCBwaXBlX2NvbmZp
ZywKPiAgCQkJICAgICBIRE1JX0lORk9GUkFNRV9UWVBFX1ZFTkRPUiwKPiAgCQkJICAgICAmcGlw
ZV9jb25maWctPmluZm9mcmFtZXMuaGRtaSk7Cj4gKwlpZiAoKElOVEVMX0dFTihkZXZfcHJpdikg
Pj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpKQo+ICsJCWludGVsX3JlYWRfaW5mb2Zy
YW1lKGVuY29kZXIsIHBpcGVfY29uZmlnLAo+ICsJCQkJICAgICBIRE1JX0lORk9GUkFNRV9UWVBF
X0RSTSwKPiArCQkJCSAgICAgJnBpcGVfY29uZmlnLT5pbmZvZnJhbWVzLmRybSk7CgpEZWFkIGNv
ZGUuCgo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBpbnRlbF9lbmFibGVfaGRtaV9hdWRpbyhzdHJ1
Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKPiAtLSAKPiAxLjkuMQo+IAo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gSW50ZWwtZ2Z4IG1haWxpbmcg
bGlzdAo+IEludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeAoKLS0gClZpbGxlIFN5cmrD
pGzDpApJbnRlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
