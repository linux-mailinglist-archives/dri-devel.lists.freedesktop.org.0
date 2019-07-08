Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E62661A35
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 06:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012D8899AB;
	Mon,  8 Jul 2019 04:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30059.outbound.protection.outlook.com [40.107.3.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9E1899AB
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2019 04:57:21 +0000 (UTC)
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com (10.255.159.31) by
 VE1PR08MB5085.eurprd08.prod.outlook.com (20.179.29.207) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Mon, 8 Jul 2019 04:57:18 +0000
Received: from VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1]) by VE1PR08MB5006.eurprd08.prod.outlook.com
 ([fe80::4062:a380:35ba:11d1%3]) with mapi id 15.20.2032.019; Mon, 8 Jul 2019
 04:57:18 +0000
From: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH 5/5] RFC: MAINTAINERS: maintain drm/arm drivers in
 drm-misc for now
Thread-Topic: [PATCH 5/5] RFC: MAINTAINERS: maintain drm/arm drivers in
 drm-misc for now
Thread-Index: AQHVMyqcvIF/2A6ugk2LiDeWhzr5p6a8DN+AgAQf/YA=
Date: Mon, 8 Jul 2019 04:57:17 +0000
Message-ID: <20190708045709.GA31540@jamwan02-TSP300>
References: <20190705121006.26085-1-daniel.vetter@ffwll.ch>
 <20190705121006.26085-5-daniel.vetter@ffwll.ch>
 <20190705135736.GK17204@e110455-lin.cambridge.arm.com>
