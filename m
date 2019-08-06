Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F28D983389
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 16:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BAA6E39C;
	Tue,  6 Aug 2019 14:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFA36E39C;
 Tue,  6 Aug 2019 14:06:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 07:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="192672027"
Received: from irsmsx109.ger.corp.intel.com ([163.33.3.23])
 by fmsmga001.fm.intel.com with ESMTP; 06 Aug 2019 07:06:29 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.164]) by
 IRSMSX109.ger.corp.intel.com ([169.254.13.29]) with mapi id 14.03.0439.000;
 Tue, 6 Aug 2019 15:06:29 +0100
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Topic: [PATCH v3 0/3] Send a hotplug when edid changes
Thread-Index: AQHVTFZ9Xb5ovM3/BU6v/tV6RvEfjabuEsGAgAADxIA=
Date: Tue, 6 Aug 2019 14:06:28 +0000
Message-ID: <8614f54fd742f9f35979768997e416d36b69563a.camel@intel.com>
References: <20190806125551.25761-1-stanislav.lisovskiy@intel.com>
 <20190806135150.GZ7444@phenom.ffwll.local>
In-Reply-To: <20190806135150.GZ7444@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.154]
Content-ID: <7FB79D33D3B3C84F95E5B368DBD3657C@intel.com>
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

