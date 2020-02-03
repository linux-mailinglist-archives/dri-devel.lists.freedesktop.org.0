Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435715108A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 20:51:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD8D6ECCC;
	Mon,  3 Feb 2020 19:51:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952DF6ECCC;
 Mon,  3 Feb 2020 19:51:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 11:51:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="263567151"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2020 11:51:42 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:51:42 -0800
Received: from bgsmsx105.gar.corp.intel.com (10.223.43.197) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 11:51:41 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX105.gar.corp.intel.com ([169.254.3.35]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 01:21:38 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Alex Deucher <alexdeucher@gmail.com>, Ville Syrjala
 <ville.syrjala@linux.intel.com>
Subject: RE: [Intel-gfx] [PATCH 4/8] drm/i915: Clear out spurious whitespace
Thread-Topic: [Intel-gfx] [PATCH 4/8] drm/i915: Clear out spurious whitespace
Thread-Index: AQHV0vFX4+GhY+52T02YoOzHr0U3/af+wBeAgAswZFA=
Date: Mon, 3 Feb 2020 19:51:38 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823A9FD7@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-4-ville.syrjala@linux.intel.com>
 <CADnq5_N=EK=QjiK=XH9G7urLHeCT5362AY31MAKAWG1Mh27NZw@mail.gmail.com>
In-Reply-To: <CADnq5_N=EK=QjiK=XH9G7urLHeCT5362AY31MAKAWG1Mh27NZw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTgyZWEwZjctMTY2ZC00YWNlLTllMWItNTFjMDg5NmUxZDBiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaFNQY3NXUHh2cHlSVmZXeXJCQ25VVzBWbFdOXC9vdGZVZGZybzNiR0JDQXFYV1BROEdYaTdlM3I2dkFxZFBKckgifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Maling
 list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBBbGV4DQo+
IERldWNoZXINCj4gU2VudDogVHVlc2RheSwgSmFudWFyeSAyOCwgMjAyMCAzOjU4IEFNDQo+IFRv
OiBWaWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IElu
dGVsIEdyYXBoaWNzIERldmVsb3BtZW50IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PjsgTWFsaW5nIGxpc3QgLSBEUkkNCj4gZGV2ZWxvcGVycyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4NCj4gU3ViamVjdDogUmU6IFtJbnRlbC1nZnhdIFtQQVRDSCA0LzhdIGRybS9p
OTE1OiBDbGVhciBvdXQgc3B1cmlvdXMgd2hpdGVzcGFjZQ0KPiANCj4gVGl0bGUgc2hvdWxkIGJl
IHMvaTkxNS9lZGlkLyAsIHdpdGggdGhhdCBmaXhlZDoNCj4gUmV2aWV3ZWQtYnk6IEFsZXggRGV1
Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCg0KWWVhaCB3aXRoIHRoZSB0aXRsZSBm
aXhlZCwgdGhpcyBpcw0KUmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRl
bC5jb20+DQoNCj4gDQo+IE9uIEZyaSwgSmFuIDI0LCAyMDIwIGF0IDM6MDMgUE0gVmlsbGUgU3ly
amFsYSA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPiA+DQo+ID4gRnJv
bTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gPg0K
PiA+IE51a2Ugc29tZSB3aGl0ZXNwYWNlIHRoYXQgc2hvdWxkbid0IGJlIHRoZXJlLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCA2ICsr
Ky0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4gPiBpbmRleCBkNmJjZTU4YjI3YWMuLjNkZjU3NDQw
MjZiMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jDQo+ID4gQEAgLTI4NDIsNyArMjg0Miw3IEBA
IGRvX2luZmVycmVkX21vZGVzKHN0cnVjdCBkZXRhaWxlZF90aW1pbmcgKnRpbWluZywgdm9pZA0K
PiAqYykNCj4gPiAgICAgICAgIGNsb3N1cmUtPm1vZGVzICs9IGRybV9kbXRfbW9kZXNfZm9yX3Jh
bmdlKGNsb3N1cmUtPmNvbm5lY3RvciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNsb3N1cmUtPmVkaWQsDQo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0aW1pbmcpOw0KPiA+IC0NCj4gPiAr
DQo+ID4gICAgICAgICBpZiAoIXZlcnNpb25fZ3JlYXRlcihjbG9zdXJlLT5lZGlkLCAxLCAxKSkN
Cj4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOyAvKiBHVEYgbm90IGRlZmluZWQgeWV0ICovDQo+
ID4NCj4gPiBAQCAtMzA4NCw3ICszMDg0LDcgQEAgZG9fY3Z0X21vZGUoc3RydWN0IGRldGFpbGVk
X3RpbWluZyAqdGltaW5nLCB2b2lkDQo+ID4gKmMpDQo+ID4NCj4gPiAgc3RhdGljIGludA0KPiA+
ICBhZGRfY3Z0X21vZGVzKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIHN0cnVjdCBl
ZGlkICplZGlkKSAtew0KPiA+ICt7DQo+ID4gICAgICAgICBzdHJ1Y3QgZGV0YWlsZWRfbW9kZV9j
bG9zdXJlIGNsb3N1cmUgPSB7DQo+ID4gICAgICAgICAgICAgICAgIC5jb25uZWN0b3IgPSBjb25u
ZWN0b3IsDQo+ID4gICAgICAgICAgICAgICAgIC5lZGlkID0gZWRpZCwNCj4gPiBAQCAtNDM0Miw3
ICs0MzQyLDcgQEAgdm9pZCBkcm1fZWRpZF9nZXRfbW9uaXRvcl9uYW1lKHN0cnVjdCBlZGlkDQo+
ID4gKmVkaWQsIGNoYXIgKm5hbWUsIGludCBidWZzaXplKSAgew0KPiA+ICAgICAgICAgaW50IG5h
bWVfbGVuZ3RoOw0KPiA+ICAgICAgICAgY2hhciBidWZbMTNdOw0KPiA+IC0NCj4gPiArDQo+ID4g
ICAgICAgICBpZiAoYnVmc2l6ZSA8PSAwKQ0KPiA+ICAgICAgICAgICAgICAgICByZXR1cm47DQo+
ID4NCj4gPiAtLQ0KPiA+IDIuMjQuMQ0KPiA+DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18NCj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsDQo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QN
Cj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ludGVsLWdmeA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
