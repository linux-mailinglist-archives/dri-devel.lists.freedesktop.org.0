Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C42E25FD6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 21:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4FF86E3E1;
	Thu,  4 Jul 2019 19:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FC56E3D3;
 Thu,  4 Jul 2019 19:33:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jul 2019 12:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,451,1557212400"; d="scan'208";a="155115788"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 04 Jul 2019 12:33:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 04 Jul 2019 22:33:04 +0300
Date: Thu, 4 Jul 2019 22:33:04 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: sunpeng.li@amd.com
Subject: Re: [PATCH 03/10] drm/sysfs: Add mstpath attribute to connector
 devices
Message-ID: <20190704193304.GJ5942@intel.com>
References: <20190704190519.29525-1-sunpeng.li@amd.com>
 <20190704190519.29525-4-sunpeng.li@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704190519.29525-4-sunpeng.li@amd.com>
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDM6MDU6MTJQTSAtMDQwMCwgc3VucGVuZy5saUBhbWQu
Y29tIHdyb3RlOgo+IEZyb206IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IAo+IFRoaXMg
Y2FuIGJlIHVzZWQgdG8gY3JlYXRlIG1vcmUgZGVzY3JpcHRpdmUgc3ltbGlua3MgZm9yIE1TVCBh
dXgKPiBkZXZpY2VzLiBDb25zaWRlciB0aGUgZm9sbG93aW5nIHVkZXYgcnVsZToKPiAKPiBTVUJT
WVNURU09PSJkcm1fZHBfYXV4X2RldiIsIFNVQlNZU1RFTVM9PSJkcm0iLCBBVFRSU3ttc3RwYXRo
fT09Ij8qIiwKPiAJU1lNTElOSys9ImRybV9kcF9hdXgvYnktcGF0aC8kYXR0cnttc3RwYXRofSIK
PiAKPiBUaGUgZm9sbG93aW5nIHN5bWxpbmtzIHdpbGwgYmUgY3JlYXRlZCAoZGVwZW5kaW5nIG9u
IHlvdXIgTVNUIHRvcG9sb2d5KToKPiAKPiAkIGxzIC9kZXYvZHJtX2RwX2F1eC9ieS1wYXRoLwo+
IGNhcmQwLW1zdDowLTEgIGNhcmQwLW1zdDowLTEtMSAgY2FyZDAtbXN0OjAtMS04ICBjYXJkMC1t
c3Q6MC04Cj4gCj4gU2lnbmVkLW9mZi1ieTogTGVvIExpIDxzdW5wZW5nLmxpQGFtZC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyB8IDIzICsrKysrKysrKysrKysrKysr
KysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lz
ZnMuYwo+IGluZGV4IGFkMTA4MTBiYzk3Mi4uNTNmZDFmNzFlOTAwIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fc3lzZnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lz
ZnMuYwo+IEBAIC0yMzYsMTYgKzIzNiwzOSBAQCBzdGF0aWMgc3NpemVfdCBtb2Rlc19zaG93KHN0
cnVjdCBkZXZpY2UgKmRldmljZSwKPiAgCXJldHVybiB3cml0dGVuOwo+ICB9Cj4gIAo+ICtzdGF0
aWMgc3NpemVfdCBtc3RwYXRoX3Nob3coc3RydWN0IGRldmljZSAqZGV2aWNlLAo+ICsJCQkgICAg
c3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsCj4gKwkJCSAgICBjaGFyICpidWYpCj4gK3sK
PiArCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IgPSB0b19kcm1fY29ubmVjdG9yKGRl
dmljZSk7Cj4gKwlzc2l6ZV90IHJldCA9IDA7Cj4gKwljaGFyICpwYXRoOwo+ICsKPiArCW11dGV4
X2xvY2soJmNvbm5lY3Rvci0+ZGV2LT5tb2RlX2NvbmZpZy5tdXRleCk7CgpUaGUgYmxvYiBpcyBw
b3B1bGF0ZWQgd2hlbiB0aGUgY29ubmVjdG9yIGlzIGNyZWF0ZWQgc28gSSBkb24ndCB0aGluawp0
aGlzIGxvY2sgaXMgYWN0dWFsbHkgZG9pbmcgYW55dGhpbmcgZm9yIHVzLgoKT25lIHdvdWxkIGFs
c28gaG9wZSB0aGF0IGRldmljZV91bnJlZ2lzdGVyKCkgcHJvdGVjdHMgdXMgZnJvbSByYWNpbmcK
d2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUgYXR0cmlidXRlLiBFZy4gaWYgeW91IGhvbGQgYSBmaWxl
IGRlc2NyaXB0b3IKb3BlbiB0byB0aGUgc3lzZnMgZmlsZSBkb2VzIGRldmljZV91bnJlZ2lzdGVy
KCkgYmxvY2sgdW50aWwgdGhlIGZkIGlzCmNsb3NlZD8KCj4gKwlpZiAoIWNvbm5lY3Rvci0+cGF0
aF9ibG9iX3B0cikKPiArCQlnb3RvIHVubG9jazsKPiArCj4gKwlwYXRoID0gY29ubmVjdG9yLT5w
YXRoX2Jsb2JfcHRyLT5kYXRhOwo+ICsJcmV0ID0gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJj
YXJkJWQtJXNcbiIsCj4gKwkJICAgICAgIGNvbm5lY3Rvci0+ZGV2LT5wcmltYXJ5LT5pbmRleCwg
cGF0aCk7Cj4gKwo+ICt1bmxvY2s6Cj4gKwltdXRleF91bmxvY2soJmNvbm5lY3Rvci0+ZGV2LT5t
b2RlX2NvbmZpZy5tdXRleCk7Cj4gKwlyZXR1cm4gcmV0Owo+ICt9Cj4gKwo+ICBzdGF0aWMgREVW
SUNFX0FUVFJfUlcoc3RhdHVzKTsKPiAgc3RhdGljIERFVklDRV9BVFRSX1JPKGVuYWJsZWQpOwo+
ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8oZHBtcyk7Cj4gIHN0YXRpYyBERVZJQ0VfQVRUUl9STyht
b2Rlcyk7Cj4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyhtc3RwYXRoKTsKPiAgCj4gIHN0YXRpYyBz
dHJ1Y3QgYXR0cmlidXRlICpjb25uZWN0b3JfZGV2X2F0dHJzW10gPSB7Cj4gIAkmZGV2X2F0dHJf
c3RhdHVzLmF0dHIsCj4gIAkmZGV2X2F0dHJfZW5hYmxlZC5hdHRyLAo+ICAJJmRldl9hdHRyX2Rw
bXMuYXR0ciwKPiAgCSZkZXZfYXR0cl9tb2Rlcy5hdHRyLAo+ICsJJmRldl9hdHRyX21zdHBhdGgu
YXR0ciwKPiAgCU5VTEwKPiAgfTsKPiAgCj4gLS0gCj4gMi4yMi4wCgotLSAKVmlsbGUgU3lyasOk
bMOkCkludGVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
