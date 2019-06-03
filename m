Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D2033248
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 16:36:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE5289263;
	Mon,  3 Jun 2019 14:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr780055.outbound.protection.outlook.com [40.107.78.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72AD1890B0;
 Mon,  3 Jun 2019 14:36:43 +0000 (UTC)
Received: from MWHPR12MB1453.namprd12.prod.outlook.com (10.172.55.22) by
 MWHPR12MB1518.namprd12.prod.outlook.com (10.172.56.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 14:36:38 +0000
Received: from MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47]) by MWHPR12MB1453.namprd12.prod.outlook.com
 ([fe80::202b:98f2:9925:5d47%2]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 14:36:38 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
Thread-Topic: [PATCH] drm/sched: Fix make htmldocs warnings.
Thread-Index: AQHVFir7y5SoYvg/OUWWdh7nzY4lZ6aCTrkA//+9OwCAAHNEgIABRlwAgAXI3gCAAHizAA==
Date: Mon, 3 Jun 2019 14:36:38 +0000
Message-ID: <8450abdb-409a-ae0d-f23e-7b6e20e8428d@amd.com>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
 <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
 <20190529193615.GX21222@phenom.ffwll.local>
 <bc79d169-0768-9671-660f-ffe4ceee4b47@gmail.com>
 <20190603072434.GZ21222@phenom.ffwll.local>
In-Reply-To: <20190603072434.GZ21222@phenom.ffwll.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BL0PR1501CA0013.namprd15.prod.outlook.com
 (2603:10b6:207:17::26) To MWHPR12MB1453.namprd12.prod.outlook.com
 (2603:10b6:301:e::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2607:fea8:3edf:fe95:3dc5:3e3d:1f43:1d23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e8b810c-2534-45a9-56c5-08d6e830e2a8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR12MB1518; 
x-ms-traffictypediagnostic: MWHPR12MB1518:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <MWHPR12MB15184FA30A7CD9EE54BCE72CEA140@MWHPR12MB1518.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(136003)(376002)(39860400002)(346002)(366004)(199004)(189003)(966005)(305945005)(7736002)(8936002)(53936002)(14454004)(6246003)(81156014)(386003)(478600001)(81166006)(8676002)(6116002)(72206003)(31686004)(53546011)(46003)(446003)(476003)(11346002)(2616005)(486006)(14444005)(36756003)(52116002)(256004)(76176011)(2906002)(186003)(54906003)(71200400001)(6506007)(102836004)(71190400001)(99286004)(110136005)(6636002)(316002)(73956011)(66946007)(66574012)(66556008)(64756008)(66446008)(66476007)(25786009)(86362001)(31696002)(6486002)(68736007)(6306002)(6436002)(229853002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR12MB1518;
 H:MWHPR12MB1453.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1YB0rCf/3Rha3EBAmbL2JggJpq7XX2285q1b1rNm9X8ZFvyBG1IPf11icMbYZpWmHaCRUYO3UVYcfHtWjg/R8csd6i2ypI0qj3jeF3pkPSIRy/53muuBqnbzqIeMr3AN1RlwAcBh+skwR9V3o3LhESTZJL/UgMabmt3sqlLX7CatiVMqjN1ohzW3Z53/MjHMA47bzcvRmkiytx4Q2BV7oOGrx0VZyOAZys6AQcgvZpGCj4Id9/R6++n61hZP+uOvEcLiUNiMj3SmdERg3z1JW8bvP69dIV/EDEk8iPvmSm+X8pXrJTZDPpiFwfX67JFs6Z3VllkxDEtCyWzsSI1DPQxsw62UvWUmtXYk59qe1p9LuZYudV0EiRgn0g9P/RRbuY3fenSPQRg+4cHNH6ZEqpWbhpEHStg+kbY6pel82wE=
Content-ID: <A2C4BAECE80D884490DB2D812E00CBE8@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8b810c-2534-45a9-56c5-08d6e830e2a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 14:36:38.2164 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: agrodzov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1518
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tyBtD7KiFXwAPE1sR13CyaNetFwDpUsAa2WMQJMxVlQ=;
 b=0V4jsGYgJOJivT2Sqm5M1B/Vlhaves4le6EIbeFHhDLW8RB91CJKtcFZXI3fI5X6Y6MP7OBRCnXVX3C5HoKnv4qjynI3cfhvucwzI45oyd4D52fuNkl94q1ofAQagfZ8ZsdbEF+PcezOqMk11TYIvjbQQhKyuIlIoJBTHuk/rwc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Andrey.Grodzovsky@amd.com; 
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQpPbiA2LzMvMTkgMzoyNCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToNCj4gT24gVGh1LCBNYXkg
MzAsIDIwMTkgYXQgMDU6MDQ6MjBQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToNCj4+
IEFtIDI5LjA1LjE5IHVtIDIxOjM2IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4+PiBPbiBXZWQs
IE1heSAyOSwgMjAxOSBhdCAwNDo0Mzo0NVBNICswMDAwLCBHcm9kem92c2t5LCBBbmRyZXkgd3Jv
dGU6DQo+Pj4+IEkgZG9uJ3QsIHNvcnJ5Lg0KPj4+IFNob3VsZCB3ZSBmaXggdGhhdD8gU2VlbXMg
bGlrZSB5b3UgZG8gcGxlbnR5IG9mIHNjaGVkdWxlciBzdHVmZiwgc28gd291bGQNCj4+PiBtYWtl
IHNlbnNlIEkgZ3Vlc3MgLi4uDQo+PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPiBmb3IgdGhlIHBhdGNoLg0KPj4NCj4+IEFuZCArMSBmb3Ig
Z2l2aW5nIEFuZHJleSBjb21taXQgcmlnaHRzIHRvIGRybS1taXNjLW5leHQuDQo+IElmIEFuZHJl
eSBpcyBvbiBib2FyZCB0b28sIHBscyBmaWxlIGFuIGlzc3VlIHdpdGggdGhlIGxlZ2FjeSBzc2gg
YWNjb3VudA0KPiByZXF1ZXN0cyB0ZW1wbGF0ZSBoZXJlOg0KPiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvZnJlZWRlc2t0b3AvZnJlZWRlc2t0b3AvDQo+DQo+IEFuZCB0aGVuIHBpbmcg
b24gaXJjIG9yIGhlcmUgc28gZHJtLW1pc2MgZm9sa3MgY2FuIGFjayZmb3J3YXJkLg0KPiAtRGFu
aWVsDQoNCkhlcmUgaXMgdGhlIHRpY2tldCANCmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9y
Zy9mcmVlZGVza3RvcC9mcmVlZGVza3RvcC9pc3N1ZXMvMTUyDQoNCkFuZHJleQ0KDQoNCj4NCj4+
IENocmlzdGlhbi4NCj4+DQo+Pj4gLURhbmllbA0KPj4+DQo+Pj4+IEFuZHJleQ0KPj4+Pg0KPj4+
PiBPbiA1LzI5LzE5IDEyOjQyIFBNLCBBbGV4IERldWNoZXIgd3JvdGU6DQo+Pj4+PiBPbiBXZWQs
IE1heSAyOSwgMjAxOSBhdCAxMDoyOSBBTSBBbmRyZXkgR3JvZHpvdnNreQ0KPj4+Pj4gPGFuZHJl
eS5ncm9kem92c2t5QGFtZC5jb20+IHdyb3RlOg0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPg0KPj4+Pj4gUmV2aWV3ZWQt
Ynk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4+Pj4+DQo+Pj4+
PiBJJ2xsIHB1c2ggaXQgdG8gZHJtLW1pc2MgaW4gYSBtaW51dGUgdW5sZXNzIHlvdSBoYXZlIGNv
bW1pdCByaWdodHMuDQo+Pj4+Pg0KPj4+Pj4gQWxleA0KPj4+Pj4NCj4+Pj4+PiAtLS0NCj4+Pj4+
PiAgICAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9tYWluLmMgfCAyICsrDQo+Pj4+
Pj4gICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4+Pj4+Pg0KPj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyBiL2RyaXZl
cnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jDQo+Pj4+Pj4gaW5kZXggNDllN2QwNy4u
YzEwNThlZSAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYw0KPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRf
bWFpbi5jDQo+Pj4+Pj4gQEAgLTM1Myw2ICszNTMsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9zY2hl
ZF9pbmNyZWFzZV9rYXJtYSk7DQo+Pj4+Pj4gICAgICAqIGRybV9zY2hlZF9zdG9wIC0gc3RvcCB0
aGUgc2NoZWR1bGVyDQo+Pj4+Pj4gICAgICAqDQo+Pj4+Pj4gICAgICAqIEBzY2hlZDogc2NoZWR1
bGVyIGluc3RhbmNlDQo+Pj4+Pj4gKyAqIEBiYWQ6IGpvYiB3aGljaCBjYXVzZWQgdGhlIHRpbWUg
b3V0DQo+Pj4+Pj4gICAgICAqDQo+Pj4+Pj4gICAgICAqIFN0b3AgdGhlIHNjaGVkdWxlciBhbmQg
YWxzbyByZW1vdmVzIGFuZCBmcmVlcyBhbGwgY29tcGxldGVkIGpvYnMuDQo+Pj4+Pj4gICAgICAq
IE5vdGU6IGJhZCBqb2Igd2lsbCBub3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUgdXNlZCBsYXRl
ciBhbmQgc28gaXQncw0KPj4+Pj4+IEBAIC00MjIsNiArNDIzLDcgQEAgRVhQT1JUX1NZTUJPTChk
cm1fc2NoZWRfc3RvcCk7DQo+Pj4+Pj4gICAgICAqIGRybV9zY2hlZF9qb2JfcmVjb3ZlcnkgLSBy
ZWNvdmVyIGpvYnMgYWZ0ZXIgYSByZXNldA0KPj4+Pj4+ICAgICAgKg0KPj4+Pj4+ICAgICAgKiBA
c2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZQ0KPj4+Pj4+ICsgKiBAZnVsbF9yZWNvdmVyeTogcHJv
Y2VlZCB3aXRoIGNvbXBsZXRlIHNjaGVkIHJlc3RhcnQNCj4+Pj4+PiAgICAgICoNCj4+Pj4+PiAg
ICAgICovDQo+Pj4+Pj4gICAgIHZvaWQgZHJtX3NjaGVkX3N0YXJ0KHN0cnVjdCBkcm1fZ3B1X3Nj
aGVkdWxlciAqc2NoZWQsIGJvb2wgZnVsbF9yZWNvdmVyeSkNCj4+Pj4+PiAtLQ0KPj4+Pj4+IDIu
Ny40DQo+Pj4+Pj4NCj4+Pj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXw0KPj4+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+Pj4+PiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
