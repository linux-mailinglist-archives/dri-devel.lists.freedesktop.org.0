Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2DD6735
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 18:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217A96E530;
	Mon, 14 Oct 2019 16:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68C76E530;
 Mon, 14 Oct 2019 16:23:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 Oct 2019 09:23:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,296,1566889200"; d="scan'208";a="346803997"
Received: from orsmsx103.amr.corp.intel.com ([10.22.225.130])
 by orsmga004.jf.intel.com with ESMTP; 14 Oct 2019 09:23:57 -0700
Received: from orsmsx114.amr.corp.intel.com ([169.254.8.228]) by
 ORSMSX103.amr.corp.intel.com ([169.254.5.9]) with mapi id 14.03.0439.000;
 Mon, 14 Oct 2019 09:23:56 -0700
From: "Li, Juston" <juston.li@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [Intel-gfx] [PATCH i-g-t v2 2/2] NOMERGE: Import drm.h up to
 54ecb8f7028c
Thread-Topic: [Intel-gfx] [PATCH i-g-t v2 2/2] NOMERGE: Import drm.h up to
 54ecb8f7028c
Thread-Index: AQHVehr24y/URQFsvEqif+3JMRebyqdS81eAgAflV4A=
Date: Mon, 14 Oct 2019 16:23:55 +0000
Message-ID: <f52ba1c1a15d0c68b764f757da8c4c684db6492a.camel@intel.com>
References: <20191003184628.7021-1-juston.li@intel.com>
 <20191003184628.7021-2-juston.li@intel.com>
 <20191009154914.GL16989@phenom.ffwll.local>
