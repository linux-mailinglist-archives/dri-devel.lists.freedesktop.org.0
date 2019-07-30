Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FB77A428
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 11:29:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7DC89CF6;
	Tue, 30 Jul 2019 09:29:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5B789CF6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 09:29:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2019 02:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; d="scan'208";a="171869667"
Received: from fledrich-mobl.ger.corp.intel.com (HELO [10.252.37.121])
 ([10.252.37.121])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2019 02:29:25 -0700
Subject: Re: [PATCH] drm/syncobj: remove boring message
To: Daniel Vetter <daniel@ffwll.ch>, Chunming Zhou <david1.zhou@amd.com>
References: <20190729082039.23837-1-david1.zhou@amd.com>
 <20190730092728.GM15868@phenom.ffwll.local>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <38e39493-ce78-db7f-45df-827c81484404@intel.com>
Date: Tue, 30 Jul 2019 12:29:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730092728.GM15868@phenom.ffwll.local>
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

T24gMzAvMDcvMjAxOSAxMjoyNywgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBNb24sIEp1bCAy
OSwgMjAxOSBhdCAwNDoyMDozOVBNICswODAwLCBDaHVubWluZyBaaG91IHdyb3RlOgo+PiBJdCBp
cyBub3JtYWwgdGhhdCBiaW5hcnkgc3luY29iaiByZXBsYWNlcyB0aGUgdW5kZXJseWluZyBmZW5j
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNv
bT4KPiBEbyB3ZSBoaXQgdGhpcyB3aXRoIG9uZSBvZiB0aGUgc3luY29iaiBpZ3RzPwo+IC1EYW5p
ZWwKCgpXaXRoIG9uZSBvZiB0aGUgdGVzdHMgc2l0dGluZyBvbiB0aGUgbWFpbGluZyBsaXN0IHdh
aXRpbmcgZm9yIHJldmlldywgeWVzLgoKCi1MaW9uZWwKCgo+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fc3luY29iai5jIHwgMyAtLS0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKPj4gaW5kZXggOTI5ZjdjNjRmOWEyLi5i
YzdlYzE2NzllNGQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5j
Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCj4+IEBAIC0xNTEsOSArMTUx
LDYgQEAgdm9pZCBkcm1fc3luY29ial9hZGRfcG9pbnQoc3RydWN0IGRybV9zeW5jb2JqICpzeW5j
b2JqLAo+PiAgIAlzcGluX2xvY2soJnN5bmNvYmotPmxvY2spOwo+PiAgIAo+PiAgIAlwcmV2ID0g
ZHJtX3N5bmNvYmpfZmVuY2VfZ2V0KHN5bmNvYmopOwo+PiAtCS8qIFlvdSBhcmUgYWRkaW5nIGFu
IHVub3JkZXIgcG9pbnQgdG8gdGltZWxpbmUsIHdoaWNoIGNvdWxkIGNhdXNlIHBheWxvYWQgcmV0
dXJuZWQgZnJvbSBxdWVyeV9pb2N0bCBpcyAwISAqLwo+PiAtCWlmIChwcmV2ICYmIHByZXYtPnNl
cW5vID49IHBvaW50KQo+PiAtCQlEUk1fRVJST1IoIllvdSBhcmUgYWRkaW5nIGFuIHVub3JkZXIg
cG9pbnQgdG8gdGltZWxpbmUhXG4iKTsKPj4gICAJZG1hX2ZlbmNlX2NoYWluX2luaXQoY2hhaW4s
IHByZXYsIGZlbmNlLCBwb2ludCk7Cj4+ICAgCXJjdV9hc3NpZ25fcG9pbnRlcihzeW5jb2JqLT5m
ZW5jZSwgJmNoYWluLT5iYXNlKTsKPj4gICAKPj4gLS0gCj4+IDIuMTcuMQo+Pgo+PiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
