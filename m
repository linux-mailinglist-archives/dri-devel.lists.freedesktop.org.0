Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3535F4FB3
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 08:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F06C10E10D;
	Wed,  5 Oct 2022 06:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (unknown [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A15610E10D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 06:19:48 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 05 Oct 2022 14:19:45 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 2956Jdg0091479;
 Wed, 5 Oct 2022 14:19:39 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Wed, 5 Oct 2022 14:19:39 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7%18]) with mapi id
 15.01.2176.014; Wed, 5 Oct 2022 14:19:39 +0800
From: <allen.chen@ite.com.tw>
To: <neil.armstrong@linaro.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Topic: [PATCH v2 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Index: AQHY098A6AOALJJYwUiaZi6xSxyCHK3/XJIg
Date: Wed, 5 Oct 2022 06:19:39 +0000
Message-ID: <087811c1bc224a468f117ca4f2fff3cd@ite.com.tw>
References: <20220929014456.30077-1-allen.chen@ite.com.tw>
 <20220929014456.30077-2-allen.chen@ite.com.tw>
 <aaf68eff-17da-3f27-c8dc-48b9659e7b50@linaro.org>
In-Reply-To: <aaf68eff-17da-3f27-c8dc-48b9659e7b50@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.46]
x-tm-snts-smtp: 21A87634EBC135BB704063ED5E5DEB282B79D8D6761C00B3F1C596F49CB0AB262002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 2956Jdg0091479
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
Cc: devicetree@vger.kernel.org, Kenneth.Hung@ite.com.tw,
 andrzej.hajda@intel.com, Jau-Chih.Tseng@ite.com.tw, airlied@linux.ie,
 robert.foss@linaro.org, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, treapking@chromium.org, Hermes.Wu@ite.com.tw,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkNCg0KZGF0YS1sYW5lcyBpcyBvdXRwdXQgY29uZmlndXJhdGlvbi4gTWF5YmUgaXQgaXMgbm90
