Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A1A7A4CB
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A19C6E47B;
	Tue, 30 Jul 2019 09:40:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03776E47B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:40:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 02:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="171873044"
Received: from fledrich-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2019 02:40:34 -0700
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: Daniel Vetter <daniel@ffwll.ch>, zhoucm1 <zhoucm1@amd.com>
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <20190730092728.GM15868@phenom.ffwll.local>
 <43e4a527-8895-c958-5717-b1f7530571d7@amd.com>
 <20190730093631.GO15868@phenom.ffwll.local>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <f3137289-7ed7-e47d-a853-6d93a086fdd0@intel.com>
Date: Tue, 30 Jul 2019 12:40:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730093631.GO15868@phenom.ffwll.local>
Content-Language: en-US
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDcvMjAxOSAxMjozNiwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBUdWUsIEp1bCAz
MCwgMjAxOSBhdCAwNTozMToyNlBNICswODAwLCB6aG91Y20xIHdyb3RlOgo+Pgo+PiBPbiAyMDE5
5bm0MDfmnIgzMOaXpSAxNzoyNywgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+IE9uIE1vbiwgSnVs
IDI5LCAyMDE5IGF0IDA0OjIwOjM5UE0gKzA4MDAsIENodW5taW5nIFpob3Ugd3JvdGU6Cj4+Pj4g
SXQgaXMgbm9ybWFsIHRoYXQgYmluYXJ5IHN5bmNvYmogcmVwbGFjZXMgdGhlIHVuZGVybHlpbmcg
ZmVuY2UuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgo+Pj4gRG8gd2UgaGl0IHRoaXMgd2l0aCBvbmUgb2YgdGhlIHN5bmNvYmogaWd0
cz8KPj4gVW5mb3J0dXJuYXRlbHksIE5vLCBJdCdzIG9ubHkgaGl0IGluIEFNREdQVSBwYXRoLCB3
aGljaCBjb21iaW5lcyB0aW1lbGluZQo+PiBhbmQgYmluYXJ5IHRvIHNhbWUgcGF0aCB3aGVuIHRp
bWVsaW5lIGlzIGVuYWJsZWQuCgoKV2UgY2FuIHRvdGFsbHkgYnVpbGQgdGhhdCBjYXNlIHdpdGgg
c3dfZmVuY2VzIHdoaWNoIGlzIHdoYXQgb25lIG9mIHRoZSAKSUdUIHRlc3RzIGRvZXMuCgoKLUxp
b25lbAoKCj4gTG9va3MgbGlrZSBsaW9uZWwgaGFzIHNvbWV0aGluZywgbWF5YmUgaGVscCByZXZp
ZXcgdGhhdD8KPiAtRGFuaWVsCj4KPj4gLURhdmlkCj4+PiAtRGFuaWVsCj4+Pgo+Pj4+IC0tLQo+
Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jIHwgMyAtLS0KPj4+PiAgICAxIGZp
bGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4+
Pj4gaW5kZXggOTI5ZjdjNjRmOWEyLi5iYzdlYzE2NzllNGQgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X3N5bmNvYmouYwo+Pj4+IEBAIC0xNTEsOSArMTUxLDYgQEAgdm9pZCBkcm1fc3luY29ial9hZGRf
cG9pbnQoc3RydWN0IGRybV9zeW5jb2JqICpzeW5jb2JqLAo+Pj4+ICAgIAlzcGluX2xvY2soJnN5
bmNvYmotPmxvY2spOwo+Pj4+ICAgIAlwcmV2ID0gZHJtX3N5bmNvYmpfZmVuY2VfZ2V0KHN5bmNv
YmopOwo+Pj4+IC0JLyogWW91IGFyZSBhZGRpbmcgYW4gdW5vcmRlciBwb2ludCB0byB0aW1lbGlu
ZSwgd2hpY2ggY291bGQgY2F1c2UgcGF5bG9hZCByZXR1cm5lZCBmcm9tIHF1ZXJ5X2lvY3RsIGlz
IDAhICovCj4+Pj4gLQlpZiAocHJldiAmJiBwcmV2LT5zZXFubyA+PSBwb2ludCkKPj4+PiAtCQlE
Uk1fRVJST1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUhXG4i
KTsKPj4+PiAgICAJZG1hX2ZlbmNlX2NoYWluX2luaXQoY2hhaW4sIHByZXYsIGZlbmNlLCBwb2lu
dCk7Cj4+Pj4gICAgCXJjdV9hc3NpZ25fcG9pbnRlcihzeW5jb2JqLT5mZW5jZSwgJmNoYWluLT5i
YXNlKTsKPj4+PiAtLSAKPj4+PiAyLjE3LjEKPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+
Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
