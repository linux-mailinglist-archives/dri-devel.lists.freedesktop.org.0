Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A47474EA
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7EA5891C1;
	Sun, 16 Jun 2019 14:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78FD898A4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:29:17 +0000 (UTC)
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com (20.178.123.141) by
 VI1PR04MB5405.eurprd04.prod.outlook.com (20.178.121.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.12; Fri, 14 Jun 2019 13:29:14 +0000
Received: from VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3dd4:5031:dc06:1fd7]) by VI1PR04MB5967.eurprd04.prod.outlook.com
 ([fe80::3dd4:5031:dc06:1fd7%7]) with mapi id 15.20.1965.018; Fri, 14 Jun 2019
 13:29:14 +0000
From: Robert Chiras <robert.chiras@nxp.com>
To: "festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [EXT] Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191
 panel driver
Thread-Topic: [EXT] Re: [PATCH 2/2] drm/panel: Add support for Raydium RM67191
 panel driver
Thread-Index: AQHVIqdzFTZPTbEojEKDO3NY8aRErKabE9mAgAARJ4A=
Date: Fri, 14 Jun 2019 13:29:14 +0000
Message-ID: <1560518953.9328.31.camel@nxp.com>
References: <1560513063-24995-1-git-send-email-robert.chiras@nxp.com>
 <1560513063-24995-3-git-send-email-robert.chiras@nxp.com>
 <CAOMZO5BAborMvk=4cgreWKX6rJjK-237me98dM1dDV53oUnExQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BAborMvk=4cgreWKX6rJjK-237me98dM1dDV53oUnExQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b87de7a8-16ef-47d9-df58-08d6f0cc4b34
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5405; 
x-ms-traffictypediagnostic: VI1PR04MB5405:
x-microsoft-antispam-prvs: <VI1PR04MB5405823370614FBA2628D863E3EE0@VI1PR04MB5405.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0068C7E410
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(396003)(346002)(366004)(136003)(376002)(199004)(189003)(8676002)(54906003)(44832011)(1411001)(68736007)(86362001)(99286004)(64756008)(66946007)(73956011)(66556008)(66446008)(66476007)(478600001)(76116006)(81166006)(7416002)(305945005)(14444005)(8936002)(256004)(76176011)(66066001)(7736002)(14454004)(2501003)(81156014)(2906002)(1730700003)(6506007)(53546011)(6246003)(103116003)(186003)(6512007)(26005)(1361003)(316002)(5660300002)(6116002)(2351001)(6486002)(50226002)(36756003)(476003)(2616005)(102836004)(11346002)(25786009)(446003)(3846002)(229853002)(5640700003)(486006)(71190400001)(71200400001)(6916009)(6436002)(4326008)(53936002)(99106002)(2004002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5405;
 H:VI1PR04MB5967.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2MVYUqXYn6op9/Lbh21HunQ1VW/rvBfhSN+CWJTDSFRfPHNMINTGgw30Tz3o6+RlZrFAzLO0pFTKLRffEBwSRmbZJRG+WkpFmfVjTGFMyPpudNJGcdquo3XvswLuIRuypxau/IzKQvbF+uCFniudsdFgWJP+x9STaAEL2B0pNlGpTc+pl/RRAEw+NPfD9ZDrfQLO56DA9n4qjtiPe0u00pbvPt37iptYCizwOYU5ZKJvE6LipkPCgAjNNs9PSlk5BN+UYb3RZ0Z3baLTHxl5bRsPbxG1NPRvfH6f7o3IZ1S4w0jwJcFuCbt77mMekoUkFzhIAwnKQClyvZ7Cn0PNFJPVBXQ8J1D6Z6MlYskiojFENO1c54l/cEuZ3qPWZq5cBg86WivjE+D8T5b6viQJgqTwHr+i33hJEMloyr77p5s=
Content-ID: <6B40518580B34A4591C8D937481773BE@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b87de7a8-16ef-47d9-df58-08d6f0cc4b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2019 13:29:14.3505 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: robert.chiras@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5405
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5l0eTiCXHxR4pHpa1CzyJNPzzs0FbIQx0VVcf3f+yY=;
 b=OLRYJWboKLn4a85fwq2FClY9gVZFhs3POVB1+BtpEyrUmSlwrFVKVL0kophrfAU/j4ZQdzOTWx2L5YSpwZGV09RP0QcpwUoFrgk7nldiaym+Gywpntnt3nl2sph2IPzg15fMBcY1vlNdLpfzaYoYKhwgM/Hro3L8f6A6fiqRmRA=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=robert.chiras@nxp.com; 
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>, "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRmFiaW8sDQoNCk9uIFZpLCAyMDE5LTA2LTE0IGF0IDA5OjI3IC0wMzAwLCBGYWJpbyBFc3Rl
dmFtIHdyb3RlOg0KPiBIaSBSb2JlcnQsDQo+IA0KPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCA4
OjUyIEFNIFJvYmVydCBDaGlyYXMgPHJvYmVydC5jaGlyYXNAbnhwLmNvbT4NCj4gd3JvdGU6DQo+
IA0KPiA+IA0KPiA+IC0tLSAvZGV2L251bGwNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFu
ZWwvcGFuZWwtcmF5ZGl1bS1ybTY3MTkxLmMNCj4gPiBAQCAtMCwwICsxLDczMCBAQA0KPiA+ICsv
LyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMA0KPiA+ICsvKg0KPiA+ICsgKiBpLk1Y
IGRybSBkcml2ZXIgLSBSYXlkaXVtIE1JUEktRFNJIHBhbmVsIGRyaXZlcg0KPiA+ICsgKg0KPiA+
ICsgKiBDb3B5cmlnaHQgKEMpIDIwMTcgTlhQDQo+ID4gKyAqDQo+ID4gKyAqIFRoaXMgcHJvZ3Jh
bSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3INCj4gPiAr
ICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UNCj4gPiArICogYXMgcHVibGlzaGVkIGJ5IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRp
b247IGVpdGhlciB2ZXJzaW9uIDINCj4gPiArICogb2YgdGhlIExpY2Vuc2UsIG9yIChhdCB5b3Vy
IG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uDQo+ID4gKyAqIFRoaXMgcHJvZ3JhbSBpcyBkaXN0
cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUgdXNlZnVsLA0KPiA+ICsgKiBidXQg
V0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUgaW1wbGllZCB3YXJyYW50eSBv
Zg0KPiA+ICsgKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1IgQSBQQVJUSUNVTEFSIFBV
UlBPU0UuwqDCoFNlZSB0aGUNCj4gPiArICogR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9y
IG1vcmUgZGV0YWlscy4NCj4gTm8gbmVlZCBmb3IgdGhpcyB0ZXh0IGFzIHlvdSBhcmUgdXNpbmcg
U1BEWCB0YWcuDQo+IA0KPiA+IA0KPiA+ICtzdGF0aWMgaW50IGNvbG9yX2Zvcm1hdF9mcm9tX2Rz
aV9mb3JtYXQoZW51bSBtaXBpX2RzaV9waXhlbF9mb3JtYXQNCj4gPiBmb3JtYXQpDQo+ID4gK3sN
Cj4gPiArwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGZvcm1hdCkgew0KPiA+ICvCoMKgwqDCoMKgwqDC
oGNhc2UgTUlQSV9EU0lfRk1UX1JHQjU2NToNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgcmV0dXJuIDB4NTU7DQo+ID4gK8KgwqDCoMKgwqDCoMKgY2FzZSBNSVBJX0RTSV9GTVRf
UkdCNjY2Og0KPiA+ICvCoMKgwqDCoMKgwqDCoGNhc2UgTUlQSV9EU0lfRk1UX1JHQjY2Nl9QQUNL
RUQ6DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiAweDY2Ow0KPiA+
ICvCoMKgwqDCoMKgwqDCoGNhc2UgTUlQSV9EU0lfRk1UX1JHQjg4ODoNCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIDB4Nzc7DQo+IENvdWxkIHlvdSB1c2UgZGVmaW5l
cyBmb3IgdGhlc2UgbWFnaWMgMHg1NSwgMHg2NiBhbmQgMHg3NyBudW1iZXJzPw0KVGhvc2UgbWFn
aWMgbnVtYmVycyBtZWFuIGV4YWN0bHkgd2hhdCB0aGVpciBjYXNlIHN0YXRlbWVudHMgYXJlLiBU
aGV5DQpjb21lIGZyb20gdGhlIHBhbmVsIGRvY3VtZW50YXRpb24uIEkgdGhvdWdodCB0aGF0IHRo
ZSBhbHJlYWR5IGV4aXN0aW5nDQpkZWZpbmVzIChNSVBJX0RTSV9GTVRfKSBhcmUgc2VsZiBleHBs
YW5hdG9yeSBoZXJlLCBzbyB1c2luZyBkZWZpbmVzDQpzZWVtZWQgcmVkdW5kYW50IGZvciBtZS4g
QnV0LCBpZiB5b3UgdGhpbmsgdGhhdCB1c2luZyBkZWZpbmVzIGZvciB0aGVtDQppcyBiZXR0ZXIs
IEkgY2FuIGRvIHRoYXQuDQo+IA0KPiA+IA0KPiA+ICtzdGF0aWMgaW50IHJhZF9wYW5lbF9wcmVw
YXJlKHN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKg
c3RydWN0IHJhZF9wYW5lbCAqcmFkID0gdG9fcmFkX3BhbmVsKHBhbmVsKTsNCj4gPiArDQo+ID4g
K8KgwqDCoMKgwqDCoMKgaWYgKHJhZC0+cHJlcGFyZWQpDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoHJldHVybiAwOw0KPiA+ICsNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmFk
LT5yZXNldCkgew0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBncGlvZF9zZXRf
dmFsdWUocmFkLT5yZXNldCwgMCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHVzbGVlcF9yYW5nZSg1MDAwLCAxMDAwMCk7DQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGdwaW9kX3NldF92YWx1ZShyYWQtPnJlc2V0LCAxKTsNCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgdXNsZWVwX3JhbmdlKDIwMDAwLCAyNTAwMCk7DQo+IFRoaXMgZG9l
cyBub3QgbG9vayBjb3JyZWN0Lg0KPiANCj4gVGhlIGNvcnJlY3Qgd2F5IHRvIGRvIGEgcmVzZXQg
d2l0aCBncGlvZCBBUEkgaXM6DQo+IA0KPiDCoGdwaW9kX3NldF92YWx1ZShyYWQtPnJlc2V0LCAx
KTsNCj4gDQo+IGRlbGF5DQo+IA0KPiBncGlvZF9zZXRfdmFsdWUocmFkLT5yZXNldCwgMCk7DQo+
IA0KPiBJIGRvbid0IGhhdmUgdGhlIGRhdGFzaGVldCBmb3IgdGhlIFJNNjcxOTEgcGFuZWwsIGJ1
dCBJIGFzc3VtZSB0aGUNCj4gcmVzZXQgR1BJTyBpcyBhY3RpdmUgbG93Lg0KPiANCj4gU2luY2Ug
eW91IGludmVydGVkIHRoZSBwb2xhcml0eSBpbiB0aGUgZHRzIGFuZCBpbnNpZGUgdGhlIGRyaXZl
ciwgeW91DQo+IGdvdCBpdCByaWdodCBieSBhY2NpZGVudC4NClRoZSBHUElPIGlzIGFjdGl2ZSBo
aWdoLCBhbmQgdGhlIGFib3ZlIHNlcXVlbmNlIHdhcyByZWNlaXZlZCBmcm9tIHRoZQ0KcGFuZWwg
dmVuZG9yIGluIHRoZSBmb2xsb3dpbmcgZm9ybToNCglTRVRfUkVTRVRfUElOKDEpOw0KCU1ERUxB
WSgxMCk7DQoJU0VUX1JFU0VUX1BJTigwKTsNCglNREVMQVkoNSk7DQoJU0VUX1JFU0VUX1BJTigx
KTsNCglNREVMQVkoMjApOw0KSSBnb3QgcmlkIG9mIHRoZSBmaXJzdCB0cmFuc2l0aW9uIHRvIGhp
Z2ggc2luY2Ugc2VlbWVkIHJlZHVuZGFudC4NCkFsc28sIGFjY29yZGluZyB0byB0aGUgbWFudWFs
IHJlZmVyZW5jZSwgdGhlIFJTVEIgcGluIG5lZWRzIHRvIGJlDQphY3RpdmUgaGlnaCB3aGlsZSBv
cGVyYXRpbmcgdGhlIGRpc3BsYXkuDQo+IA0KPiBZb3UgY291bGQgYWxzbyBjb25zaWRlciB1c2lu
ZyBncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoKSB2YXJpYW50DQo+IGluc3RlYWQgYmVjYXVzZSB0
aGUgR1BJTyByZXNldCBjb3VsZCBiZSBwcm92aWRlZCBieSBhbiBJMkMgR1BJTw0KPiBleHBhbmRl
ciwgZm9yIGV4YW1wbGUuDQpUaGFua3MsIHdpbGwgdXNlIHRoaXMgaW4gdGhlIG5leHQgcmV2aXNp
b24uDQo+IA0KPiBBbHNvLCB3aGVuIHNsZWVwaW5nIGZvciBtb3JlIHRoYW4gMTBtcywgbXNsZWVw
IGlzIGEgYmV0dGVyIGZpdCBhcyBwZXINCj4gRG9jdW1lbnRhdGlvbi90aW1lcnMvdGltZXJzLWhv
d3RvLnR4dC4NCk9LLCBJIHdpbGwgdXNlIG1zbGVlcC4gVGhhdCBkb2N1bWVudGF0aW9uIHJlY29t
bWVuZHMgdXNpbmcgdXNsZWVwX3JhbmdlDQpmb3Igc2xlZXBzIDwyMG0sIGJ1dCBhbHNvIHVzaW5n
IG1zbGVlcCBmb3IgPjEwbXMgKHNvIEkgZm9sbG93ZWQgdGhlDQpyZWNvbWVuZGF0aW9ucyBmcm9t
IHVzbGVlcF9yYW5nZSkNCj4gDQo+ID4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJhZC0+cmVz
ZXQpIHsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZ3Bpb2Rfc2V0X3ZhbHVl
KHJhZC0+cmVzZXQsIDApOw0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1c2xl
ZXBfcmFuZ2UoMTUwMDAsIDE3MDAwKTsNCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgZ3Bpb2Rfc2V0X3ZhbHVlKHJhZC0+cmVzZXQsIDEpOw0KPiA+ICvCoMKgwqDCoMKgwqDCoH0N
Cj4gQW5vdGhlciByZXNldD8NClllcy4gVGhpcyBpcyB0cmlja3ksIHNpbmNlIHRoaXMgR1BJTyBp
cyBzaGFyZWQgYmV0d2VlbiB0aGUgRFNJDQpjb250cm9sbGVyIGFuZCB0b3VjaCBjb250cm9sbGVy
LiBUaGUgQW5kcm9pZCBndXlzIG5lZWRzIHRoZSB0b3VjaA0KY29udHJvbGxlciB0byBiZSBhY3Rp
dmUsIHdoaWxlIHRoZSBkaXNwbGF5IGNhbiBiZSB0dXJuZWQgb2ZmLiBTbyB0aGlzDQppcyB3aHks
IGFmdGVyIHRoZSBkaXNwbGF5IGlzIHR1cm5lZCBvZmYsIHRoZSByZXNldCBwaW4gaXMgcHV0IGJh
Y2sgdG8NCkhJR0ggaW4gb3JkZXIgdG8ga2VlcCB0aGUgdG91Y2ggd29ya2luZy4NCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
