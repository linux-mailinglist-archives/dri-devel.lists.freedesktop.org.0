Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9AF97D973
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 12:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9716C6E488;
	Thu,  1 Aug 2019 10:36:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA7996E488;
 Thu,  1 Aug 2019 10:36:42 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Aug 2019 03:36:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,333,1559545200"; d="scan'208";a="371983405"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga005.fm.intel.com with ESMTP; 01 Aug 2019 03:36:41 -0700
Received: from bgsmsx109.gar.corp.intel.com (10.223.4.211) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 1 Aug 2019 03:36:41 -0700
Received: from bgsmsx101.gar.corp.intel.com ([169.254.1.176]) by
 BGSMSX109.gar.corp.intel.com ([169.254.10.93]) with mapi id 14.03.0439.000;
 Thu, 1 Aug 2019 16:06:38 +0530
From: "Sharma, Shashank" <shashank.sharma@intel.com>
To: "C, Ramalingam" <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, Pekka Paalanen <ppaalanen@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH v10 6/6] drm/hdcp: reference for srm file format
Thread-Topic: [PATCH v10 6/6] drm/hdcp: reference for srm file format
Thread-Index: AQHVOLoSIC45QOGzXEuNUU0iWPnUs6bmN9Zg
Date: Thu, 1 Aug 2019 10:36:37 +0000
Message-ID: <FF3DDC77922A8A4BB08A3BC48A1EA8CB8DF8FE8F@BGSMSX101.gar.corp.intel.com>
References: <20190712070026.13088-1-ramalingam.c@intel.com>
 <20190712070026.13088-7-ramalingam.c@intel.com>
In-Reply-To: <20190712070026.13088-7-ramalingam.c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiN2FlMGRlYTctNzVhNS00MGUxLTkxNGQtYWUyZmFlMDYzYWJhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiNmZaU2xURENnZkFFV0o1WFhicUd0WHdWcFZ5UUNxZDJRS1VuVUhoU0FsSHBQTW1laitEWDFDaU9RYkNFXC9nWFMifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmFtLCANCkp1c3QgYSBtaW5vciBuaXRwaWNrLiANCg0KUmVnYXJkcw0KU2hhc2hhbmsNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogZHJpLWRldmVsIFttYWlsdG86ZHJp
LWRldmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnXSBPbiBCZWhhbGYgT2YNCj4gUmFt
YWxpbmdhbSBDDQo+IFNlbnQ6IEZyaWRheSwgSnVseSAxMiwgMjAxOSAxMjozMCBQTQ0KPiBUbzog
aW50ZWwtZ2Z4IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgZHJpLWRldmVsIDxk
cmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz47IFBla2thIFBhYWxhbmVuIDxwcGFh
bGFuZW5AZ21haWwuY29tPjsgRGFuaWVsDQo+IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjEwIDYvNl0gZHJtL2hkY3A6IHJlZmVyZW5jZSBmb3Igc3JtIGZpbGUg
Zm9ybWF0DQo+IA0KPiBJbiB0aGUga2VybmVsIGRvY3VtZW50YXRpb24sIEhEQ1Agc3BlY2lmaWNh
dGlvbnMgbGlua3MgYXJlIHNoYXJlZCBhcyBhIHJlZmVyZW5jZSBmb3INCj4gU1JNIHRhYmxlIGZv
cm1hdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFJhbWFsaW5nYW0gQyA8cmFtYWxpbmdhbS5jQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2hkY3AuYyB8IDcgKysrKysr
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9oZGNwLmMg
aW5kZXgNCj4gNzc0MzNlZTNkNjUyLi44MDNiZjgyODNiODMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1faGRjcC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faGRjcC5j
DQo+IEBAIC0yNzEsNiArMjcxLDEzIEBAIHN0YXRpYyB2b2lkIGRybV9oZGNwX3JlcXVlc3Rfc3Jt
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkcm1fZGV2KQ0KPiAgICoNCj4gICAqIFNSTSBzaG91bGQg
YmUgcHJlc2VudGVkIGluIHRoZSBuYW1lIG9mICJkaXNwbGF5X2hkY3Bfc3JtLmJpbiIuDQo+ICAg
Kg0KPiArICogRm9ybWF0IG9mIHRoZSBTUk0gdGFibGUgdGhhdCB1c2Vyc3BhY2UgbmVlZHMgdG8g
d3JpdGUgaW50byB0aGUNCj4gKyBiaW5hcnkgZmlsZQ0KPiArICogaXMgZGVmaW5lZCBhdA0KSSB3
b3VsZCBqdXN0IHByZWZlciBhZGRpdGlvbiBvZiAyICcsJyBhbmQgYSAnOicsIHNvbWV0aGluZyBs
aWtlOg0KRm9ybWF0IG9mIHRoZSBTUk0gdGFibGUsIHRoYXQgdGhlIHVzZXJzcGFjZSBuZWVkcyB0
byB3cml0ZSBpbnRvIHRoZSBiaW5hcnkgZmlsZSwgaXMgZGVmaW5lZCBhdDoNCg0KV2l0aCB0aGlz
IGNoYW5nZSwgcGxlYXNlIGZlZWwgZnJlZSB0byB1c2U6DQpSZXZpZXdlZC1ieTogU2hhc2hhbmsg
U2hhcm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPg0KDQo+ICsgKiAxLiBSZW5ld2FiaWxp
dHkgY2hhcHRlciBvbiA1NXRoIHBhZ2Ugb2YgSERDUCAxLjQgc3BlY2lmaWNhdGlvbg0KPiArICoN
Cj4gKyBodHRwczovL3d3dy5kaWdpdGFsLWNwLmNvbS9zaXRlcy9kZWZhdWx0L2ZpbGVzL3NwZWNp
ZmljYXRpb25zL0hEQ1AlMjBTDQo+ICsgcGVjaWZpY2F0aW9uJTIwUmV2MV80X1NlY3VyZS5wZGYN
Cj4gKyAqIDIuIFJlbmV3YWJpbGl0eSBjaGFwdGVyIG9uIDYzcmQgcGFnZSBvZiBIRENQIDIuMiBz
cGVjaWZpY2F0aW9uDQo+ICsgKg0KPiArIGh0dHBzOi8vd3d3LmRpZ2l0YWwtY3AuY29tL3NpdGVz
L2RlZmF1bHQvZmlsZXMvc3BlY2lmaWNhdGlvbnMvSERDUCUyMG8NCj4gKyBuJTIwSERNSSUyMFNw
ZWNpZmljYXRpb24lMjBSZXYyXzJfRmluYWwxLnBkZg0KPiArICoNCj4gICAqIFJldHVybnM6DQo+
ICAgKiBUUlVFIG9uIGFueSBvZiB0aGUgS1NWIGlzIHJldm9rZWQsIGVsc2UgRkFMU0UuDQo+ICAg
Ki8NCj4gLS0NCj4gMi4xOS4xDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0DQo+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
