Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232B291FA1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 11:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7B56E0EE;
	Mon, 19 Aug 2019 09:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F211B6E0EB;
 Mon, 19 Aug 2019 09:05:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Aug 2019 02:05:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,403,1559545200"; d="scan'208";a="172068077"
Received: from irsmsx151.ger.corp.intel.com ([163.33.192.59])
 by orsmga008.jf.intel.com with ESMTP; 19 Aug 2019 02:05:39 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.73]) by
 IRSMSX151.ger.corp.intel.com ([169.254.4.214]) with mapi id 14.03.0439.000;
 Mon, 19 Aug 2019 10:05:38 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "Peres, Martin"
 <martin.peres@intel.com>
Subject: Re: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Topic: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Index: AQHVTFZ9Xb5ovM3/BU6v/tV6RvEfjacCMIaA
Date: Mon, 19 Aug 2019 09:05:38 +0000
Message-ID: <ce9f67ad10a2b1f07ab79bc4ac328ef2bd9a2cf4.camel@intel.com>
References: <20190806125551.25761-1-stanislav.lisovskiy@intel.com>
 <20190806135150.GZ7444@phenom.ffwll.local>
 <8614f54fd742f9f35979768997e416d36b69563a.camel@intel.com>
 <CAKMK7uHgfviXTqkHsCVmZX97dWFfbysCHtiRVDpSzJ3aheTQkw@mail.gmail.com>
 <5e7dcb14e618796e9cb8a9503cec9d9985c5fd4d.camel@intel.com>
 <20190807210702.GG7444@phenom.ffwll.local>
 <cab2f3a9f9827a993069e402feecc9a9853560a1.camel@intel.com>
 <56A4AB1F0E1B5D4C83D27F43C50F662E590292A2@IRSMSX107.ger.corp.intel.com>