T24gVHVlLCAyMDE5LTA4LTA2IGF0IDE1OjUxICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
PiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwMzo1NTo0OFBNICswMzAwLCBTdGFuaXNsYXYgTGlz
b3Zza2l5IHdyb3RlOg0KPiA+IFRoaXMgc2VyaWVzIGludHJvZHVjZSB0byBkcm0gYSB3YXkgdG8g
ZGV0ZXJtaW5lIGlmIHNvbWV0aGluZyBlbHNlDQo+ID4gZXhjZXB0IGNvbm5lY3Rpb25fc3RhdHVz
IGhhZCBjaGFuZ2VkIGR1cmluZyBwcm9iaW5nLCB3aGljaA0KPiA+IGNhbiBiZSB1c2VkIGJ5IG90
aGVyIGRyaXZlcnMgYXMgd2VsbC4gQW5vdGhlciBpOTE1IHNwZWNpZmljIHBhcnQNCj4gPiB1c2Vz
IHRoaXMgYXBwcm9hY2ggdG8gZGV0ZXJtaW5lIGlmIGVkaWQgaGFkIGNoYW5nZWQgd2l0aG91dA0K
PiA+IGNoYW5naW5nIHRoZSBjb25uZWN0aW9uIHN0YXR1cyBhbmQgc2VuZCBhIGhvdHBsdWcgZXZl
bnQuDQo+IA0KPiBEaWQgeW91IHJlYWQgdGhyb3VnaCB0aGUgZW50aXJlIGh1Z2UgdGhyZWFkIG9u
IGFsbCB0aGlzICh3aXRoIEkgdGhpbmsNCj4gUGF1bCwgUGVra2EsIFJhbSBhbmQgc29tZSBvdGhl
cnMpPyBJIGZlZWwgbGlrZSB0aGlzIGlzIG1vc3RseSB0YWtpbmcNCj4gdGhhdA0KPiBpZGVhLCBi
dXQgbm90IHRha2luZyBhIGxvdCBvZiB0aGUgZGV0YWlscyB3ZSd2ZSBkaXNjdXNzZWQgdGhlcmUu
DQo+IFNwZWNpZmljYWxseSBJJ20gbm90IHN1cmUgaG93IHVzZXJzcGFjZSBzaG91bGQgaGFuZGxl
IHRoaXMgd2l0aG91dA0KPiBhbHNvDQo+IGV4cG9zaW5nIHRoZSBlcG9jaCBjb3VudGVyLCBvciBh
dCBsZWFzdCBnZW5lcmF0aW5nIGEgaG90cGx1ZyBldmVudA0KPiBmb3IgdGhlDQo+IHNwZWNpZmlj
IGNvbm5lY3Rvci4gQWxsIHRoYXQgYW5kIG1vcmUgd2UgZGlzY3Vzc2VkIHRoZXJlLg0KPiANCj4g
QW5kIHRoZW4gdGhlcmUncyB0aGUgZm9sbG93LXVwIHF1ZXN0aW9uOiBXaGF0J3MgdGhlIHVzZXJz
cGFjZSBmb3INCj4gdGhpcz8NCj4gRXhpc3RpbmcgZXhwZWN0YXRpb25zIGFyZSBhIG1pbmVmaWVs
ZCBoZXJlLCBzbyBldmVuIGlmIHlvdSBkb24ndCBwbGFuDQo+IHRvDQo+IGNoYW5nZSB1c2Vyc3Bh
Y2Ugd2UgbmVlZCB0byBrbm93IHdoYXQgdGhpcyBpcyBhaW1lZCBmb3IsIGFuZCBzZWUNCj4gYWJv
dmUgSQ0KPiBkb24ndCB0aGluayB0aGlzIGlzIHBvc3NpYmxlIHRvIHVzZSB3aXRob3V0IHVzZXJz
cGFjZSBjaGFuZ2VzIC4uLg0KDQpZZXMsIHN1cmUgSSBhZ3JlZSBhYm91dCB1c2Vyc3BhY2UuIEhv
d2V2ZXIgSSBndWVzcyB3ZSBtdXN0IHN0YXJ0IGZyb20NCnNvbWV0aGluZyBhdCBsZWFzdC4NCkkg
dGhpbmsgSSBoYXZlIHNlZW4gc29tZSBkaXNjdXNzaW9uIHJlZ2FyZGluZyBleHBvc2luZyB0aGlz
IGVwb2NoDQpjb3VudGVyIGFzIGEgcHJvcGVydHkuIFdhcyBldmVuIGltcGxlbWVudGluZyB0aGlz
IGF0IHNvbWUgcG9pbnQgYnV0DQpkaWRuJ3QgZGFyZSB0byBzZW5kIHRvIG1haWxpbmcgbGlzdCA6
KQ0KDQpNeSBpZGVhIHdhcyBqdXN0IHRvIGV4cG9zZSB0aGlzIGVwb2NoIGNvdW50ZXIgYXMgYSBk
cm0gcHJvcGVydHksIHRvIGxldA0KdXNlcnNwYWNlIHRoZW4gdG8gZmlndXJlIG91dCwgd2hhdCBo
YXMgaGFwcGVuZWQsIGFzIGltaG8gYWRkaW5nDQpkaWZmZXJlbnQgZXZlbnRzIGZvciB0aGlzIGFu
ZCB0aGF0IGlzIGEgYml0IG9mIGFuIG92ZXJraWxsIGFuZCBicmluZ3MNCmFkZGl0aW9uYWwgY29t
cGxleGl0eS4uDQoNCkhvd2V2ZXIsIHBsZWFzZSBsZXQgbWUga25vdywgd2hhdCBkbyB5b3UgdGhp
bmsgd2Ugc2hvdWxkIGRvIGZvcg0KdXNlcnNwYWNlLg0KDQoNCi1TdGFuaXNsYXYNCg0KDQo+IC1E
YW5pZWwNCj4gDQo+ID4gDQo+ID4gU3RhbmlzbGF2IExpc292c2tpeSAoMyk6DQo+ID4gICBkcm06
IEFkZCBoZWxwZXIgdG8gY29tcGFyZSBlZGlkcy4NCj4gPiAgIGRybTogSW50cm9kdWNlIGNoYW5n
ZSBjb3VudGVyIHRvIGRybV9jb25uZWN0b3INCj4gPiAgIGRybS9pOTE1OiBTZW5kIGhvdHBsdWcg
ZXZlbnQgaWYgZWRpZCBoYWQgY2hhbmdlZC4NCj4gPiANCj4gPiAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb25uZWN0b3IuYyAgICAgICAgICAgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jICAgICAgICAgICAgICAgICAgIHwgMzMNCj4gPiArKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jICAgICAgICAgICB8IDI5
ICsrKysrKysrKysrKysrKy0NCj4gPiAtDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYyAgICAgIHwgMTYgKysrKysrKysrLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyAgICB8IDE2ICsrKysrKysrLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9ob3RwbHVnLmMgfCAyMSArKysrKysrKysrLS0t
DQo+ID4gIGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgICAgICAgICAgICAgIHwgIDMg
KysNCj4gPiAgaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCAgICAgICAgICAgICAgICAgICAgICAgfCAg
OSArKysrKysNCj4gPiAgOCBmaWxlcyBjaGFuZ2VkLCAxMTcgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pDQo+ID4gDQo+ID4gLS0gDQo+ID4gMi4xNy4xDQo+ID4gDQo+IA0KPiANCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
