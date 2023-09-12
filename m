Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E57A79D168
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 14:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F7810E22D;
	Tue, 12 Sep 2023 12:53:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B23E10E229
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Sep 2023 12:52:58 +0000 (UTC)
Received: from dsgsiengine01 ([10.8.1.61])
 by mail03.siengine.com with ESMTPS id 38CCqQBr076710
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 12 Sep 2023 20:52:26 +0800 (+08)
 (envelope-from lucas.liu@siengine.com)
Received: from SEEXMB04-2019.siengine.com (SEEXMB04-2019.siengine.com
 [10.8.1.34])
 by dsgsiengine01 (SkyGuard) with ESMTPS id 4RlNlY0v7Mz7ZMCq;
 Tue, 12 Sep 2023 20:52:25 +0800 (CST)
Received: from SEEXMB04-2019.siengine.com (10.8.1.34) by
 SEEXMB04-2019.siengine.com (10.8.1.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1258.25; Tue, 12 Sep 2023 20:52:24 +0800
Received: from SEEXMB04-2019.siengine.com ([fe80::ebda:7f0d:8ee8:ab8f]) by
 SEEXMB04-2019.siengine.com ([fe80::ebda:7f0d:8ee8:ab8f%14]) with mapi id
 15.02.1258.025; Tue, 12 Sep 2023 20:52:24 +0800
From: =?utf-8?B?TGl1IEx1Y2FzL+WImOS/neafsQ==?= <lucas.liu@siengine.com>
To: "liviu.dudau@arm.com" <liviu.dudau@arm.com>
Subject: =?utf-8?B?5Zue5aSNOiDlm57lpI06IFtQQVRDSF0gZHJtL2tvbWVkYTogYWRkIE5WMTIg?=
 =?utf-8?Q?format_to_support_writeback_layer_type?=
Thread-Topic: =?utf-8?B?5Zue5aSNOiBbUEFUQ0hdIGRybS9rb21lZGE6IGFkZCBOVjEyIGZvcm1hdCB0?=
 =?utf-8?Q?o_support_writeback_layer_type?=
Thread-Index: AQHZ2ltn9LP8IvenzkCX2e1v2bsk4rAQoe+AgASgowCAAfUnsA==
Date: Tue, 12 Sep 2023 12:52:24 +0000
Message-ID: <77ed4490216c4bee819f3ace386c80b5@siengine.com>
References: <20230829093004.22860-1-lucas.liu@siengine.com>
 <b393669c80274dfcbcf94c60fea8ae76@siengine.com>
 <ZP8oMFLFc_Lr090h@e110455-lin.cambridge.arm.com>
In-Reply-To: <ZP8oMFLFc_Lr090h@e110455-lin.cambridge.arm.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.12.10.56]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: mail03.siengine.com 38CCqQBr076710
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGl2aXUsDQoNCglUaGFuayB5b3Ugc28gbXVjaCBmb3IgcmV2aWV3aW5nIHRoaXMgcGF0Y2gh
ICBJIGV4cGVjdCB0aGlzIHBhdGNoIHRvIGJlIG1lcmdlZC4NCg0KQmVzdCBSZWdhcmRzLA0KYmFv
emh1LmxpdQ0KDQotLS0tLemCruS7tuWOn+S7ti0tLS0tDQrlj5Hku7bkuro6IGxpdml1LmR1ZGF1
QGFybS5jb20gPGxpdml1LmR1ZGF1QGFybS5jb20+IA0K5Y+R6YCB5pe26Ze0OiAyMDIz5bm0Oeac
iDEx5pelIDIyOjQ2DQrmlLbku7bkuro6IExpdSBMdWNhcy/liJjkv53mn7EgPGx1Y2FzLmxpdUBz
aWVuZ2luZS5jb20+DQrmioTpgIE6IGFpcmxpZWRAZ21haWwuY29tOyBkYW5pZWxAZmZ3bGwuY2g7
IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCuS4u+mimDogUmU6IOWbnuWkjTogW1BBVENIXSBkcm0va29tZWRhOiBhZGQgTlYxMiBm
b3JtYXQgdG8gc3VwcG9ydCB3cml0ZWJhY2sgbGF5ZXIgdHlwZQ0KDQpIaSBMaXUsDQoNClNvcnJ5
IGFib3V0IHRoZSBkZWxheSwgSSB3YXMgb24gaG9saWRheSB1bnRpbCAyOHRoIGFuZCB3aGlsZSBj
bGVhbmluZyB1cCB0aGUgYmFja2xvZyBJJ3ZlIGFjY2lkZW50YWxseSBtYXJrZWQgdGhlIGVtYWls
IGFzIHJlYWQgYW5kIGRpZCBub3QgcmVwbHkuDQoNCg0KT24gRnJpLCBTZXAgMDgsIDIwMjMgYXQg
MDg6MTE6NDRBTSArMDAwMCwgTGl1IEx1Y2FzL+WImOS/neafsSB3cm90ZToNCj4gSGkgIGFsbCwN
Cj4gDQo+IAlEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIHRoZSBwYXRjaCBJIHN1Ym1p
dHRlZD8gUGxlYXNlIGFsc28gbGV0IG1lIGtub3csIHRoYW5rIHlvdSENCj4gDQo+IEJlc3QgUmVn
YXJkcywNCj4gYmFvemh1LmxpdQ0KPiAtLS0tLemCruS7tuWOn+S7ti0tLS0tDQo+IOWPkeS7tuS6
ujogYmFvemh1LmxpdSA8bHVjYXMubGl1QHNpZW5naW5lLmNvbT4NCj4g5Y+R6YCB5pe26Ze0OiAy
MDIz5bm0OOaciDI55pelIDE3OjMwDQo+IOaUtuS7tuS6ujogbGl2aXUuZHVkYXVAYXJtLmNvbTsg
YWlybGllZEBnbWFpbC5jb207IGRhbmllbEBmZndsbC5jaA0KPiDmioTpgIE6IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IExpdSAN
Cj4gTHVjYXMv5YiY5L+d5p+xIDxsdWNhcy5saXVAc2llbmdpbmUuY29tPg0KPiDkuLvpopg6IFtQ
QVRDSF0gZHJtL2tvbWVkYTogYWRkIE5WMTIgZm9ybWF0IHRvIHN1cHBvcnQgd3JpdGViYWNrIGxh
eWVyIA0KPiB0eXBlDQo+IA0KPiBXaGVuIHRlc3RpbmcgdGhlIGQ3MSB3cml0ZWJhY2sgbGF5ZXIg
ZnVuY3Rpb24sIHRoZSBvdXRwdXQgZm9ybWF0IGlzIHNldCB0byBOVjEyLCBhbmQgdGhlIGZvbGxv
d2luZyBlcnJvciBtZXNzYWdlIGlzIGRpc3BsYXllZDoNCj4gDQo+IFtkcm06a29tZWRhX2ZiX2lz
X2xheWVyX3N1cHBvcnRlZF0gTGF5ZXIgVFlQRTogNCBkb2Vzbid0IHN1cHBvcnQgZmIgRk1UOiBO
VjEyIGxpdHRsZS1lbmRpYW4gKDB4MzIzMTU2NGUpIHdpdGggbW9kaWZpZXI6IDB4MC4uDQo+IA0K
PiBDaGVjayB0aGUgZDcxIGRhdGEgbWFudWFsLCB3cml0ZWJhY2sgbGF5ZXIgb3V0cHV0IGZvcm1h
dHMgaW5jbHVkZXMgTlYxMiBmb3JtYXQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBiYW96aHUubGl1
IDxsdWNhcy5saXVAc2llbmdpbmUuY29tPg0KDQpBY2tlZC1ieTogTGl2aXUgRHVkYXUgPGxpdml1
LmR1ZGF1QGFybS5jb20+DQoNCkkgd2lsbCBwdXNoIHRoZSBwYXRjaCB0aGlzIHdlZWsgaW50byBk
cm0tbWlzYy1uZXh0Lg0KDQpCZXN0IHJlZ2FyZHMsDQpMaXZpdQ0KDQo+IC0tLQ0KPiAgZHJpdmVy
cy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jIHwgMiArLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jIA0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYw0KPiBp
bmRleCA2YzU2ZjU2NjJiYzcuLjgwOTczOTc1YmZkYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9kNzEvZDcxX2Rldi5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEvZDcxL2Q3MV9kZXYuYw0KPiBAQCAtNTIxLDcgKzUy
MSw3IEBAIHN0YXRpYyBzdHJ1Y3Qga29tZWRhX2Zvcm1hdF9jYXBzIGQ3MV9mb3JtYXRfY2Fwc190
YWJsZVtdID0gew0KPiAgCXtfX0hXX0lEKDUsIDEpLAlEUk1fRk9STUFUX1lVWVYsCVJJQ0gsCQlS
b3RfQUxMX0hfViwJTFlUX05NLCBBRkJfVEh9LCAvKiBhZmJjICovDQo+ICAJe19fSFdfSUQoNSwg
MiksCURSTV9GT1JNQVRfWVVZViwJUklDSCwJCUZsaXBfSF9WLAkJMCwgMH0sDQo+ICAJe19fSFdf
SUQoNSwgMyksCURSTV9GT1JNQVRfVVlWWSwJUklDSCwJCUZsaXBfSF9WLAkJMCwgMH0sDQo+IC0J
e19fSFdfSUQoNSwgNiksCURSTV9GT1JNQVRfTlYxMiwJUklDSCwJCUZsaXBfSF9WLAkJMCwgMH0s
DQo+ICsJe19fSFdfSUQoNSwgNiksCURSTV9GT1JNQVRfTlYxMiwJUklDSF9XQiwJRmxpcF9IX1Ys
CQkwLCAwfSwNCj4gIAl7X19IV19JRCg1LCA2KSwJRFJNX0ZPUk1BVF9ZVVY0MjBfOEJJVCwJUklD
SCwJCVJvdF9BTExfSF9WLAlMWVRfTk0sIEFGQl9USH0sIC8qIGFmYmMgKi8NCj4gIAl7X19IV19J
RCg1LCA3KSwJRFJNX0ZPUk1BVF9ZVVY0MjAsCVJJQ0gsCQlGbGlwX0hfViwJCTAsIDB9LA0KPiAg
CS8qIFlVViAxMGJpdCovDQo+IC0tDQo+IDIuMTcuMQ0KPiANCg0KLS0NCj09PT09PT09PT09PT09
PT09PT09DQp8IEkgd291bGQgbGlrZSB0byB8DQp8IGZpeCB0aGUgd29ybGQsICB8DQp8IGJ1dCB0
aGV5J3JlIG5vdCB8DQp8IGdpdmluZyBtZSB0aGUgICB8DQogXCBzb3VyY2UgY29kZSEgIC8NCiAg
LS0tLS0tLS0tLS0tLS0tDQogICAgwq9cXyjjg4QpXy/Crw0K
