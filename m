Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990ADF13CB
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 11:24:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8823F6ECB1;
	Wed,  6 Nov 2019 10:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07B606ECB1;
 Wed,  6 Nov 2019 10:24:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 02:24:08 -0800
X-IronPort-AV: E=Sophos;i="5.68,274,1569308400"; d="scan'208";a="196160296"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.251.95.117])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 02:24:06 -0800
MIME-Version: 1.0
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <157298841686.18566.729698423669886628@skylake-alporthouse-com>
References: <20191105193829.11599-1-daniel.vetter@ffwll.ch>
 <157298628160.18566.1185169568557179711@skylake-alporthouse-com>
 <CAKMK7uFW7PqFjcci4SdLGMoSK6gqMK-gPU0OHpoJFjVZJnYT=w@mail.gmail.com>
 <157298841686.18566.729698423669886628@skylake-alporthouse-com>
Message-ID: <157303584321.10062.10632976886717947313@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Don't select BROKEN
Date: Wed, 06 Nov 2019 12:24:03 +0200
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTEtMDUgMjM6MTM6MzYpCj4gUXVvdGluZyBEYW5p
ZWwgVmV0dGVyICgyMDE5LTExLTA1IDIwOjU4OjI1KQo+ID4gT24gVHVlLCBOb3YgNSwgMjAxOSBh
dCA5OjM4IFBNIENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPiB3cm90ZToK
PiA+ID4KPiA+ID4gUXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTExLTA1IDE5OjM4OjI5KQo+
ID4gPiA+IEl0J3MgYnJva2VuLgo+ID4gPiA+Cj4gPiA+ID4gUmVwb3J0ZWQtYnk6IFN0ZXBoZW4g
Um90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pgo+ID4gPiA+IFJlZmVyZW5jZXM6IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LU5vdmVtYmVy
LzI0MjYyNS5odG1sCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Cj4gPiA+ID4gLS0tCj4gPiA+ID4gTm90ZTogUHJvYmFibHkgYmVz
dCB0byBhcHBseSB0aGlzIGRpcmVjdGx5IG9udG8gZHJtLW5leHQgdG8gYXZvaWQKPiA+ID4gPiBo
YXZpbmcgZHJtLW5leHQgZHJvcHBlZCBmcm9tIGxpbnV4LW5leHQgdW50aWwgdGhlIG5leHQgcHVs
bCByZXF1ZXN0Lgo+ID4gPiA+IC1EYW5pZWwKPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9n
cHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1ZyB8IDEgLQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBkZWxldGlvbigtKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L0tjb25maWcuZGVidWcgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9LY29uZmlnLmRlYnVn
Cj4gPiA+ID4gaW5kZXggZWYxMjNlYjI5MTY4Li5kMmJhOGY3ZTVlNTAgMTAwNjQ0Cj4gPiA+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvS2NvbmZpZy5kZWJ1Zwo+ID4gPiA+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L0tjb25maWcuZGVidWcKPiA+ID4gPiBAQCAtNDQsNyArNDQsNiBA
QCBjb25maWcgRFJNX0k5MTVfREVCVUcKPiA+ID4gPiAgICAgICAgIHNlbGVjdCBEUk1fSTkxNV9T
RUxGVEVTVAo+ID4gPiA+ICAgICAgICAgc2VsZWN0IERSTV9JOTE1X0RFQlVHX1JVTlRJTUVfUE0K
PiA+ID4gPiAgICAgICAgIHNlbGVjdCBEUk1fSTkxNV9ERUJVR19NTUlPCj4gPiA+ID4gLSAgICAg
ICBzZWxlY3QgQlJPS0VOICMgZm9yIHByb3RvdHlwZSB1QVBJCj4gPiA+Cj4gPiA+IFlvdSBoYXZl
IHRvIHJlcGxhY2UgaXQgd2l0aCBhbm90aGVyIHNlY3JldCBib29sIGFzIHlvdSBjYW5ub3Qgb3Ro
ZXJ3aXNlCj4gPiA+IGVuYWJsZSBDT05GSUdfQlJPS0VOIGluIC5jb25maWcuCj4gPiAKPiA+IE9y
IHRoaXM6Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9pbml0L0tjb25maWcgYi9pbml0L0tjb25maWcK
PiA+IGluZGV4IGI0ZGFhZDJiYWMyMy4uNGRiZWExYjllNmJiIDEwMDY0NAo+ID4gLS0tIGEvaW5p
dC9LY29uZmlnCj4gPiArKysgYi9pbml0L0tjb25maWcKPiA+IEBAIC03NSw2ICs3NSw3IEBAIG1l
bnUgIkdlbmVyYWwgc2V0dXAiCj4gPiAKPiA+ICBjb25maWcgQlJPS0VOCj4gPiAgICAgICAgIGJv
b2wKPiA+ICsgICAgICAgZGVmYXVsdCB5Cj4gPiAKPiA+ICBjb25maWcgQlJPS0VOX09OX1NNUAo+
ID4gICAgICAgICBib29sCj4gPiAKPiA+IEVpdGhlciB3YXkgaXQgbmVlZHMgdG8gYmUgaW4gdG9w
aWMvY29yZS1mb3ItQ0ksIG5vdCBpbiBhbnkgb2ZmaWNpYWwKPiA+IHRyZWUuIEJlY2F1c2UgaWYg
eW91IGFsbG93IGF1dG9idWlsZGVycyB0byBlbmFibGUgQ09ORklHX0JST0tFTiwgbm8KPiA+IG1h
dHRlciBob3cgd2VsbCBoaWRkZW4sIHRoZXknbGwgYWxsIGJyZWFrLiBZb3UgY2FuIGFsc28ganVz
dCByZXZlcnQgbXkKPiA+IHBhdGNoIHRoYXQgRGF2ZSBwdXNoZWQgdG8gZHJtLW5leHQgKHRvIGdl
dCB1cyBiYWNrIGludG8gdGhlIGxpbnV4LW5leHQKPiA+IGNsdWIpLgo+IAo+IEZ3aXcsIEkgdGhp
bmsgdGhlIHJldmVydCBpbiBjb3JlLWZvci1DSSBpcyByZWFzb25hYmxlLCBhcyB0aGF0IGdpdmVz
Cj4gZGV2cyB0aGUgYWJpbGl0eSB0byB0b2dnbGUgb24gdGhlIGhpZGRlbiBtZW51cywgd2hpbGUg
YXQgdGhlIHNhbWUgdGltZQo+IHJlcXVpcmluZyB0aGVtIHRvIGhhdmUgdGhlIG1pbmltYWwgZGVi
dWcgc2V0dXAuCgpJJ3ZlIG5vdyByZXZlcnRlZCB0aGlzIGluIGNvcmUtZm9yLUNJLgoKUmVnYXJk
cywgSm9vbmFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
