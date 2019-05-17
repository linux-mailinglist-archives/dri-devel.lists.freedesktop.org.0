Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F5521988
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 16:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A1F8987C;
	Fri, 17 May 2019 14:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B85A8987C;
 Fri, 17 May 2019 14:06:43 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 May 2019 07:06:43 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 17 May 2019 07:06:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 17 May 2019 17:06:38 +0300
Date: Fri, 17 May 2019 17:06:38 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>
Subject: Re: [v11 05/12] drm/i915: Attach HDR metadata property to connector
Message-ID: <20190517140638.GT24299@intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
 <1558015817-12025-6-git-send-email-uma.shankar@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1558015817-12025-6-git-send-email-uma.shankar@intel.com>
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

T24gVGh1LCBNYXkgMTYsIDIwMTkgYXQgMDc6NDA6MTBQTSArMDUzMCwgVW1hIFNoYW5rYXIgd3Jv
dGU6Cj4gQXR0YWNoIEhEUiBtZXRhZGF0YSBwcm9wZXJ0eSB0byBjb25uZWN0b3Igb2JqZWN0Lgo+
IAo+IHYyOiBSZWJhc2UKPiAKPiB2MzogVXBkYXRlZCB0aGUgcHJvcGVydHkgbmFtZSBhcyBwZXIg
dXBkYXRlZCBuYW1lCj4gd2hpbGUgY3JlYXRpbmcgaGRyIG1ldGFkYXRhIHByb3BlcnR5Cj4gCj4g
U2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4KPiBSZXZp
ZXdlZC1ieTogU2hhc2hhbmsgU2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMgfCAyICsrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaW50ZWxfaGRtaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCj4g
aW5kZXggMmE0MDg2Yy4uOTI1OTdkOCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9pbnRlbF9oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMK
PiBAQCAtMjcyNCw2ICsyNzI0LDggQEAgc3RhdGljIHZvaWQgaW50ZWxfaGRtaV9kZXN0cm95KHN0
cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAo+ICAJZHJtX2Nvbm5lY3Rvcl9hdHRh
Y2hfY29udGVudF90eXBlX3Byb3BlcnR5KGNvbm5lY3Rvcik7Cj4gIAljb25uZWN0b3ItPnN0YXRl
LT5waWN0dXJlX2FzcGVjdF9yYXRpbyA9IEhETUlfUElDVFVSRV9BU1BFQ1RfTk9ORTsKPiArCWRy
bV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZjb25uZWN0b3ItPmJhc2UsCj4gKwkJCQkgICBjb25u
ZWN0b3ItPmRldi0+bW9kZV9jb25maWcuaGRyX291dHB1dF9tZXRhZGF0YV9wcm9wZXJ0eSwgMCk7
CgpJIHRoaW5rIHRoaXMgbmVlZHMgYSBwbGF0Zm9ybSBjaGVjay4gV2Ugc2hvdWxkbid0IGV4cG9z
ZSB0aGlzIG9uCnBsYXRmb3JtcyB0aGF0IGNhbid0IGFjdHVhbGx5IHRyYW5zbWl0IHRoZSBpbmZv
ZnJhbWUuCgo+ICAKPiAgCWlmICghSEFTX0dNQ0goZGV2X3ByaXYpKQo+ICAJCWRybV9jb25uZWN0
b3JfYXR0YWNoX21heF9icGNfcHJvcGVydHkoY29ubmVjdG9yLCA4LCAxMik7Cj4gLS0gCj4gMS45
LjEKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