In-Reply-To: <56A4AB1F0E1B5D4C83D27F43C50F662E590292A2@IRSMSX107.ger.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.154]
Content-ID: <E9A545F74D63444183D3D25530152454@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA4LTE5IGF0IDA4OjM1ICswMTAwLCBQZXJlcywgTWFydGluIHdyb3RlOg0K
PiBPbiAxOS8wOC8yMDE5IDEwOjIzLCBMaXNvdnNraXksIFN0YW5pc2xhdiB3cm90ZToNCj4gPiBP
biBXZWQsIDIwMTktMDgtMDcgYXQgMjM6MDcgKzAyMDAsIERhbmllbCBWZXR0ZXIgd3JvdGU6DQo+
ID4gPiANCj4gPiA+IA0KPiA+ID4gU28gaWd0IGlzbid0IHZhbGlkIHVzZXJzcGFjZSAoaXQncyBq
dXN0IGdvb2QgdGVzdGNhc2VzKS4gQ2FuIHdlDQo+ID4gPiByZXBybw0KPiA+ID4gdGhlDQo+ID4g
PiBzYW1lIG9uIHJlYWwgdXNlcnNwYWNlPyBEb2VzIHRoaXMgd29yayB3aXRoIHJlYWwgdXNlcnNw
YWNlPyBXZSd2ZQ0KPiA+ID4gaGFkDQo+ID4gPiB1c2Vyc3BhY2Ugd2hpY2ggdHJpZXMgdG8gYmUg
Y2xldmVyIGFuZCBmaWx0ZXJzIG91dCB3aGF0IGxvb2tzDQo+ID4gPiBsaWtlDQo+ID4gPiByZWR1
bmRhbnQgaG90cGx1ZyBldmVudHMuIEFuZCB0aGVuIGdldHMgaXQgd3JvbmcgaW4gY2FzZXMgbGlr
ZQ0KPiA+ID4gdGhpcy4NCj4gPiA+IA0KPiA+ID4gQWxzbywgd2UndmUgaGFkIGZvcmV2ZXIgYW4g
dW5jb25kaXRpb25hbCB1ZXZlbnQgb24gcmVzdW1lLA0KPiA+ID4gZXhhY3RseQ0KPiA+ID4gYmVj
YXVzZQ0KPiA+ID4gYW55dGhpbmcgY291bGQgaGF2ZSBjaGFuZ2VkLiBEaWQgd2UgbG9vc2UgdGhp
cyBvbmUgb24gdGhlIHdheQ0KPiA+ID4gc29tZXdoZXJlPw0KPiA+ID4gT3IgbWF5YmUgSSBtaXNy
ZW1lbWJlciAuLi4NCj4gPiA+IA0KPiA+ID4gSWYgYWxsIHdlIGNhcmUgYWJvdXQgaXMgcmVzdW1l
IHJlLWFkZGluZyB0aGF0IHVuY29uZHRpb25hbCB1ZXZlbnQNCj4gPiA+IG9uDQo+ID4gPiByZXN1
bWUgaXMgZ29pbmcgdG8gYmUgYSBsb3QgZWFzaWVyIHRoYW4gdGhpcyBoZXJlLg0KPiA+ID4gLURh
bmllbA0KPiA+IA0KPiA+IFNvcnJ5IGZvciBsb25nIHJlcGx5KHdhcyBvbiB2YWNhdGlvbiksIHRo
YXQgaXMgYSBnb29kIHF1ZXN0aW9uDQo+ID4gcmVnYXJkaW5nIHJlcHJvZHVjaW5nIHRoaXMgaW4g
cmVhbCBsaWZlIHNjZW5hcmlvLiBNeSBvYnZpb3VzIGd1ZXNzDQo+ID4gd2FzIHRvIHN1c3BlbmQg
dGhlIG1hY2hpbmUgYW5kIG1lYW53aGlsZSBjaGFuZ2UgY29ubmVjdGVkIGRpc3BsYXkNCj4gPiB0
bw0KPiA+IGFub3RoZXIgb25lLiBIb3dldmVyIHRoaXMgc2l0dWF0aW9uIHNlZW1zIHRvIGJlIGFs
cmVhZHkgaGFuZGxlZCBieQ0KPiA+IGtlcm5lbCBuaWNlbHkodHJpZWQgZmV3IHRpbWVzIGFuZCB3
ZSBhbHdheXMgZ2V0IGEgaG90cGx1ZyBldmVudCkuDQo+ID4gU28NCj4gPiB0aGF0IGVkaWQgY2hh
bmdlIGR1cmluZyBzdXNwZW5kIGNoYW1lbGl1bSB0ZXN0IGNhc2Ugc2VlbXMgdG8gYmUNCj4gPiBh
IGJpdCBkaWZmZXJlbnQuIEkgd2lsbCB0YWxrIHRvIG91ciBndXlzIHdobyB3cm90ZSB0aGlzIGFi
b3V0IHdoYXQNCj4gPiBpcw0KPiA+IHRoZSByZWFsIGxpZmUgc2NlbmFyaW8gZm9yIHRoaXMsIGJl
Y2F1c2UgSSdtIG5vdyBjdXJpb3VzIGFzIHdlbGwuDQo+IA0KPiBUaGFua3MgRGFuaWVsIGZvciB0
aGUgZmVlZGJhY2suDQo+IA0KPiBJIGFsc28gbm93IHdvbmRlciB3aHkgb3VyIElHVCB0ZXN0IChj
aGFtZWxpdW0tYmFzZWQpIGRvZXMgbm90IHBhc3MgaWYNCj4gYQ0KPiB1ZXZlbnQgaXMgc2VudCBv
biByZXN1bWUgYXV0b21hdGljYWxseSBhbmQgYWxsIHRoZSB0ZXN0IGlzIGV4cGVjdGluZw0KPiBp
cw0KPiBhIHVldmVudC4uLg0KPiANCj4gTWFydGluDQoNCkluIGZhY3QgSSB3YXMgd3JvbmcgLSB3
aGVuIGl0IHdvcmtlZCwgaXQgd2FzIHVzaW5nIGV4YWN0bHkgdGhvc2UNCnBhdGNoZXMgOikuIFdp
dGggY2xlYW4gZHJtLXRpcCAtIGl0IHNlZW1zIHRvIHdvcmsgb2Nhc3Npb25hbGx5IGFuZCBpdA0K
ZG9lc24ndCB1cGRhdGUgdGhlIGFjdHVhbCBkaXNwbGF5IGVkaWQgYW5kIG90aGVyIHN0dWZmLCBz
byBldmVuIHdoZW4NCmRpc3BsYXlzIGFyZSBjaGFuZ2VkIHdlIHN0aWxsIHNlZSB0aGUgb2xkIGlu
Zm8vZWRpZCBmcm9tIHVzZXJzcGFjZS4NCg0KV2UgYWx3YXlzIGdldCBhIGhwZCBpcnEgd2hlbiBz
dXNwZW5kL3Jlc3VtZSBob3dldmVyIGl0IGRvZXNuJ3QgYWx3YXlzDQpyZXN1bHQgaW4gdWV2ZW50
IGJlaW5nIHNlbnQuIFNvIHRoZXJlIGlzIGEgcmVhbCBuZWVkIGluIHRob3NlIHBhdGNoZXMuDQoN
Cj4gDQo+ID4gDQo+ID4gLSBTdGFuaXNsYXYNCj4gPiANCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+
IA0KPiA+ID4gPiAtU3RhbmlzbGF2DQo+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IENo
ZWVycywgRGFuaWVsDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gLVN0YW5pc2xhdg0KPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gLURhbmllbA0KPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4g
PiA+ID4gPiBTdGFuaXNsYXYgTGlzb3Zza2l5ICgzKToNCj4gPiA+ID4gPiA+ID4gPiAgIGRybTog
QWRkIGhlbHBlciB0byBjb21wYXJlIGVkaWRzLg0KPiA+ID4gPiA+ID4gPiA+ICAgZHJtOiBJbnRy
b2R1Y2UgY2hhbmdlIGNvdW50ZXIgdG8gZHJtX2Nvbm5lY3Rvcg0KPiA+ID4gPiA+ID4gPiA+ICAg
ZHJtL2k5MTU6IFNlbmQgaG90cGx1ZyBldmVudCBpZiBlZGlkIGhhZCBjaGFuZ2VkLg0KPiA+ID4g
PiA+ID4gPiA+IA0KPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rv
ci5jICAgICAgICAgICAgICB8ICAxICsNCj4gPiA+ID4gPiA+ID4gPiAgZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMgICAgICAgICAgICAgICAgICAgfCAzMw0KPiA+ID4gPiA+ID4gPiA+ICsrKysr
KysrKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJv
YmVfaGVscGVyLmMgICAgICAgICAgIHwgMjkNCj4gPiA+ID4gPiA+ID4gPiArKysrKysrKysrKysr
KystDQo+ID4gPiA+ID4gPiA+ID4gLQ0KPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgICAgICB8IDE2DQo+ID4gPiA+ID4gPiA+ID4gKysrKysr
KysrLQ0KPiA+ID4gPiA+ID4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2hkbWkuYyAgICB8IDE2DQo+ID4gPiA+ID4gPiA+ID4gKysrKysrKystLQ0KPiA+ID4gPiA+ID4g
PiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hvdHBsdWcuYyB8IDIxDQo+
ID4gPiA+ID4gPiA+ID4gKysrKysrKysrKw0KPiA+ID4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+
ID4gPiA+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAgICAgICB8ICAz
ICsrDQo+ID4gPiA+ID4gPiA+ID4gIGluY2x1ZGUvZHJtL2RybV9lZGlkLmggICAgICAgICAgICAg
ICAgICAgICAgIHwgIDkNCj4gPiA+ID4gPiA+ID4gPiArKysrKysNCj4gPiA+ID4gPiA+ID4gPiAg
OCBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pDQo+ID4g
PiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+ID4gLS0NCj4gPiA+ID4gPiA+ID4gPiAyLjE3LjEN
Cj4gPiA+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+ID4gDQo+ID4gPiA+ID4gPiA+IA0KPiA+ID4g
PiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiANCj4gDQo+IA0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