IHN1aXRhYmxlIHRvIHB1dCBkYXRhLWxhbmVzIGluIGlucHV0IGVuZHBvaW50Lg0KZXh0Y29uIGRv
ZXNuJ3QgaGF2ZSBvdXRwdXQgZW5kcG9pbnQsIHNvIEkgZG9uJ3Qga25vdyB3aGVyZSB0byBwdXQg
aXMgYmV0dGVyLg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogTmVpbCBBcm1z
dHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IA0KU2VudDogVGh1cnNkYXksIFNlcHRl
bWJlciAyOSwgMjAyMiA0OjQwIFBNDQpUbzogQWxsZW4gQ2hlbiAo6Zmz5p+P5a6HKSA8YWxsZW4u
Y2hlbkBpdGUuY29tLnR3Pg0KQ2M6IG9wZW4gbGlzdDpPUEVOIEZJUk1XQVJFIEFORCBGTEFUVEVO
RUQgREVWSUNFIFRSRUUgQklORElOR1MgPGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnPjsgS2Vu
bmV0aCBIdW5nICjmtKrlrrblgKspIDxLZW5uZXRoLkh1bmdAaXRlLmNvbS50dz47IEplcm5laiBT
a3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBKYXUtQ2hpaCBUc2VuZyAo5pu+5pit
5pm6KSA8SmF1LUNoaWguVHNlbmdAaXRlLmNvbS50dz47IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT47IG9wZW4gbGlzdDpEUk0gRFJJVkVSUyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZz47IE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT47IG9wZW4g
bGlzdCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47IFJvYmVydCBGb3NzIDxyb2JlcnQu
Zm9zc0BsaW5hcm8ub3JnPjsgUGluLXllbiBMaW4gPHRyZWFwa2luZ0BjaHJvbWl1bS5vcmc+OyBI
ZXJtZXMgV3UgKOWQs+S9s+WujykgPEhlcm1lcy5XdUBpdGUuY29tLnR3PjsgUm9iIEhlcnJpbmcg
PHJvYmgrZHRAa2VybmVsLm9yZz47IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT47IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29t
PjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPg0KU3ViamVjdDogUmU6IFtQQVRDSCB2
MiAxLzJdIGR0LWJpbmRpbmdzOiBpdDY1MDU6IGFkZCBwcm9wZXJ0aWVzIHRvIHJlc3RyaWN0IG91
dHB1dCBiYW5kd2lkdGgNCg0KSGksDQoNCk9uIDI5LzA5LzIwMjIgMDM6NDQsIGFsbGVuIHdyb3Rl
Og0KPiBGcm9tOiBhbGxlbiBjaGVuIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+DQo+IA0KPiBBZGQg
cHJvcGVydGllcyB0byByZXN0cmljdCBkcCBvdXRwdXQgZGF0YS1sYW5lcyBhbmQgY2xvY2suDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBQaW4tWWVuIExpbiA8dHJlYXBraW5nQGNocm9taXVtLm9yZz4N
Cj4gU2lnbmVkLW9mZi1ieTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pg0KPiAt
LS0NCj4gICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUsaXQ2NTA1
LnlhbWwgfCAxMCArKysrKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgDQo+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2l0ZSxpdDY1MDUueWFtbCANCj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS55YW1sDQo+IGluZGV4
IDgzM2QxMWIyMzAzYS4uNjJiOWYyMTkyMjAyIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvaXRlLGl0NjUwNS55YW1sDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9pdGUs
aXQ2NTA1LnlhbWwNCj4gQEAgLTUyLDYgKzUyLDE0IEBAIHByb3BlcnRpZXM6DQo+ICAgICAgIG1h
eEl0ZW1zOiAxDQo+ICAgICAgIGRlc2NyaXB0aW9uOiBleHRjb24gc3BlY2lmaWVyIGZvciB0aGUg
UG93ZXIgRGVsaXZlcnkNCj4gICANCj4gKyAgZGF0YS1sYW5lczoNCj4gKyAgICBtYXhJdGVtczog
MQ0KPiArICAgIGRlc2NyaXB0aW9uOiByZXN0cmljdCB0aGUgZHAgb3V0cHV0IGRhdGEtbGFuZXMg
d2l0aCB2YWx1ZSBvZiAxLTQNCg0KQ2FuJ3QgeW91IHVzZSB0aGUgZGF0YS1sYW5lcyBwcm9wZXJ0
eSBpbiB0aGUgZmlyc3QgcG9ydCBlbmRwb2ludCA/DQoNCkxvb2sgYXQgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RpLHNuNjVkc2k4My55YW1sDQoNCj4g
Kw0KPiArICBtYXgtcGl4ZWwtY2xvY2sta2h6Og0KPiArICAgIG1heEl0ZW1zOiAxDQo+ICsgICAg
ZGVzY3JpcHRpb246IHJlc3RyaWN0IG1heCBwaXhlbCBjbG9jaw0KDQpOZXcgdmVuZG9yIHNwZWNp
ZmljIHByb3BlcnRpZXMgc2hvdWxkIGhhdmUgdGhlIGl0ZSwgcHJlZml4Lg0KDQo+ICsNCj4gICAg
IHBvcnQ6DQo+ICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9y
dA0KPiAgICAgICBkZXNjcmlwdGlvbjogQSBwb3J0IG5vZGUgcG9pbnRpbmcgdG8gRFBJIGhvc3Qg
cG9ydCBub2RlIEBAIC04NCw2IA0KPiArOTIsOCBAQCBleGFtcGxlczoNCj4gICAgICAgICAgICAg
ICBwd3IxOC1zdXBwbHkgPSA8Jml0NjUwNV9wcDE4X3JlZz47DQo+ICAgICAgICAgICAgICAgcmVz
ZXQtZ3Bpb3MgPSA8JnBpbyAxNzkgMT47DQo+ICAgICAgICAgICAgICAgZXh0Y29uID0gPCZ1c2Jj
X2V4dGNvbj47DQo+ICsgICAgICAgICAgICBkYXRhLWxhbmVzID0gPDI+Ow0KPiArICAgICAgICAg
ICAgbWF4LXBpeGVsLWNsb2NrLWtoeiA9IDwxNTAwMDA+Ow0KPiAgIA0KPiAgICAgICAgICAgICAg
IHBvcnQgew0KPiAgICAgICAgICAgICAgICAgICBpdDY1MDVfaW46IGVuZHBvaW50IHsNCg0KVGhh
bmtzLA0KTmVpbA0K
