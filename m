Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86AAD48454
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 15:44:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 619098924F;
	Mon, 17 Jun 2019 13:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 700698924F
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:44:43 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2019 06:44:43 -0700
X-ExtLoop1: 1
Received: from brunaker-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.22.241])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Jun 2019 06:44:41 -0700
Date: Mon, 17 Jun 2019 14:44:41 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Niclas Zeising <zeising@daemonic.se>
Subject: Re: [PATCH libdrm v2 4/4] meson.build: Fix meson script on FreeBSD
Message-ID: <20190617134441.nxzbjxozlfe6v46s@intel.com>
References: <20190616132343.26370-1-emil.l.velikov@gmail.com>
 <20190616132343.26370-4-emil.l.velikov@gmail.com>
 <20190617091435.35ftj5twdxpspxnr@intel.com>
 <ca1171ab-ebbe-23f2-15c7-552bbf6aaf38@daemonic.se>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca1171ab-ebbe-23f2-15c7-552bbf6aaf38@daemonic.se>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uZGF5LCAyMDE5LTA2LTE3IDExOjIwOjQzICswMjAwLCBOaWNsYXMgWmVpc2luZyB3cm90
ZToKPiBPbiAyMDE5LTA2LTE3IDExOjE0LCBFcmljIEVuZ2VzdHJvbSB3cm90ZToKPiA+IE9uIFN1
bmRheSwgMjAxOS0wNi0xNiAxNDoyMzo0MyArMDEwMCwgRW1pbCBWZWxpa292IHdyb3RlOgo+ID4g
PiBGcm9tOiBOaWNsYXMgWmVpc2luZyA8emVpc2luZ0BkYWVtb25pYy5zZT4KPiA+ID4gCj4gPiA+
IEZyZWVCU0QgcmVxdWlyZXMgc3lzL3R5cGVzLmggZm9yIHN5cy9zeXNjdGwuaCwgYWRkIGl0IGFz
IHBhcnQgb2YgdGhlCj4gPiA+IGluY2x1ZGVzIHdoZW4gY2hlY2tpbmcgZm9yIGhlYWRlcnMuCj4g
PiA+IEluc3RlYWQgb2Ygc3BsaXR0aW5nIG91dCB0aGUgY2hlY2sgZm9yIHN5cy9zeXNjdGwuaCBm
cm9tIHRoZSBvdGhlcgo+ID4gPiBoZWFkZXIgY2hlY2tzLCBqdXN0IGFkZCBzeXMvdHlwZXMuaCB0
byBhbGwgaGVhZGVyIGNoZWNrcy4KPiA+ID4gCj4gPiA+IHYyIFtFbWlsXQo+ID4gPiAgIC0gYWRk
IGlubGluZSBjb21tZW50Cj4gPiA+ICAgLSBkcm9wIGJhc2gvc2ggaHVuawo+ID4gPiAKPiA+ID4g
U2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4g
PiAKPiA+IFNlcmllcyBpczoKPiA+IFJldmlld2VkLWJ5OiBFcmljIEVuZ2VzdHJvbSA8ZXJpYy5l
bmdlc3Ryb21AaW50ZWwuY29tPgo+ID4gCj4gPiBCdXQgSSBhZ3JlZSB3aXRoIEVtaWwsIGl0J3Mg
YSBGcmVlQlNEIGJ1ZyBmb3IgaXQgdG8gbm90IGluY2x1ZGUKPiA+IGEgcmVxdWlyZWQgaGVhZGVy
LCB0aGlzIHNob3VsZCBhbHNvIGJlIGZpeGVkIHVwc3RyZWFtLgo+IAo+IEknbSBub3Qgc3VyZSBp
ZiBteSBlLW1haWxzIGFyZSBnZXR0aW5nIHRvIHRoZSBtYWlsaW5nIGxpc3QuCgpUaGV5IGFyZSA6
KQoKWW91IGNhbiBjaGVjayB0aGUgYXJjaGl2ZSBpZiB5b3UncmUgbm90IHN1cmU6Cmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL2FyY2hpdmVzL2RyaS1kZXZlbC8yMDE5LUp1bmUvdGhyZWFk
Lmh0bWwKCj4gVGhpcyBpcyB0aGUgd2F5Cj4gaXQncyBkb2N1bWVudGVkIGluIEZyZWVCU0QsIGFu
ZCB0aGVyZSBpcyBhIGxvdCBvZiBsZWdhY3kgcmVhc29ucyBpdCBpcyB0aGlzCj4gd2F5LiAgSSBk
b3VidCBpdCB3aWxsIGNoYW5nZSwgYW5kIGV2ZW4gaWYgaXQgZG9lcywgdGhlcmUgd2lsbCBiZSBh
Ym91dCA1Cj4geWVhcnMgb2YgdHJhbnNpdGlvbiBwZXJpb2QgYmVmb3JlIGFsbCBzdXBwb3J0ZWQg
cmVsZWFzZXMgaGFzIHRoZSBjaGFuZ2UsCj4gbW9zdCBsaWtlbHkuCj4gCj4gVGhpcyBpcyB0aGUg
Zmlyc3QgdGltZSwgdG8gbXkga25vd2xlZGdlLCB0aGlzIGlzc3VlIGhhcyBjb21lIHVwLgo+IAo+
IChJJ20gbm90IHNheWluZyBJIGRpc2FncmVlIHdpdGggeW91LCBqdXN0IHNheWluZyBpdCdzIHBy
b2JhYmx5IGVhc2llciB0bwo+IHBhdGNoIGhlcmUgcmF0aGVyIHRoYW4gdHJ5IHRvIGNoYW5nZSB1
cHN0cmVhbS4pCj4gCj4gUmVnYXJkcwo+IC0tIAo+IE5pY2xhcwoKSWYgdGhpbmsgd2UgYm90aCBh
Z3JlZSB0aGVuIDspCkkgZGVmaW5pdGVseSBhZ3JlZSB3aXRoIHNob3VsZCBoYXZlIHRoZSB3b3Jr
YXJvdW5kIGRvd25zdHJlYW0sIGFsbApJIG1lYW50IGlzIHRoYXQgaXQncyB3b3J0aCBwdXNoaW5n
IHVwc3RyZWFtIHRvIGZpeCB0aGUgYnVnIHNvIHRoYXQKKmV2ZW50dWFsbHkqIG5vdCBhbGwgZG93
bnN0cmVhbSB1c2VycyBuZWVkcyB0byBoYXZlIHRoZSB3b3JrYXJvdW5kIChidXQKeWVhaCwgdGhh
dCB3aWxsIHRha2UgeWVhcnMgdG8gcmVhY2gpLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
