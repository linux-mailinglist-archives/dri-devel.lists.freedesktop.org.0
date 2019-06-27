Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A6B581D0
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 13:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480046E0D1;
	Thu, 27 Jun 2019 11:45:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B756E0D1;
 Thu, 27 Jun 2019 11:45:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 04:45:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="185240443"
Received: from irsmsx106.ger.corp.intel.com ([163.33.3.31])
 by fmsmga004.fm.intel.com with ESMTP; 27 Jun 2019 04:45:17 -0700
Received: from irsmsx156.ger.corp.intel.com (10.108.20.68) by
 IRSMSX106.ger.corp.intel.com (163.33.3.31) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Jun 2019 12:45:17 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.184]) by
 IRSMSX156.ger.corp.intel.com ([169.254.3.131]) with mapi id 14.03.0439.000;
 Thu, 27 Jun 2019 12:45:18 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/3] Send a hotplug when edid changes
Thread-Topic: [PATCH v1 0/3] Send a hotplug when edid changes
Thread-Index: AQHVLLYfWgSoMmoDiEeFhM/DC89cyqavTOyAgAAEOwA=
Date: Thu, 27 Jun 2019 11:45:17 +0000
Message-ID: <93251c0329c8b70dab30addf98e1cef750a6cbee.camel@intel.com>
References: <20190627070016.7047-1-stanislav.lisovskiy@intel.com>
 <20190627112917.GK12905@phenom.ffwll.local>
In-Reply-To: <20190627112917.GK12905@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.154]
Content-ID: <F0042DFA4571F648B63EB68ACE59F02D@intel.com>
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
Cc: "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Peres,
 Martin" <martin.peres@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTA2LTI3IGF0IDEzOjI5ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUaHUsIEp1biAyNywgMjAxOSBhdCAxMDowMDoxNEFNICswMzAwLCBTdGFuaXNsYXYgTGlz
