Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD722D47A2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 18:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F17F6EAD4;
	Wed,  9 Dec 2020 17:14:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D63C6EAD4;
 Wed,  9 Dec 2020 17:14:32 +0000 (UTC)
IronPort-SDR: mUgatlfj461346wTr6Hb8y+g7hSS37wtD7t3ESZR4oiVY7lwKWcAZrQSWeSrFGq3e0Y55puEZv
 EiKzZ0sS2Iag==
X-IronPort-AV: E=McAfee;i="6000,8403,9829"; a="170603603"
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="170603603"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 09:14:31 -0800
IronPort-SDR: Et27NJoSyRMxoPg+5kcsO4HxULz/KI+/QrValbnsNzhuw7RaSd97UAWfeurITSLRWeDnXOLxI7
 rEL8D20o4hWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,405,1599548400"; d="scan'208";a="338065656"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga006.jf.intel.com with ESMTP; 09 Dec 2020 09:14:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Dec 2020 09:14:30 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 9 Dec 2020 09:14:30 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Wed, 9 Dec 2020 09:14:30 -0800
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [PULL] drm-intel-fixes v2
Thread-Topic: [PULL] drm-intel-fixes v2
Thread-Index: AQHWyXrKuWTZ8nCu1EG+XoqBuFqLQKnvPA8AgABUmYA=
Date: Wed, 9 Dec 2020 17:14:30 +0000
Message-ID: <3322c8be1565a7dc9196ccbfc204a703d28c311d.camel@intel.com>
References: <20201203134705.GA1575873@intel.com>	 <X9C+/nvvyls/vj1b@intel.com>
In-Reply-To: <X9C+/nvvyls/vj1b@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.38.1 (3.38.1-1.fc33) 
x-originating-ip: [10.22.254.132]
Content-ID: <D013D3B6BD97FF4A9AD5904C063DD21E@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "sean@poorly.run" <sean@poorly.run>,
 "dim-tools@lists.freedesktop.org" <dim-tools@lists.freedesktop.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTEyLTA5IGF0IDE0OjExICswMjAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIFRodSwgRGVjIDAzLCAyMDIwIGF0IDA1OjQ3OjA1QU0gLTA4MDAsIFJvZHJpZ28gVml2
