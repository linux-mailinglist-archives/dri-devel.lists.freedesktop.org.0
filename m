Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A39121023
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 17:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E09E6E82F;
	Mon, 16 Dec 2019 16:53:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D676A6E82F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 16:53:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Dec 2019 08:53:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,322,1571727600"; d="scan'208";a="209361264"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga008.jf.intel.com with ESMTP; 16 Dec 2019 08:53:01 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 16 Dec 2019 08:53:01 -0800
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.123]) by
 FMSMSX112.amr.corp.intel.com ([169.254.5.60]) with mapi id 14.03.0439.000;
 Mon, 16 Dec 2019 08:53:00 -0800
From: "Souza, Jose" <jose.souza@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Thread-Topic: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Thread-Index: AQHVr5VOtdxG7Lq5ukemDABklO2K9qe3RwSAgAZCdwA=
Date: Mon, 16 Dec 2019 16:52:59 +0000
Message-ID: <f34ba2961515a8acbd2c9169e3e1b31cdbd23fb3.camel@intel.com>
References: <20191210200611.11013-1-jose.souza@intel.com>
 <20191212171731.GD85422@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20191212171731.GD85422@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.254.102.104]
Content-ID: <E3D9D2FF3CDC1A489713B1D163FD4417@intel.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Ausmus, James" <james.ausmus@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDE5LTEyLTEyIGF0IDA5OjE3IC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBP
biBUdWUsIERlYyAxMCwgMjAxOSBhdCAxMjowNjoxMVBNIC0wODAwLCBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphDQo+IHdyb3RlOg0KPiA+IEl0IGlzIG1pc3NpbmcgdGhlIG5ldyBFSEwvSlNMIFBDSSBp
ZHMgYWRkZWQgaW4gY29tbWl0DQo+ID4gNjUxY2M4MzVkNWY2ICgiZHJtL2k5MTU6IEFkZCBuZXcg
RUhML0pTTCBQQ0kgaWRzIikNCj4gPiANCj4gPiBDYzogSmFtZXMgQXVzbXVzIDxqYW1lcy5hdXNt
dXNAaW50ZWwuY29tPg0KPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwu
Y29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291
emFAaW50ZWwuY29tPg0KPiANCj4gTWF0Y2hlcyB0aGUga2VybmVsIGFuZCB0aGUgYnNwZWMuDQo+
IA0KPiBSZXZpZXdlZC1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4N
Cg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpJIGp1c3QgcmVxdWVzdGVkIGxpYmRybSBjb21t
aXQgYWNjZXNzIGluIHRoZSBtZWFuIHRpbWUgY291bGQgc29tZW9uZQ0KcHVzaCB0aGlzPw0KDQpU
aGFua3MNCg0KPiANCj4gPiAtLS0NCj4gPiAgaW50ZWwvaTkxNV9wY2lpZHMuaCB8IDcgKysrKyst
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0K
PiA+IA0KPiA+IGRpZmYgLS1naXQgYS9pbnRlbC9pOTE1X3BjaWlkcy5oIGIvaW50ZWwvaTkxNV9w
Y2lpZHMuaA0KPiA+IGluZGV4IGIxZjY2YjExLi4zZTI2YTkxNyAxMDA2NDQNCj4gPiAtLS0gYS9p
bnRlbC9pOTE1X3BjaWlkcy5oDQo+ID4gKysrIGIvaW50ZWwvaTkxNV9wY2lpZHMuaA0KPiA+IEBA
IC01NzksMTIgKzU3OSwxNSBAQA0KPiA+ICAJSU5URUxfVkdBX0RFVklDRSgweDhBNTEsIGluZm8p
LCBcDQo+ID4gIAlJTlRFTF9WR0FfREVWSUNFKDB4OEE1RCwgaW5mbykNCj4gPiAgDQo+ID4gLS8q
IEVITCAqLw0KPiA+ICsvKiBFSEwvSlNMICovDQo+ID4gICNkZWZpbmUgSU5URUxfRUhMX0lEUyhp
bmZvKSBcDQo+ID4gIAlJTlRFTF9WR0FfREVWSUNFKDB4NDUwMCwgaW5mbyksCVwNCj4gPiAgCUlO
VEVMX1ZHQV9ERVZJQ0UoMHg0NTcxLCBpbmZvKSwgXA0KPiA+ICAJSU5URUxfVkdBX0RFVklDRSgw
eDQ1NTEsIGluZm8pLCBcDQo+ID4gLQlJTlRFTF9WR0FfREVWSUNFKDB4NDU0MSwgaW5mbykNCj4g
PiArCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0NTQxLCBpbmZvKSwgXA0KPiA+ICsJSU5URUxfVkdBX0RF
VklDRSgweDRFNzEsIGluZm8pLCBcDQo+ID4gKwlJTlRFTF9WR0FfREVWSUNFKDB4NEU2MSwgaW5m
byksIFwNCj4gPiArCUlOVEVMX1ZHQV9ERVZJQ0UoMHg0RTUxLCBpbmZvKQ0KPiA+ICANCj4gPiAg
LyogVEdMICovDQo+ID4gICNkZWZpbmUgSU5URUxfVEdMXzEyX0lEUyhpbmZvKSBcDQo+ID4gLS0g
DQo+ID4gMi4yNC4wDQo+ID4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