In-Reply-To: <20190705135736.GK17204@e110455-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-originating-ip: [113.29.88.7]
x-clientproxiedby: HK2PR03CA0064.apcprd03.prod.outlook.com
 (2603:1096:202:17::34) To VE1PR08MB5006.eurprd08.prod.outlook.com
 (2603:10a6:803:113::31)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d61257f9-e5aa-4322-d110-08d70360c018
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR08MB5085; 
x-ms-traffictypediagnostic: VE1PR08MB5085:
x-microsoft-antispam-prvs: <VE1PR08MB5085DC1E7F197CFACC4B7233B3F60@VE1PR08MB5085.eurprd08.prod.outlook.com>
nodisclaimer: True
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00922518D8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(7916004)(346002)(376002)(396003)(39850400004)(136003)(366004)(199004)(189003)(33716001)(71190400001)(66446008)(64756008)(66556008)(66476007)(33656002)(71200400001)(66946007)(73956011)(66066001)(86362001)(5660300002)(6512007)(9686003)(6636002)(1076003)(6486002)(478600001)(486006)(305945005)(11346002)(446003)(476003)(7736002)(6436002)(53936002)(68736007)(6862004)(8936002)(6116002)(3846002)(81166006)(25786009)(229853002)(8676002)(4326008)(81156014)(14454004)(55236004)(102836004)(52116002)(6506007)(256004)(2906002)(58126008)(26005)(386003)(76176011)(54906003)(99286004)(186003)(316002)(6246003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR08MB5085;
 H:VE1PR08MB5006.eurprd08.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K08eX2/WGqnMTYcZHHJQ0+nOvCFQ/0Gfsf/4wAhnNAgIWWsBjIusCe+kCVJsbFDrugOvPcTCuTCrcd0gqJoaXp0wshjmzsylfpOumfEZQwpWK5dI3Zsl6ZCZfnX28o7PL47xdZp++bfcx3EhDhQ4t7uMGjagndNK8t0aHIySvOIbIiufmV0ey6+mKxzZ942bqVUzOLyt8M/gSxCkMvtl/CyA//wnKjV86Mq2e0p6F5uYt3g2APALG5uXkKHfGDt/bTxJci/EhfwjeEcjB6i51pXQwO3bOdY5acMMosaShsxnzqr2fuI/XTNspNH02tER0+9vn1XLJoXh5nOw7QjDu81L6IZyAn40zDLdvaKBzCvtulBFY59JdaRCwirlf0iQMszGWlj6zsRlGEShNVHcWEJTxQ0kjMAmxt9s7jnUmH0=
Content-ID: <F1DE5EB01C980440B9E657CA1F59879B@eurprd08.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61257f9-e5aa-4322-d110-08d70360c018
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2019 04:57:18.2303 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: james.qian.wang@arm.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5085
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xETgyghj/+xAF3b4hlZ3x9Ea6uBCDeRyd3K6B3x+hSY=;
 b=H/bUt0XX0V9sn8ZxNL5nlQGEtumK+5hJH9HoSY+urCgALwViAzYNuXZ1aSFJgnC32j8mZHdr5JqZ0tCUvKsg55dP3ELHnbG7VC5SrVuKCVywDwudkEuwOvuI9T2BWqF2Qe0rsKJUeoRNKBtm4qwob5ypzAb5Eun/WOQ1L+CG7E0=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=james.qian.wang@arm.com; 
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
Cc: nd <nd@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mali DP Maintainers <malidp@foss.arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6NTc6MzdQTSArMDgwMCwgTGl2aXUgRHVkYXUgd3Jv
dGU6DQo+IE9uIEZyaSwgSnVsIDA1LCAyMDE5IGF0IDAyOjEwOjA2UE0gKzAyMDAsIERhbmllbCBW
ZXR0ZXIgd3JvdGU6DQo+ID4gRnJvbSBkaXNjdXNzaW9ucyB3aXRoIExpdml1IGl0IHNvdW5kZWQg
bGlrZSB0aGUga29tZWRhIHRlYW0gd291bGQNCj4gPiBiZW5lZml0IGEgYml0IGZyb20gbW9yZSBj
cm9zcy1yZXZpZXcgd2l0aCBvdGhlciBkcml2ZXJzLiBUbyBtYWtlIHN1cmUNCj4gPiBrb21lZGEg
aXMgYWxpZ25lZCB3aXRoIGhvdyBzaW1pbGFyIHByb2JsZW1zIGFyZSBzb2x2ZWQgaW4gb3RoZXIN
Cj4gPiBkcml2ZXJzIChpbiB0aGUgZW5kIGV2ZXJ5b25lIGVuZHMgdXAgd2l0aCBzaW1pbGFyIGlk
ZWFzIG9uIGhvdyB0bw0KPiA+IHNvbHZlIHZhcmlvdXMgZGlzcGxheSBlbmdpbmUgZGVzaWduIGlz
c3VlcykuDQo+ID4gDQo+ID4gQW4gb3B0aW9uIHdvdWxkIGJlIHRvIHVzZSBkcm0tbWlzYyBhcyBh
biBpbmN1YmF0b3IgZm9yIGEgZmV3IGtlcm5lbA0KPiA+IHJlbGVhc2VzLCBhdCBsZWFzdCB1bnRp
bCB0aGUgYmlnIGRlc2lnbiBpdGVtcyBoYXZlIGJlZW4gdGFja2xlZDogQXNpZGUNCj4gPiBmcm9t
IHRoZSBmb3VyIGttcyBwcm9wZXJ0aWVzIGFscmVhZHkgbGFuZGVkIHRoYXQgd2UgbmVlZCB0byB0
YWtlIG91dA0KPiA+IGFnYWluIHRoZXJlJ3MgYWxzbyBhIHBpbGUgb2YgbmV3IG9uZXMgcHJvcG9z
ZWQgYWxyZWFkeSBmb3Iga29tZWRhLg0KPiA+IGRybS1taXNjIHNlZW1zIHRvIHdvcmsgZmFpcmx5
IHdlbGwgYXQgZW5jb3VyYWdpbmcgdGhlc2Uga2luZCBvZg0KPiA+IGNyb3NzLWRyaXZlciByZXZp
ZXdzIGFuZCB3b3JraW5nIG9uIGNyb3NzLWRyaXZlciBpbmZyYXN0cnVjdHVyZSBpbiBkcm0NCj4g
PiBjb3JlLiBMYXRlciBvbiB3ZSBjYW4gbW92ZSBhbGwgdGhlIGRyaXZlcnMgb3V0IHRvIGEgZGVk
aWNhdGVkIGFybSB0cmVlDQo+ID4gYWdhaW4gKGlmIHRoYXQncyBkZXNpcmVkKS4NCj4gPiANCj4g
PiBPZiBjb3VyZXMgdGhhdCB3b3VsZCBtZWFuIExvd3J5IGFuZCBKYW1lcyBuZWVkIGRybS1taXNj
IGNvbW1pdCByaWdodHMNCj4gPiAoYWxsIG90aGVyIGFybSBjb250cmlidXRvcnMgaGF2ZSBpdCBh
bHJlYWR5IEkgdGhpbmspLg0KPiA+IA0KPiA+IENjOiBMb3dyeSBMaSAoQXJtIFRlY2hub2xvZ3kg
Q2hpbmEpIDxsb3dyeS5saUBhcm0uY29tPg0KPiA+IENjOiBKYW1lcyBRaWFuIFdhbmcgKEFybSBU
ZWNobm9sb2d5IENoaW5hKSA8amFtZXMucWlhbi53YW5nQGFybS5jb20+DQo+ID4gQ2M6IExpdml1
IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPg0KPiANCj4gQWNrZWQtYnk6IExpdml1IER1ZGF1
IDxsaXZpdS5kdWRhdUBhcm0uY29tPg0KDQpBY2tlZC1ieTogSmFtZXMgUWlhbiBXYW5nIChBcm0g
VGVjaG5vbG9neSBDaGluYSkgPGphbWVzLnFpYW4ud2FuZ0Bhcm0uY29tPg0KDQo+ID4gQ2M6IE1h
bGkgRFAgTWFpbnRhaW5lcnMgPG1hbGlkcEBmb3NzLmFybS5jb20+DQo+ID4gQ2M6IEJyaWFuIFN0
YXJrZXkgPGJyaWFuLnN0YXJrZXlAYXJtLmNvbT4NCj4gPiBDYzogRGF2ZSBBaXJsaWUgPGFpcmxp
ZWRAcmVkaGF0LmNvbT4NCj4gPiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4NCj4gPiBDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFy
ZEBib290bGluLmNvbT4NCj4gPiBDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+DQo+ID4g
U2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+
ID4gLS0tDQo+ID4gIE1BSU5UQUlORVJTIHwgNCArKy0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gDQo+ID4gZGlmZiAtLWdpdCBhL01B
SU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiBpbmRleCBkMTE5ZDUzZTQ4ZGUuLmE1MzE5ZWRk
Y2VlMSAxMDA2NDQNCj4gPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiA+ICsrKyBiL01BSU5UQUlORVJT
DQo+ID4gQEAgLTEyMDMsNyArMTIwMyw3IEBAIE06CUphbWVzIChRaWFuKSBXYW5nIDxqYW1lcy5x
aWFuLndhbmdAYXJtLmNvbT4NCj4gPiAgTToJTGl2aXUgRHVkYXUgPGxpdml1LmR1ZGF1QGFybS5j
b20+DQo+ID4gIEw6CU1hbGkgRFAgTWFpbnRhaW5lcnMgPG1hbGlkcEBmb3NzLmFybS5jb20+DQo+
ID4gIFM6CVN1cHBvcnRlZA0KPiA+IC1UOglnaXQgZ2l0Oi8vbGludXgtYXJtLm9yZy9saW51eC1s
ZC5naXQgZm9yLXVwc3RyZWFtL21hbGktZHANCj4gPiArVDoJZ2l0IGdpdDovL2Fub25naXQuZnJl
ZWRlc2t0b3Aub3JnL2RybS9kcm0tbWlzYw0KPiA+ICBGOglkcml2ZXJzL2dwdS9kcm0vYXJtL2Rp
c3BsYXkvaW5jbHVkZS8NCj4gPiAgRjoJZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS8NCj4gPiAgRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYXJt
LGtvbWVkYS50eHQNCj4gPiBAQCAtMTIxNCw3ICsxMjE0LDcgQEAgTToJTGl2aXUgRHVkYXUgPGxp
dml1LmR1ZGF1QGFybS5jb20+DQo+ID4gIE06CUJyaWFuIFN0YXJrZXkgPGJyaWFuLnN0YXJrZXlA
YXJtLmNvbT4NCj4gPiAgTDoJTWFsaSBEUCBNYWludGFpbmVycyA8bWFsaWRwQGZvc3MuYXJtLmNv
bT4NCj4gPiAgUzoJU3VwcG9ydGVkDQo+ID4gLVQ6CWdpdCBnaXQ6Ly9saW51eC1hcm0ub3JnL2xp
bnV4LWxkLmdpdCBmb3ItdXBzdHJlYW0vbWFsaS1kcA0KPiA+ICtUOglnaXQgZ2l0Oi8vYW5vbmdp
dC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjDQo+ID4gIEY6CWRyaXZlcnMvZ3B1L2RybS9h
cm0vDQo+ID4gIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Fy
bSxtYWxpZHAudHh0DQo+ID4gIEY6CURvY3VtZW50YXRpb24vZ3B1L2FmYmMucnN0DQo+ID4gLS0g
DQo+ID4gMi4yMC4xDQo+ID4gDQo+IA0KPiAtLSANCj4gPT09PT09PT09PT09PT09PT09PT0NCj4g
fCBJIHdvdWxkIGxpa2UgdG8gfA0KPiB8IGZpeCB0aGUgd29ybGQsICB8DQo+IHwgYnV0IHRoZXkn
cmUgbm90IHwNCj4gfCBnaXZpbmcgbWUgdGhlICAgfA0KPiAgXCBzb3VyY2UgY29kZSEgIC8NCj4g
ICAtLS0tLS0tLS0tLS0tLS0NCj4gICAgIMKvXF8o44OEKV8vwq8NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