aSB3cm90ZToNCj4gPiBIaSBEYXZlIGFuZCBEYW5pZWwsDQo+ID4gDQo+ID4gUGxlYXNlIGlnbm9y
ZSB0aGUgcHVsbCByZXF1ZXN0IEkgaGFkIHNlbnQgeWVzdGVyZGF5IGFuZCB1c2Ugb25seQ0KPiA+
IHRoaXMgb25lLg0KPiA+IA0KPiA+IEkgaGFkIG1pc3NlZCBvbmUgcGF0Y2g6IDE0ZDFlYWYwODg0
NSAoImRybS9pOTE1L2d0OiBQcm90ZWN0IGNvbnRleHQNCj4gPiBsaWZldGltZSB3aXRoIFJDVSIp
Lg0KPiA+IA0KPiA+IEFsc28sIHBsZWFzZSBub3RpY2UgdGhhdCB0aGUgY29tbWl0IDZkYjU4OTAx
YzJhYQ0KPiA+ICgiZHJtL2k5MTUvZGlzcGxheTogcmV0dXJuIGVhcmxpZXIgZnJvbQ0KPiA+ICtp
bnRlbF9tb2Rlc2V0X2luaXQoKSB3aXRob3V0IGRpc3BsYXkiKSB3YXMgbm90IGFjdHVhbGx5IGEg
Y3J1Y2lhbA0KPiA+IGZpeCwgYnV0IGl0DQo+ID4gK2FsbG93ZWQgYSBjbGVhbiBwaWNrIG9mIHRo
ZSB1c2UtYWZ0ZXItZnJlZSBvbmUuDQo+ID4gDQo+ID4gSGVyZSBnb2VzIGRybS1pbnRlbC1maXhl
cy0yMDIwLTEyLTAzOg0KPiA+IEZpeGVzIGZvciBHUFUgaGFuZywgbnVsbCBkZXJlZmVyZW5jZSwg
c3VzcGVuZC1yZXN1bWUsIHBvd2VyDQo+ID4gY29uc3VtcHRpb24sIGFuZCB1c2UtYWZ0ZXItZnJl
ZS4NCj4gPiANCj4gPiAtIFByb2dyYW0gbW9jczo2MyBmb3IgY2FjaGUgZXZpY3Rpb24gb24gZ2Vu
OSAoQ2hyaXMpDQo+ID4gLSBQcm90ZWN0IGNvbnRleHQgbGlmZXRpbWUgd2l0aCBSQ1UgKENocmlz
KQ0KPiA+IC0gU3BsaXQgdGhlIGJyZWFkY3J1bWIgc3BpbmxvY2sgYmV0d2VlbiBnbG9iYWwgYW5k
IGNvbnRleHRzIChDaHJpcykNCj4gPiAtIFJldGFpbiBkZWZhdWx0IGNvbnRleHQgc3RhdGUgYWNy
b3NzIHNocmlua2luZyAoVmVua2F0YSkNCj4gPiAtIExpbWl0IGZyZXF1ZW5jeSBkcm9wIHRvIFJQ
ZSBvbiBwYXJraW5nIChDaHJpcykNCj4gPiAtIFJldHVybiBlYXJsaWVyIGZyb20gaW50ZWxfbW9k
ZXNldF9pbml0KCkgd2l0aG91dCBkaXNwbGF5IChKYW5pKQ0KPiA+IC0gRGVmZXIgaW5pdGlhbCBt
b2Rlc2V0IHVudGlsIGFmdGVyIEdHVFQgaXMgaW5pdGlhbGl6ZWQgKENocmlzKQ0KPiA+IA0KPiA+
IFRoYW5rcywNCj4gPiBSb2RyaWdvLg0KPiA+IA0KPiA+IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBz
aW5jZSBjb21taXQNCj4gPiBiNjUwNTQ1OTc4NzJjZTNhZWZiYzZhNjY2Mzg1ZWFiZGY5ZTI4OGRh
Og0KPiA+IA0KPiA+IMKgIExpbnV4IDUuMTAtcmM2ICgyMDIwLTExLTI5IDE1OjUwOjUwIC0wODAw
KQ0KPiA+IA0KPiA+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KPiA+
IA0KPiA+IMKgIGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2RybS9kcm0taW50ZWwgdGFn
cy9kcm0taW50ZWwtZml4ZXMtDQo+ID4gMjAyMC0xMi0wMw0KPiA+IA0KPiA+IGZvciB5b3UgdG8g
ZmV0Y2ggY2hhbmdlcyB1cCB0bw0KPiA+IGNjYzllNjdhYjI2ZmVkYTdlNjI3NDliYjU0YzA1ZDdh
YmUwN2RjYTk6DQo+ID4gDQo+ID4gwqAgZHJtL2k5MTUvZGlzcGxheTogRGVmZXIgaW5pdGlhbCBt
b2Rlc2V0IHVudGlsIGFmdGVyIEdHVFQgaXMNCj4gPiBpbml0aWFsaXNlZCAoMjAyMC0xMi0wMiAx
NzowNTo1OCAtMDgwMCkNCj4gPiANCj4gPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gRml4ZXMgZm9yIEdQVSBoYW5n
LCBudWxsIGRlcmVmZXJlbmNlLCBzdXNwZW5kLXJlc3VtZSwgcG93ZXINCj4gPiBjb25zdW1wdGlv
biwgYW5kIHVzZS1hZnRlci1mcmVlLg0KPiA+IA0KPiA+IC0gUHJvZ3JhbSBtb2NzOjYzIGZvciBj
YWNoZSBldmljdGlvbiBvbiBnZW45IChDaHJpcykNCj4gPiAtIFByb3RlY3QgY29udGV4dCBsaWZl
dGltZSB3aXRoIFJDVSAoQ2hyaXMpDQo+ID4gLSBTcGxpdCB0aGUgYnJlYWRjcnVtYiBzcGlubG9j
ayBiZXR3ZWVuIGdsb2JhbCBhbmQgY29udGV4dHMgKENocmlzKQ0KPiA+IC0gUmV0YWluIGRlZmF1
bHQgY29udGV4dCBzdGF0ZSBhY3Jvc3Mgc2hyaW5raW5nIChWZW5rYXRhKQ0KPiA+IC0gTGltaXQg
ZnJlcXVlbmN5IGRyb3AgdG8gUlBlIG9uIHBhcmtpbmcgKENocmlzKQ0KPiA+IC0gUmV0dXJuIGVh
cmxpZXIgZnJvbSBpbnRlbF9tb2Rlc2V0X2luaXQoKSB3aXRob3V0IGRpc3BsYXkgKEphbmkpDQo+
ID4gLSBEZWZlciBpbml0aWFsIG1vZGVzZXQgdW50aWwgYWZ0ZXIgR0dUVCBpcyBpbml0aWFsaXpl
ZCAoQ2hyaXMpDQo+ID4gDQo+ID4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+IENocmlzIFdpbHNvbiAoNSk6DQo+ID4g
wqDCoMKgwqDCoCBkcm0vaTkxNS9ndDogUHJvZ3JhbSBtb2NzOjYzIGZvciBjYWNoZSBldmljdGlv
biBvbiBnZW45DQo+IA0KPiBUaGF0IGFsc28gbmVlZHMNCj4gY29tbWl0IDQ0NGZiZjVkNzA1OCAo
ImRybS9pOTE1L2d0OiBEZWNsYXJlIGdlbjkgaGFzIDY0IG1vY3MNCj4gZW50cmllcyEiKQ0KPiB3
aGljaCBzZWVtcyB0byBoYXZlIG5vdCBtYWRlIGl0IGludG8gdGhpcyBwdWxsLg0KDQp5ZWFwLCBJ
J20gc29ycnkgSSBoYXZlIG1pc3NlZCB0aGF0IG9uZS4NCmRpbSBkb2Vzbid0IGRlYWwgdmVyeSB3
ZWxsIHdpdGggZml4ZXMgZm9yIGZpeGVzIGFuZCBJIGVuZCB1cCBtaXNzaW5nDQp0aGF0Lg0KDQpJ
dCBpcyBub3cgb24gZGlmIGFuZCB3aWxsIGJlIHBhcnQgb2YgdGhpcyB3ZWVrJ3MgcHVsbCByZXF1
ZXN0Lg0KDQpUaGFua3MgZm9yIHRoZSBoZWFkcyB1cCwNClJvZHJpZ28uDQoNCj4gDQo+ID4gwqDC
oMKgwqDCoCBkcm0vaTkxNS9ndDogUHJvdGVjdCBjb250ZXh0IGxpZmV0aW1lIHdpdGggUkNVDQo+
ID4gwqDCoMKgwqDCoCBkcm0vaTkxNS9ndDogU3BsaXQgdGhlIGJyZWFkY3J1bWIgc3BpbmxvY2sg
YmV0d2VlbiBnbG9iYWwgYW5kDQo+ID4gY29udGV4dHMNCj4gPiDCoMKgwqDCoMKgIGRybS9pOTE1
L2d0OiBMaW1pdCBmcmVxdWVuY3kgZHJvcCB0byBSUGUgb24gcGFya2luZw0KPiA+IMKgwqDCoMKg
wqAgZHJtL2k5MTUvZGlzcGxheTogRGVmZXIgaW5pdGlhbCBtb2Rlc2V0IHVudGlsIGFmdGVyIEdH
VFQgaXMNCj4gPiBpbml0aWFsaXNlZA0KPiA+IA0KPiA+IEphbmkgTmlrdWxhICgxKToNCj4gPiDC
oMKgwqDCoMKgIGRybS9pOTE1L2Rpc3BsYXk6IHJldHVybiBlYXJsaWVyIGZyb20gaW50ZWxfbW9k
ZXNldF9pbml0KCkNCj4gPiB3aXRob3V0IGRpc3BsYXkNCj4gPiANCj4gPiBWZW5rYXRhIFJhbWFu
YSBOYXlhbmEgKDEpOg0KPiA+IMKgwqDCoMKgwqAgZHJtL2k5MTUvZ3Q6IFJldGFpbiBkZWZhdWx0
IGNvbnRleHQgc3RhdGUgYWNyb3NzIHNocmlua2luZw0KPiA+IA0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmPCoMKgwqDCoMKgIHzCoCAyNCArKy0tDQo+
ID4gwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9icmVhZGNydW1icy5jwqDCoMKgwqDC
oMKgIHwgMTY4DQo+ID4gKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3QvaW50ZWxfYnJlYWRjcnVtYnNfdHlwZXMuaCB8wqDCoCA2ICstDQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRlbF9jb250ZXh0LmPCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMTUgKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2NvbnRleHRf
dHlwZXMuaMKgwqDCoMKgIHzCoCAyMyArKy0NCj4gPiDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0
L2ludGVsX21vY3MuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxNCArLQ0KPiA+IMKg
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfcnBzLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDQgKw0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2htZW1fdXRp
bHMuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA3ICstDQo+ID4gwqBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pOTE1X3JlcXVlc3QuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKg
wqAgNiArLQ0KPiA+IMKgOSBmaWxlcyBjaGFuZ2VkLCAxNDMgaW5zZXJ0aW9ucygrKSwgMTI0IGRl
bGV0aW9ucygtKQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4gZGltLXRvb2xzIG1haWxpbmcgbGlzdA0KPiA+IGRpbS10b29sc0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RpbS10b29scw0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
