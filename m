Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4AB10D6FE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 15:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6426E920;
	Fri, 29 Nov 2019 14:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE7456E91E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 14:29:01 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 06:29:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="241064249"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 29 Nov 2019 06:28:57 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 29 Nov 2019 16:28:57 +0200
Date: Fri, 29 Nov 2019 16:28:57 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] drm/panfrost: Document base field location constraint
 in panfrost_gem_object
Message-ID: <20191129142857.GE1208@intel.com>
References: <20191129135614.2439058-1-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191129135614.2439058-1-boris.brezillon@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjksIDIwMTkgYXQgMDI6NTY6MTRQTSArMDEwMCwgQm9yaXMgQnJlemlsbG9u
IHdyb3RlOgo+IEkndmUgc3BlbnQgaG91cnMgY2hhc2luZyBhIG1lbW9yeSBjb3JydXB0aW9uIHRo
YXQgd2FzIGNhdXNlZCBieQo+IGluc2VydGlvbiBvZiBhbiBleHRyYSBmaWVsZCBmaWVsZCBiZWZv
cmUgLT5iYXNlLiBMZXQncyBkb2N1bWVudCB0aGUKPiBmYWN0IHRoYXQgYmFzZSBoYXMgdG8gYmUg
dGhlIGZpcnN0IGZpZWxkIGluIHBhbmZyb3N0X2dlbV9vYmplY3QuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KPiAtLS0K
PiBDaGFuZ2VzIGluIHYyOgo+ICogVXNlIHRoZSBwcm9wZXIgcHJlZml4IGluIHRoZSBzdWJqZWN0
IGxpbmUKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIHwg
NCArKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4gaW5kZXggYjM1MTdmZjk2MzBjLi5kNDgwMjYx
ZmMxNzcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dl
bS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5oCj4gQEAg
LTEwLDYgKzEwLDEwIEBACj4gIHN0cnVjdCBwYW5mcm9zdF9tbXU7Cj4gIAo+ICBzdHJ1Y3QgcGFu
ZnJvc3RfZ2VtX29iamVjdCB7Cj4gKwkvKgo+ICsJICogTXVzdCBiZSB0aGUgZmlyc3QgZWxlbWVu
dCBiZWNhdXNlIHdlJ3JlIHVzaW5nIHNvbWUgb2YgdGhlCj4gKwkgKiBkcm1fZ2VtX3NobWVtIGhl
bHBlcnMuCj4gKwkgKi8KCkFuIGFjY29tcGFueWluZyBCVUlMRF9CVUdfT04oKSB3b3VsZCBiZSBh
IGdvb2Qgd2F5IHRvIGNhdGNoIGFueW9uZQppZ25vcmluZyB0aGUgY29tbWVudC4KCj4gIAlzdHJ1
Y3QgZHJtX2dlbV9zaG1lbV9vYmplY3QgYmFzZTsKPiAgCXN0cnVjdCBzZ190YWJsZSAqc2d0czsK
PiAgCj4gLS0gCj4gMi4yMy4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
