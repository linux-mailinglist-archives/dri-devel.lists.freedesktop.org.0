Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81CF644ED
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 12:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25C389E50;
	Wed, 10 Jul 2019 10:07:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71D389CB9;
 Wed, 10 Jul 2019 10:07:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 03:07:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="176795219"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 10 Jul 2019 03:07:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 13:07:19 +0300
Date: Wed, 10 Jul 2019 13:07:19 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sunpeng.li@amd.com
Subject: Re: [PATCH v2] drm/sysfs: Add mstpath attribute to connector devices
Message-ID: <20190710100719.GB5942@intel.com>
References: <20190704190519.29525-4-sunpeng.li@amd.com>
 <20190705143220.11109-1-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705143220.11109-1-sunpeng.li@amd.com>
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMTA6MzI6MjBBTSAtMDQwMCwgc3VucGVuZy5saUBhbWQu
Y29tIHdyb3RlOgo+IEZyb206IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IAo+IFRoaXMg
Y2FuIGJlIHVzZWQgdG8gY3JlYXRlIG1vcmUgZGVzY3JpcHRpdmUgc3ltbGlua3MgZm9yIE1TVCBh
dXgKPiBkZXZpY2VzLiBDb25zaWRlciB0aGUgZm9sbG93aW5nIHVkZXYgcnVsZToKPiAKPiBTVUJT
WVNURU09PSJkcm1fZHBfYXV4X2RldiIsIFNVQlNZU1RFTVM9PSJkcm0iLCBBVFRSU3ttc3RwYXRo
fT09Ij8qIiwKPiAJU1lNTElOSys9ImRybV9kcF9hdXgvYnktcGF0aC8kYXR0cnttc3RwYXRofSIK
PiAKPiBUaGUgZm9sbG93aW5nIHN5bWxpbmtzIHdpbGwgYmUgY3JlYXRlZCAoZGVwZW5kaW5nIG9u
IHlvdXIgTVNUIHRvcG9sb2d5KToKPiAKPiAkIGxzIC9kZXYvZHJtX2RwX2F1eC9ieS1wYXRoLwo+
IGNhcmQwLW1zdDowLTEgIGNhcmQwLW1zdDowLTEtMSAgY2FyZDAtbXN0OjAtMS04ICBjYXJkMC1t
c3Q6MC04Cj4gCj4gdjI6IHJlbW92ZSB1bm5lY2Vzc2FyeSBsb2NraW5nIG9mIG1vZGVfY29uZmln
Lm11dGV4Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpS
ZXZpZXdlZC1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyB8IDIwICsrKysrKysrKysr
KysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3lzZnMuYwo+IGluZGV4IGFkMTA4MTBiYzk3Mi4uN2Q0ODNhYjY4NGEwIDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
c3lzZnMuYwo+IEBAIC0yMzYsMTYgKzIzNiwzNiBAQCBzdGF0aWMgc3NpemVfdCBtb2Rlc19zaG93
KHN0cnVjdCBkZXZpY2UgKmRldmljZSwKPiAgCXJldHVybiB3cml0dGVuOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgc3NpemVfdCBtc3RwYXRoX3Nob3coc3RydWN0IGRldmljZSAqZGV2aWNlLAo+ICsJCQkg
ICAgc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4gKwkJCSAgICBjaGFyICpidWYpCj4g
K3sKPiArCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSB0b19kcm1fY29ubmVjdG9y
KGRldmljZSk7Cj4gKwlzc2l6ZV90IHJldCA9IDA7Cj4gKwljaGFyICpwYXRoOwo+ICsKPiArCWlm
ICghY29ubmVjdG9yLT5wYXRoX2Jsb2JfcHRyKQo+ICsJCXJldHVybiByZXQ7Cj4gKwo+ICsJcGF0
aCA9IGNvbm5lY3Rvci0+cGF0aF9ibG9iX3B0ci0+ZGF0YTsKPiArCXJldCA9IHNucHJpbnRmKGJ1
ZiwgUEFHRV9TSVpFLCAiY2FyZCVkLSVzXG4iLAo+ICsJCSAgICAgICBjb25uZWN0b3ItPmRldi0+
cHJpbWFyeS0+aW5kZXgsIHBhdGgpOwo+ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gIHN0
YXRpYyBERVZJQ0VfQVRUUl9SVyhzdGF0dXMpOwo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8oZW5h
YmxlZCk7Cj4gIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhkcG1zKTsKPiAgc3RhdGljIERFVklDRV9B
VFRSX1JPKG1vZGVzKTsKPiArc3RhdGljIERFVklDRV9BVFRSX1JPKG1zdHBhdGgpOwo+ICAKPiAg
c3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmNvbm5lY3Rvcl9kZXZfYXR0cnNbXSA9IHsKPiAgCSZk
ZXZfYXR0cl9zdGF0dXMuYXR0ciwKPiAgCSZkZXZfYXR0cl9lbmFibGVkLmF0dHIsCj4gIAkmZGV2
X2F0dHJfZHBtcy5hdHRyLAo+ICAJJmRldl9hdHRyX21vZGVzLmF0dHIsCj4gKwkmZGV2X2F0dHJf
bXN0cGF0aC5hdHRyLAo+ICAJTlVMTAo+ICB9Owo+ICAKPiAtLSAKPiAyLjIyLjAKCi0tIApWaWxs
ZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
