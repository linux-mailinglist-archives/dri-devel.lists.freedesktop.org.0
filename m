Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B81D68461F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:43:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF6B6E660;
	Wed,  7 Aug 2019 07:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C33C06E660;
 Wed,  7 Aug 2019 07:43:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 00:43:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,356,1559545200"; d="scan'208";a="179401579"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
 by orsmga006.jf.intel.com with ESMTP; 07 Aug 2019 00:43:19 -0700
Received: from irsmsx112.ger.corp.intel.com (10.108.20.5) by
 IRSMSX101.ger.corp.intel.com (163.33.3.153) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 7 Aug 2019 08:43:19 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.164]) by
 irsmsx112.ger.corp.intel.com ([169.254.1.38]) with mapi id 14.03.0439.000;
 Wed, 7 Aug 2019 08:43:19 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Topic: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Index: AQHVTFZ9Xb5ovM3/BU6v/tV6RvEfjabuEsGAgAADxICAAD0NAIAA6jmA
Date: Wed, 7 Aug 2019 07:43:18 +0000
Message-ID: <5e7dcb14e618796e9cb8a9503cec9d9985c5fd4d.camel@intel.com>
References: <20190806125551.25761-1-stanislav.lisovskiy@intel.com>
 <20190806135150.GZ7444@phenom.ffwll.local>
 <8614f54fd742f9f35979768997e416d36b69563a.camel@intel.com>
 <CAKMK7uHgfviXTqkHsCVmZX97dWFfbysCHtiRVDpSzJ3aheTQkw@mail.gmail.com>
In-Reply-To: <CAKMK7uHgfviXTqkHsCVmZX97dWFfbysCHtiRVDpSzJ3aheTQkw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.154]
Content-ID: <B03D33DC0D25314A82F46150DD37E7A4@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Peres,
 Martin" <martin.peres@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Saarinen,
 Jani" <jani.saarinen@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDE5LTA4LTA2IGF0IDE5OjQzICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUdWUsIEF1ZyA2LCAyMDE5IGF0IDQ6MDYgUE0gTGlzb3Zza2l5LCBTdGFuaXNsYXYNCj4g
PHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29tPiB3cm90ZToNCj4gPiANCj4gPiBPbiBUdWUs
IDIwMTktMDgtMDYgYXQgMTU6NTEgKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+ID4gPiBP
biBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMzo1NTo0OFBNICswMzAwLCBTdGFuaXNsYXYgTGlzb3Zz
a2l5DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4gVGhpcyBzZXJpZXMgaW50cm9kdWNlIHRvIGRybSBh
IHdheSB0byBkZXRlcm1pbmUgaWYgc29tZXRoaW5nDQo+ID4gPiA+IGVsc2UNCj4gPiA+ID4gZXhj
ZXB0IGNvbm5lY3Rpb25fc3RhdHVzIGhhZCBjaGFuZ2VkIGR1cmluZyBwcm9iaW5nLCB3aGljaA0K
PiA+ID4gPiBjYW4gYmUgdXNlZCBieSBvdGhlciBkcml2ZXJzIGFzIHdlbGwuIEFub3RoZXIgaTkx
NSBzcGVjaWZpYw0KPiA+ID4gPiBwYXJ0DQo+ID4gPiA+IHVzZXMgdGhpcyBhcHByb2FjaCB0byBk
ZXRlcm1pbmUgaWYgZWRpZCBoYWQgY2hhbmdlZCB3aXRob3V0DQo+ID4gPiA+IGNoYW5naW5nIHRo
ZSBjb25uZWN0aW9uIHN0YXR1cyBhbmQgc2VuZCBhIGhvdHBsdWcgZXZlbnQuDQo+ID4gPiANCj4g
PiA+IERpZCB5b3UgcmVhZCB0aHJvdWdoIHRoZSBlbnRpcmUgaHVnZSB0aHJlYWQgb24gYWxsIHRo
aXMgKHdpdGggSQ0KPiA+ID4gdGhpbmsNCj4gPiA+IFBhdWwsIFBla2thLCBSYW0gYW5kIHNvbWUg
b3RoZXJzKT8gSSBmZWVsIGxpa2UgdGhpcyBpcyBtb3N0bHkNCj4gPiA+IHRha2luZw0KPiA+ID4g
dGhhdA0KPiA+ID4gaWRlYSwgYnV0IG5vdCB0YWtpbmcgYSBsb3Qgb2YgdGhlIGRldGFpbHMgd2Un
dmUgZGlzY3Vzc2VkIHRoZXJlLg0KPiA+ID4gU3BlY2lmaWNhbGx5IEknbSBub3Qgc3VyZSBob3cg
dXNlcnNwYWNlIHNob3VsZCBoYW5kbGUgdGhpcw0KPiA+ID4gd2l0aG91dA0KPiA+ID4gYWxzbw0K
PiA+ID4gZXhwb3NpbmcgdGhlIGVwb2NoIGNvdW50ZXIsIG9yIGF0IGxlYXN0IGdlbmVyYXRpbmcg
YSBob3RwbHVnDQo+ID4gPiBldmVudA0KPiA+ID4gZm9yIHRoZQ0KPiA+ID4gc3BlY2lmaWMgY29u
bmVjdG9yLiBBbGwgdGhhdCBhbmQgbW9yZSB3ZSBkaXNjdXNzZWQgdGhlcmUuDQo+ID4gPiANCj4g
PiA+IEFuZCB0aGVuIHRoZXJlJ3MgdGhlIGZvbGxvdy11cCBxdWVzdGlvbjogV2hhdCdzIHRoZSB1
c2Vyc3BhY2UgZm9yDQo+ID4gPiB0aGlzPw0KPiA+ID4gRXhpc3RpbmcgZXhwZWN0YXRpb25zIGFy
ZSBhIG1pbmVmaWVsZCBoZXJlLCBzbyBldmVuIGlmIHlvdSBkb24ndA0KPiA+ID4gcGxhbg0KPiA+
ID4gdG8NCj4gPiA+IGNoYW5nZSB1c2Vyc3BhY2Ugd2UgbmVlZCB0byBrbm93IHdoYXQgdGhpcyBp
cyBhaW1lZCBmb3IsIGFuZCBzZWUNCj4gPiA+IGFib3ZlIEkNCj4gPiA+IGRvbid0IHRoaW5rIHRo
aXMgaXMgcG9zc2libGUgdG8gdXNlIHdpdGhvdXQgdXNlcnNwYWNlIGNoYW5nZXMgLi4uDQo+ID4g
DQo+ID4gWWVzLCBzdXJlIEkgYWdyZWUgYWJvdXQgdXNlcnNwYWNlLiBIb3dldmVyIEkgZ3Vlc3Mg
d2UgbXVzdCBzdGFydA0KPiA+IGZyb20NCj4gPiBzb21ldGhpbmcgYXQgbGVhc3QuDQo+ID4gSSB0
aGluayBJIGhhdmUgc2VlbiBzb21lIGRpc2N1c3Npb24gcmVnYXJkaW5nIGV4cG9zaW5nIHRoaXMg
ZXBvY2gNCj4gPiBjb3VudGVyIGFzIGEgcHJvcGVydHkuIFdhcyBldmVuIGltcGxlbWVudGluZyB0
aGlzIGF0IHNvbWUgcG9pbnQgYnV0DQo+ID4gZGlkbid0IGRhcmUgdG8gc2VuZCB0byBtYWlsaW5n
IGxpc3QgOikNCj4gPiANCj4gPiBNeSBpZGVhIHdhcyBqdXN0IHRvIGV4cG9zZSB0aGlzIGVwb2No
IGNvdW50ZXIgYXMgYSBkcm0gcHJvcGVydHksIHRvDQo+ID4gbGV0DQo+ID4gdXNlcnNwYWNlIHRo
ZW4gdG8gZmlndXJlIG91dCwgd2hhdCBoYXMgaGFwcGVuZWQsIGFzIGltaG8gYWRkaW5nDQo+ID4g
ZGlmZmVyZW50IGV2ZW50cyBmb3IgdGhpcyBhbmQgdGhhdCBpcyBhIGJpdCBvZiBhbiBvdmVya2ls
bCBhbmQNCj4gPiBicmluZ3MNCj4gPiBhZGRpdGlvbmFsIGNvbXBsZXhpdHkuLg0KPiANCj4gQWRk
aW5nIFJhbSBhbmQgbGluayB0byB0aGUgKHdhcm5pbmcsIGh1Z2UhKSB0aHJlYWQ6DQo+IA0KPiBo
dHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvMzAzOTA1Lz9zZXJpZXM9NTcy
MzImcmV2PTkNCj4gDQo+ID4gSG93ZXZlciwgcGxlYXNlIGxldCBtZSBrbm93LCB3aGF0IGRvIHlv
dSB0aGluayB3ZSBzaG91bGQgZG8gZm9yDQo+ID4gdXNlcnNwYWNlLg0KPiANCj4gVGhhdCBzZWVt
cyBiYWNrd2FyZHMsIHNpbmNlIHRoaXMgaXMgYW4gdWFwaSBjaGFuZ2UgSSdkIGV4cGVjdCB5b3Un
cmUNCj4gc29sdmluZyBzb21lIHNwZWNpZmljIGlzc3VlIGluIHNvbWUgc3BlY2lmaWMgdXNlcnNw
YWNlPyBJZiB3ZSdyZQ0KPiBkb2luZw0KPiB0aGlzIGp1c3QgYmVjYXVzZSBJJ20gbm90IHJlYWxs
eSBmb2xsb3dpbmcuDQoNClNwZWNpZmljYWxseSwgSSdtIHNvbHZpbmcgYW4gaXNzdWUgb2YgY2hh
bmdlZCBlZGlkIGR1cmluZyBzdXNwZW5kLCBsaWtlDQp3ZSBmb3IgZXhhbXBsZSBoYXZlIGluIGtt
c19jaGFtZWxpdW0gaG90cGx1ZyB0ZXN0cyhzb21lIG9mIHdoaWNoIG5vdw0KZmFpbCBiZWNhdXNl
IG9mIHRoYXQpLiANClNvIGV2ZW4gaWYgY29ubmVjdGlvbiBzdGF0dXMgaGFzbid0IGNoYW5nZWQs
IHdlIHN0aWxsIG5lZWQgdG8gc2VuZA0KaG90cGx1ZyBldmVudCBhbmQgdXNlcnNwYWNlIG5lZWRz
IHRvIGJlIGFibGUgdG8gdW5kZXJzdGFuZCB0aGF0DQpzb21ldGhpbmcgaGFkIGNoYW5nZWQgYW5k
IHdoZXRoZXIgd2UgbmVlZCB0byBkbyBhIGZ1bGwgcmVwcm9iZSBvciBub3QuDQpFcG9jaCBjb3Vu
dGVyIHByb3BlcnR5IHdvdWxkIGJlIHJlc3BvbnNpYmxlIGZvciB0aGlzLg0KQXMgSSB1bmRlcnN0
YW5kIGluIGdlbmVyYWwgdGhlcmUgbWlnaHQgYmUgb3RoZXIgY29ubmVjdG9yIHVwZGF0ZXMsDQpl
eGNlcHQgZWRpZCB3aGljaCB3ZSBuZWVkIHByb3BhZ2F0ZSBpbiBhIHNpbWlsYXIgd2F5Lg0KDQot
U3RhbmlzbGF2DQoNCj4gDQo+IENoZWVycywgRGFuaWVsDQo+IA0KPiA+IA0KPiA+IA0KPiA+IC1T
dGFuaXNsYXYNCj4gPiANCj4gPiANCj4gPiA+IC1EYW5pZWwNCj4gPiA+IA0KPiA+ID4gPiANCj4g
PiA+ID4gU3RhbmlzbGF2IExpc292c2tpeSAoMyk6DQo+ID4gPiA+ICAgZHJtOiBBZGQgaGVscGVy
IHRvIGNvbXBhcmUgZWRpZHMuDQo+ID4gPiA+ICAgZHJtOiBJbnRyb2R1Y2UgY2hhbmdlIGNvdW50
ZXIgdG8gZHJtX2Nvbm5lY3Rvcg0KPiA+ID4gPiAgIGRybS9pOTE1OiBTZW5kIGhvdHBsdWcgZXZl
bnQgaWYgZWRpZCBoYWQgY2hhbmdlZC4NCj4gPiA+ID4gDQo+ID4gPiA+ICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAgICB8ICAxICsNCj4gPiA+ID4gIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZWRpZC5jICAgICAgICAgICAgICAgICAgIHwgMzMNCj4gPiA+ID4gKysrKysr
KysrKysrKysrKysrKysNCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVy
LmMgICAgICAgICAgIHwgMjkNCj4gPiA+ID4gKysrKysrKysrKysrKysrLQ0KPiA+ID4gPiAtDQo+
ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICB8IDE2
ICsrKysrKysrKy0NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
aGRtaS5jICAgIHwgMTYgKysrKysrKystLQ0KPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJtL2k5MTUv
ZGlzcGxheS9pbnRlbF9ob3RwbHVnLmMgfCAyMSArKysrKysrKysrDQo+ID4gPiA+IC0tLQ0KPiA+
ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oICAgICAgICAgICAgICAgICAgfCAgMyAr
Kw0KPiA+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgICAgICAg
fCAgOSArKysrKysNCj4gPiA+ID4gIDggZmlsZXMgY2hhbmdlZCwgMTE3IGluc2VydGlvbnMoKyks
IDExIGRlbGV0aW9ucygtKQ0KPiA+ID4gPiANCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi4xNy4xDQo+
ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gDQo+IA0KPiANCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
