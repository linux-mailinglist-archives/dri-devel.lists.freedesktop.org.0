Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7DF1510D1
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 21:15:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D11E6E435;
	Mon,  3 Feb 2020 20:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344FF6E435;
 Mon,  3 Feb 2020 20:15:57 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 12:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="263573937"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2020 12:15:55 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 12:15:54 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 3 Feb 2020 12:15:54 -0800
Received: from bgsmsx103.gar.corp.intel.com (10.223.4.130) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 3 Feb 2020 12:15:54 -0800
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.36]) by
 BGSMSX103.gar.corp.intel.com ([169.254.4.106]) with mapi id 14.03.0439.000;
 Tue, 4 Feb 2020 01:45:52 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA
 data block revision
Thread-Topic: [Intel-gfx] [PATCH 6/8] drm/edid: Add a FIXME about DispID CEA
 data block revision
Thread-Index: AQHV0vFRvK3Rx8nvZ0q0EHz2sUQxxagJ9d2A
Date: Mon, 3 Feb 2020 20:15:51 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823AA020@BGSMSX104.gar.corp.intel.com>
References: <20200124200231.10517-1-ville.syrjala@linux.intel.com>
 <20200124200231.10517-6-ville.syrjala@linux.intel.com>
In-Reply-To: <20200124200231.10517-6-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjdlNTI4ZTItZjE3OC00M2U1LWEwNTItZDE0MTJlOWMxNWFiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiU2ZcLzRtaVwvUVpNb3NBNmRvWUFcLzNLcXlVYjVmUEVKQjNSeGxZZzNMTmdLa1dxNndrcUlaTWJRdGdEbVRzTjBCUiJ9
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Andres Rodriguez <andresx7@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBWaWxsZSBT
eXJqYWxhDQo+IFNlbnQ6IFNhdHVyZGF5LCBKYW51YXJ5IDI1LCAyMDIwIDE6MzIgQU0NCj4gVG86
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IGludGVsLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IEFuZHJlcyBSb2RyaWd1ZXogPGFuZHJlc3g3QGdtYWlsLmNvbT4NCj4g
U3ViamVjdDogW0ludGVsLWdmeF0gW1BBVENIIDYvOF0gZHJtL2VkaWQ6IEFkZCBhIEZJWE1FIGFi
b3V0IERpc3BJRCBDRUEgZGF0YSBibG9jaw0KPiByZXZpc2lvbg0KPiANCj4gRnJvbTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gDQo+IEkgZG9uJ3Qg
dW5kZXJzdGFuZCB3aGF0IHRoZSBEaXNwSUQgQ0VBIGRhdGEgYmxvY2sgcmV2aXNpb24gbWVhbnMu
IFRoZSBzcGVjIGRvZXNuJ3QNCj4gc2F5LiBJIGd1ZXNzIHNvbWUgRGlzcElEIG11c3QgaGF2ZSBh
IHZhbHVlIG9mID49IDMgaW4gdGhlcmUgb3IgZWxzZSB3ZSBnZW5lcmFsbHkNCj4gd291bGRuJ3Qg
ZXZlbiBwYXJzZSB0aGUgQ0VBIGRhdGEgYmxvY2tzLiBPciBkb2VzIGFsbCB0aGlzIGNvZGUgYWN0
dWFsbHkgbm90IGRvDQo+IGFueXRoaW5nPw0KDQpUaGlzIHNpZ25pZmllcyB0aGUgQ1RBIGV4dGVu
c2lvbiByZXZpc2lvbiAoYnl0ZSAxIG9mIHRoZSBibG9jaykuIEFzIHBlciB0aGUgc3BlYywgc2Vl
bXMgbGlrZQ0KVmVyc2lvbiAxIGlzIGxlZ2FjeSBhbmQgMiBpcyBkZXByZWNhdGVkLiBTbyB2ZXJz
aW9uID49MyBpcyBjaGVja2VkIGhlcmUuDQpSZWZlciBzZWN0aW9uIDcuMyBvZiBDVEEtODYxLUcN
Cg0KPiBDYzogQW5kcmVzIFJvZHJpZ3VleiA8YW5kcmVzeDdAZ21haWwuY29tPg0KPiBTaWduZWQt
b2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIHwgNyArKysrKysrDQo+ICAxIGZp
bGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBpbmRleA0KPiAw
MzY5YTU0ZTNkMzIuLmZkOWI3MjQwNjdhNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4gQEAgLTM5
NzcsNiArMzk3NywxMyBAQCBjZWFfZGJfdGFnKGNvbnN0IHU4ICpkYikgIHN0YXRpYyBpbnQgIGNl
YV9yZXZpc2lvbihjb25zdA0KPiB1OCAqY2VhKSAgew0KPiArCS8qDQo+ICsJICogRklYTUUgaXMg
dGhpcyBjb3JyZWN0IGZvciB0aGUgRGlzcElEIHZhcmlhbnQ/DQo+ICsJICogVGhlIERpc3BJRCBz
cGVjIGRvZXNuJ3QgcmVhbGx5IHNwZWNpZnkgd2hldGhlcg0KPiArCSAqIHRoaXMgaXMgdGhlIHJl
dmlzaW9uIG9mIHRoZSBDRUEgZXh0ZW5zaW9uIG9yDQo+ICsJICogdGhlIERpc3BJRCBDRUEgZGF0
YSBibG9jay4gQW5kIHRoZSBvbmx5IHZhbHVlDQo+ICsJICogZ2l2ZW4gYXMgYW4gZXhhbXBsZSBp
cyAwLg0KPiArCSAqLw0KPiAgCXJldHVybiBjZWFbMV07DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjI0
LjENCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+IEludGVsLWdmeCBtYWlsaW5nIGxpc3QNCj4gSW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZw0KPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lu
dGVsLWdmeA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