b3Zza2l5IHdyb3RlOg0KPiA+IFRoaXMgc2VyaWVzIGludHJvZHVjZSB0byBkcm0gYSB3YXkgdG8g
ZGV0ZXJtaW5lIGlmIHNvbWV0aGluZyBlbHNlDQo+ID4gZXhjZXB0IGNvbm5lY3Rpb25fc3RhdHVz
IGhhZCBjaGFuZ2VkIGR1cmluZyBwcm9iaW5nLCB3aGljaA0KPiA+IGNhbiBiZSB1c2VkIGJ5IG90
aGVyIGRyaXZlcnMgYXMgd2VsbC4gQW5vdGhlciBpOTE1IHNwZWNpZmljIHBhcnQNCj4gPiB1c2Vz
IHRoaXMgYXBwcm9hY2ggdG8gZGV0ZXJtaW5lIGlmIGVkaWQgaGFkIGNoYW5nZWQgd2l0aG91dA0K
PiA+IGNoYW5naW5nIHRoZSBjb25uZWN0aW9uIHN0YXR1cyBhbmQgc2VuZCBhIGhvdHBsdWcgZXZl
bnQuDQo+ID4gDQo+ID4gU3RhbmlzbGF2IExpc292c2tpeSAoMyk6DQo+ID4gICBkcm06IEFkZCBo
ZWxwZXIgdG8gY29tcGFyZSBlZGlkcy4NCj4gPiAgIGRybTogSW50cm9kdWNlIGNoYW5nZSBjb3Vu
dGVyIHRvIGRybV9jb25uZWN0b3INCj4gPiAgIGRybS9pOTE1OiBTZW5kIGhvdHBsdWcgZXZlbnQg
aWYgZWRpZCBoYWQgY2hhbmdlZC4NCj4gDQo+IFRoZXJlIHdhcyBhIGh1Z2UgZGlzY3Vzc2lvbiBh
IHdoaWxlIGJhY2sgb24gd2hhdCB0aGlzIGFsbCBzaG91bGQgbG9vaw0KPiBsaWtlLCB3aXRoIFBl
a2thIGFuZCBQYXVsIGFuZCBvdGhlcnMuIFRoaXMgaGVyZSBzZWVtcyB0byBmYWxsIHF1aXRlIGEN
Cj4gYml0DQo+IHNob3J0IG9uIHRoYXQuDQo+IA0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1NYXkvMjE3NTg4Lmh0bWwNCj4gDQo+IEFsc28g
cGxlYXNlIGNjIGFsbCB0aGUgcGVvcGxlIGludm9sdmVkIGluIHRoYXQgcHJldmlvdXMgZGlzY3Vz
c2lvbi4NCj4gDQo+IFdydCB0aGUgcGF0Y2hlczogRG9jdW1lbnRhdGlvbiBzZWVtcyB0byBiZSBh
d29sIGF0IGxlYXN0LCB0aGF0DQo+IGRlZmluaXRlbHkNCj4gbmVlZHMgdG8gYmUgZml4ZWQuIE1h
eWJlIGZpeCB0aGF0LCByZXNlbmQsIGFuZCB0aGVuIHVzZSB0aGF0IHRvIG1vdmUNCj4gdGhlDQo+
IG92ZXJhbGwgZGlzY3Vzc2lvbiBmb3J3YXJkIHdpdGggZXZlcnlvbmU/DQo+IC1EYW5pZWwNCg0K
WWVzLCBJIHJlYWQgc29tZSBwYXJ0IG9mIGl0LiBBbHNvIHVzZWQgeW91ciBpZGVhIGFib3V0IHRo
ZSBjb3VudGVyIGFzIGENCndheSB0byBwcm9wYWdhdGUgY29ubmVjdG9yIHVwZGF0ZXMsIHN1Y2gg
YXMgZWRpZCBjaGFuZ2UgYW5kIGV0YywgZnJvbQ0KaGVyZToNCg0KaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktQXByaWwvMjE0NTcyLmh0bWwNCg0K
QXMgY3VycmVudGx5IHdlIGFuYWx5emUgb25seSBjb25uZWN0aW9uIHN0YXR1cyBhbmQgbm90aGlu
ZyBlbHNlLg0KR3dhbmctR3llb25nIGlzIG5vdyBkb2luZyBzb21lIG90aGVyIHRhc2ssIHNvIGhp
cyBwYXRjaGVzIHdlcmUNCnRyYW5zZmVyZWQgdG8gbWUgLSBob3dldmVyIHNvbWUgY2hhbmdlcyBo
YWQgdG8gYmUgZG9uZSB0byBtYWtlIGl0DQp3b3JrKHVzZWQga21zX2NoYW1lbGl1bSBlZGlkX2No
YW5nZSB0ZXN0cyB0byBjaGVjaykuDQoNCkkgd2lsbCBpbmNsdWRlIGFsbCBwZW9wbGUgaW50byBk
aXNjdXNzaW9uIGFuZCBkb2N1bWVudGF0aW9uIHNlZW1zIHRvIGJlDQphIGdvb2QgaWRlYSBhcyB3
ZWxsLg0KDQo+IA0KPiA+IA0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAg
ICAgICAgICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgICAgICAg
ICAgICAgICAgICAgfCAyNg0KPiA+ICsrKysrKysrKysrKysrKysrKw0KPiA+ICBkcml2ZXJzL2dw
dS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jICAgICAgICAgICB8IDI5DQo+ID4gKysrKysrKysrKysr
KysrKysrLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAg
ICAgfCAxNiArKysrKysrKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2hkbWkuYyAgICB8IDE2ICsrKysrKysrKy0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfaG90cGx1Zy5jIHwgMjAgKysrKysrKysrKy0tLS0NCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPiA+ICBpbmNs
dWRlL2RybS9kcm1fZWRpZC5oICAgICAgICAgICAgICAgICAgICAgICB8ICAyICsrDQo+ID4gIDgg
ZmlsZXMgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+IA0K
PiA+IC0tIA0KPiA+IDIuMTcuMQ0KPiA+IA0KPiANCj4gDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