In-Reply-To: <20191009154914.GL16989@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.198.166]
Content-ID: <078CD94F13E05840A22745D263CDCB66@intel.com>
MIME-Version: 1.0
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTEwLTA5IGF0IDE3OjQ5ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUaHUsIE9jdCAwMywgMjAxOSBhdCAxMTo0NjoyOEFNIC0wNzAwLCBKdXN0b24gTGkgd3Jv
dGU6DQo+ID4gRGVwZW5kcyBvbiB1bW1lcmdlZCBrZXJuZWwgY29kZSBmb3IgZ2V0ZmIyDQo+ID4g
DQo+ID4gUmVzdCBvZiBkcm0uaCB0YWtlbiBmcm9tOg0KPiA+IGNvbW1pdCA1NGVjYjhmNzAyOGM1
ZWIzZDc0MGJiODJiMGYxZDkwZjJkZjYzYzVjDQo+ID4gQXV0aG9yOiBMaW51cyBUb3J2YWxkcyA8
dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+DQo+ID4gRGF0ZTogICBNb24gU2VwIDMwIDEw
OjM1OjQwIDIwMTkgLTA3MDANCj4gPiANCj4gPiAgICAgTGludXggNS40LXJjMQ0KPiA+IA0KPiA+
IFNpZ25lZC1vZmYtYnk6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGludGVsLmNvbT4NCj4gDQo+IEkg
Z3Vlc3MgdGhpcyBzaG91bGQgYmUgZmlyc3QsIHRoZW4gdGhlIHBhdGNoIHRoYXQgdXNlcyBpdD8N
Cj4gLURhbmllbA0KDQpZZXMsIGFwb2xvZ2llcy4gSSdsbCBzd2FwIHRoZSBvcmRlciBhcm91bmQu
DQoNClRoYW5rcw0KSnVzdG9uDQoNCj4gPiAtLS0NCj4gPiAgaW5jbHVkZS9kcm0tdWFwaS9kcm0u
aCB8IDM5DQo+ID4gKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZHJtLXVhcGkvZHJtLmggYi9pbmNsdWRlL2RybS11YXBpL2RybS5oDQo+ID4gaW5k
ZXggODVjNjg1YTIwNzVlLi4wYjAyZjRjOTJkMWUgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9k
cm0tdWFwaS9kcm0uaA0KPiA+ICsrKyBiL2luY2x1ZGUvZHJtLXVhcGkvZHJtLmgNCj4gPiBAQCAt
NjQzLDYgKzY0Myw3IEBAIHN0cnVjdCBkcm1fZ2VtX29wZW4gew0KPiA+ICAjZGVmaW5lIERSTV9D
QVBfUEFHRV9GTElQX1RBUkdFVAkweDExDQo+ID4gICNkZWZpbmUgRFJNX0NBUF9DUlRDX0lOX1ZC
TEFOS19FVkVOVAkweDEyDQo+ID4gICNkZWZpbmUgRFJNX0NBUF9TWU5DT0JKCQkweDEzDQo+ID4g
KyNkZWZpbmUgRFJNX0NBUF9TWU5DT0JKX1RJTUVMSU5FCTB4MTQNCj4gPiAgDQo+ID4gIC8qKiBE
Uk1fSU9DVExfR0VUX0NBUCBpb2N0bCBhcmd1bWVudCB0eXBlICovDQo+ID4gIHN0cnVjdCBkcm1f
Z2V0X2NhcCB7DQo+ID4gQEAgLTcyOSw4ICs3MzAsMTggQEAgc3RydWN0IGRybV9zeW5jb2JqX2hh
bmRsZSB7DQo+ID4gIAlfX3UzMiBwYWQ7DQo+ID4gIH07DQo+ID4gIA0KPiA+ICtzdHJ1Y3QgZHJt
X3N5bmNvYmpfdHJhbnNmZXIgew0KPiA+ICsJX191MzIgc3JjX2hhbmRsZTsNCj4gPiArCV9fdTMy
IGRzdF9oYW5kbGU7DQo+ID4gKwlfX3U2NCBzcmNfcG9pbnQ7DQo+ID4gKwlfX3U2NCBkc3RfcG9p
bnQ7DQo+ID4gKwlfX3UzMiBmbGFnczsNCj4gPiArCV9fdTMyIHBhZDsNCj4gPiArfTsNCj4gPiAr
DQo+ID4gICNkZWZpbmUgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0FMTCAoMSA8PCAwKQ0K
PiA+ICAjZGVmaW5lIERSTV9TWU5DT0JKX1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUICgxIDw8
IDEpDQo+ID4gKyNkZWZpbmUgRFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0FWQUlMQUJMRSAo
MSA8PCAyKSAvKiB3YWl0IGZvcg0KPiA+IHRpbWUgcG9pbnQgdG8gYmVjb21lIGF2YWlsYWJsZSAq
Lw0KPiA+ICBzdHJ1Y3QgZHJtX3N5bmNvYmpfd2FpdCB7DQo+ID4gIAlfX3U2NCBoYW5kbGVzOw0K
PiA+ICAJLyogYWJzb2x1dGUgdGltZW91dCAqLw0KPiA+IEBAIC03NDEsMTIgKzc1MiwzMyBAQCBz
dHJ1Y3QgZHJtX3N5bmNvYmpfd2FpdCB7DQo+ID4gIAlfX3UzMiBwYWQ7DQo+ID4gIH07DQo+ID4g
IA0KPiA+ICtzdHJ1Y3QgZHJtX3N5bmNvYmpfdGltZWxpbmVfd2FpdCB7DQo+ID4gKwlfX3U2NCBo
YW5kbGVzOw0KPiA+ICsJLyogd2FpdCBvbiBzcGVjaWZpYyB0aW1lbGluZSBwb2ludCBmb3IgZXZl
cnkgaGFuZGxlcyovDQo+ID4gKwlfX3U2NCBwb2ludHM7DQo+ID4gKwkvKiBhYnNvbHV0ZSB0aW1l
b3V0ICovDQo+ID4gKwlfX3M2NCB0aW1lb3V0X25zZWM7DQo+ID4gKwlfX3UzMiBjb3VudF9oYW5k
bGVzOw0KPiA+ICsJX191MzIgZmxhZ3M7DQo+ID4gKwlfX3UzMiBmaXJzdF9zaWduYWxlZDsgLyog
b25seSB2YWxpZCB3aGVuIG5vdCB3YWl0aW5nIGFsbCAqLw0KPiA+ICsJX191MzIgcGFkOw0KPiA+
ICt9Ow0KPiA+ICsNCj4gPiArDQo+ID4gIHN0cnVjdCBkcm1fc3luY29ial9hcnJheSB7DQo+ID4g
IAlfX3U2NCBoYW5kbGVzOw0KPiA+ICAJX191MzIgY291bnRfaGFuZGxlczsNCj4gPiAgCV9fdTMy
IHBhZDsNCj4gPiAgfTsNCj4gPiAgDQo+ID4gK3N0cnVjdCBkcm1fc3luY29ial90aW1lbGluZV9h
cnJheSB7DQo+ID4gKwlfX3U2NCBoYW5kbGVzOw0KPiA+ICsJX191NjQgcG9pbnRzOw0KPiA+ICsJ
X191MzIgY291bnRfaGFuZGxlczsNCj4gPiArCV9fdTMyIHBhZDsNCj4gPiArfTsNCj4gPiArDQo+
ID4gKw0KPiA+ICAvKiBRdWVyeSBjdXJyZW50IHNjYW5vdXQgc2VxdWVuY2UgbnVtYmVyICovDQo+
ID4gIHN0cnVjdCBkcm1fY3J0Y19nZXRfc2VxdWVuY2Ugew0KPiA+ICAJX191MzIgY3J0Y19pZDsJ
CS8qIHJlcXVlc3RlZCBjcnRjX2lkICovDQo+ID4gQEAgLTkwMyw2ICs5MzUsMTMgQEAgZXh0ZXJu
ICJDIiB7DQo+ID4gICNkZWZpbmUgRFJNX0lPQ1RMX01PREVfR0VUX0xFQVNFCURSTV9JT1dSKDB4
QzgsIHN0cnVjdA0KPiA+IGRybV9tb2RlX2dldF9sZWFzZSkNCj4gPiAgI2RlZmluZSBEUk1fSU9D
VExfTU9ERV9SRVZPS0VfTEVBU0UJRFJNX0lPV1IoMHhDOSwgc3RydWN0DQo+ID4gZHJtX21vZGVf
cmV2b2tlX2xlYXNlKQ0KPiA+ICANCj4gPiArI2RlZmluZSBEUk1fSU9DVExfU1lOQ09CSl9USU1F
TElORV9XQUlUCURSTV9JT1dSKDB4Q0EsIHN0cnVjdA0KPiA+IGRybV9zeW5jb2JqX3RpbWVsaW5l
X3dhaXQpDQo+ID4gKyNkZWZpbmUgRFJNX0lPQ1RMX1NZTkNPQkpfUVVFUlkJCURSTV9JT1dSKDB4
Q0IsIHN0cnVjdA0KPiA+IGRybV9zeW5jb2JqX3RpbWVsaW5lX2FycmF5KQ0KPiA+ICsjZGVmaW5l
IERSTV9JT0NUTF9TWU5DT0JKX1RSQU5TRkVSCURSTV9JT1dSKDB4Q0MsIHN0cnVjdA0KPiA+IGRy
bV9zeW5jb2JqX3RyYW5zZmVyKQ0KPiA+ICsjZGVmaW5lIERSTV9JT0NUTF9TWU5DT0JKX1RJTUVM
SU5FX1NJR05BTAlEUk1fSU9XUigweENELCBzdHJ1Y3QNCj4gPiBkcm1fc3luY29ial90aW1lbGlu
ZV9hcnJheSkNCj4gPiArDQo+ID4gKyNkZWZpbmUgRFJNX0lPQ1RMX01PREVfR0VURkIyCQlEUk1f
SU9XUigweENFLCBzdHJ1Y3QNCj4gPiBkcm1fbW9kZV9mYl9jbWQyKQ0KPiA+ICsNCj4gPiAgLyoq
DQo+ID4gICAqIERldmljZSBzcGVjaWZpYyBpb2N0bHMgc2hvdWxkIG9ubHkgYmUgaW4gdGhlaXIg
cmVzcGVjdGl2ZQ0KPiA+IGhlYWRlcnMNCj4gPiAgICogVGhlIGRldmljZSBzcGVjaWZpYyBpb2N0
bCByYW5nZSBpcyBmcm9tIDB4NDAgdG8gMHg5Zi4NCj4gPiAtLSANCj4gPiAyLjIxLjANCj4gPiAN
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+
IEludGVsLWdmeCBtYWlsaW5nIGxpc3QNCj4gPiBJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnDQo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
bnRlbC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
