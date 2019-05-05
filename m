Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D38FB13C7C
	for <lists+dri-devel@lfdr.de>; Sun,  5 May 2019 03:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9EA9893A4;
	Sun,  5 May 2019 01:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710051.outbound.protection.outlook.com [40.107.71.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EF48935C;
 Sun,  5 May 2019 01:07:57 +0000 (UTC)
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB2926.namprd12.prod.outlook.com (20.179.81.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Sun, 5 May 2019 01:07:52 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::c93d:cf5d:3f72:aff6%2]) with mapi id 15.20.1856.012; Sun, 5 May 2019
 01:07:52 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Andrea Righi <andrea.righi@canonical.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/amd/powerplay: remove spurious semicolon
Thread-Topic: [PATCH] drm/amd/powerplay: remove spurious semicolon
Thread-Index: AQHVAdEKQ51jUGmH00WSfzevZzq9P6ZbuNkQ
Date: Sun, 5 May 2019 01:07:51 +0000
Message-ID: <MN2PR12MB33445E9A79721CB1D990835AE4370@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20190503165535.GA30964@xps-13>
In-Reply-To: <20190503165535.GA30964@xps-13>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [210.13.97.164]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d02e8d07-92ec-449c-5556-08d6d0f6191b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2926; 
x-ms-traffictypediagnostic: MN2PR12MB2926:
x-microsoft-antispam-prvs: <MN2PR12MB29265CF11616C298AACF74C7E4370@MN2PR12MB2926.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:243;
x-forefront-prvs: 00286C0CA6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(366004)(376002)(39860400002)(13464003)(189003)(199004)(55016002)(52536014)(229853002)(72206003)(14454004)(68736007)(14444005)(256004)(7736002)(486006)(11346002)(446003)(81166006)(478600001)(53936002)(6436002)(4326008)(476003)(2906002)(6116002)(3846002)(54906003)(110136005)(25786009)(316002)(66066001)(9686003)(33656002)(6636002)(53546011)(8936002)(6246003)(74316002)(102836004)(186003)(6506007)(305945005)(81156014)(8676002)(26005)(99286004)(76176011)(7696005)(66446008)(66476007)(66556008)(64756008)(86362001)(76116006)(66946007)(73956011)(5660300002)(71190400001)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2926;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 0TDGos69B20hWmr7FI6oEU4zIVFlbMRSbGYLKXg/jCW8quQtCfVqSdcf9occcm3agWCKFFRs5GC9NJ9IdW+EhOmMez9HIALo/jkJ23+sDRTZTyJNVIIElffHT5DAGrde3buroKYWnYtAIocHdS1YRIzLY64SehdAaRDgdXYUX/HWDwEk63llc3SjPccQAB6auN91A99IHqZM+vYC6Lkeu9e7X6zIpSQHHkkcr0EZt2nPcXpwG1us4ziXChu9CzNr8DgMKBQL+zA03ZkhLN8SHV/VtR45ul86/hat86RQyvIHojnwAPyv9zVsP3NKPJEphBN/9ERsqC+HzC2IbnT2Wkr4mbnW9xGub4991Uie0pjzq3QvNxcZhHWjhOUWvSKesnmdOJdbA2H4QbOulNgpMCcuVdLMNyn7IeD2Xi2Z7eU=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02e8d07-92ec-449c-5556-08d6d0f6191b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2019 01:07:51.9536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2926
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=orZs3O3BaZQDmQRTYv4pic/RGzfv+FsAx+sQwymyu5o=;
 b=nBSFLaGgUoI4QZR5lwGu1ZyOzsrSsPV4lH/k/psHOpqjHoYejpqrxoPNvkwVEogahcFvZWcDSaXJPKx6m0RrSZmKBEMk4RFxuDrEEhwsuZuuQnZ+eXd+zZGugP+G5FyNhz593VE7BlceLqsqmVEnChVS46k1rEVrl7331oV1EYY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Wu, Hersen" <hersenxs.wu@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fu
b25pY2FsLmNvbT4NCj4gU2VudDogMjAxOeW5tDXmnIg05pelIDA6NTYNCj4gVG86IERldWNoZXIs
IEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFu
DQo+IDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBaaG91LCBEYXZpZChDaHVuTWluZykNCj4g
PERhdmlkMS5aaG91QGFtZC5jb20+DQo+IENjOiBSZXggWmh1IDxyZXguemh1QGFtZC5jb20+OyBX
dSwgSGVyc2VuIDxoZXJzZW54cy53dUBhbWQuY29tPjsNCj4gUXVhbiwgRXZhbiA8RXZhbi5RdWFu
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3Vi
amVjdDogW1BBVENIXSBkcm0vYW1kL3Bvd2VycGxheTogcmVtb3ZlIHNwdXJpb3VzIHNlbWljb2xv
bg0KPiANCj4gW0NBVVRJT046IEV4dGVybmFsIEVtYWlsXQ0KPiANCj4gUmVtb3ZlIHVubmVjZXNz
YXJ5IHNlbWljb2xvbnMgYXQgdGhlIGVuZCBvZiBsaW5lLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmVhIFJpZ2hpIDxhbmRyZWEucmlnaGlAY2Fub25pY2FsLmNvbT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMgICAgICAgICB8IDggKysr
Ky0tLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFu
YWdlci5jIHwgMiArLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBs
YXkvYW1kX3Bvd2VycGxheS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1k
X3Bvd2VycGxheS5jDQo+IGluZGV4IDNmNzNmN2NkMThiOS4uMTA1MmY1MTE5MDg3IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRfcG93ZXJwbGF5LmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvYW1kX3Bvd2VycGxheS5jDQo+IEBA
IC0xMzA0LDcgKzEzMDQsNyBAQCBzdGF0aWMgaW50IHBwX25vdGlmeV9zbXVfZW5hYmxlX3B3ZSh2
b2lkDQo+ICpoYW5kbGUpDQo+IA0KPiAgICAgICAgIGlmIChod21nci0+aHdtZ3JfZnVuYy0+c211
c19ub3RpZnlfcHdlID09IE5VTEwpIHsNCj4gICAgICAgICAgICAgICAgIHByX2luZm9fcmF0ZWxp
bWl0ZWQoIiVzIHdhcyBub3QgaW1wbGVtZW50ZWQuXG4iLCBfX2Z1bmNfXyk7DQo+IC0gICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDs7DQo+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4gICAgICAgICB9DQo+IA0KPiAgICAgICAgIG11dGV4X2xvY2soJmh3bWdyLT5zbXVfbG9j
ayk7DQo+IEBAIC0xMzQxLDcgKzEzNDEsNyBAQCBzdGF0aWMgaW50IHBwX3NldF9taW5fZGVlcF9z
bGVlcF9kY2VmY2xrKHZvaWQNCj4gKmhhbmRsZSwgdWludDMyX3QgY2xvY2spDQo+IA0KPiAgICAg
ICAgIGlmIChod21nci0+aHdtZ3JfZnVuYy0+c2V0X21pbl9kZWVwX3NsZWVwX2RjZWZjbGsgPT0g
TlVMTCkgew0KPiAgICAgICAgICAgICAgICAgcHJfZGVidWcoIiVzIHdhcyBub3QgaW1wbGVtZW50
ZWQuXG4iLCBfX2Z1bmNfXyk7DQo+IC0gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDs7DQo+
ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gICAgICAgICB9DQo+IA0KPiAgICAg
ICAgIG11dGV4X2xvY2soJmh3bWdyLT5zbXVfbG9jayk7DQo+IEBAIC0xMzYwLDcgKzEzNjAsNyBA
QCBzdGF0aWMgaW50IHBwX3NldF9oYXJkX21pbl9kY2VmY2xrX2J5X2ZyZXEodm9pZA0KPiAqaGFu
ZGxlLCB1aW50MzJfdCBjbG9jaykNCj4gDQo+ICAgICAgICAgaWYgKGh3bWdyLT5od21ncl9mdW5j
LT5zZXRfaGFyZF9taW5fZGNlZmNsa19ieV9mcmVxID09IE5VTEwpIHsNCj4gICAgICAgICAgICAg
ICAgIHByX2RlYnVnKCIlcyB3YXMgbm90IGltcGxlbWVudGVkLlxuIiwgX19mdW5jX18pOw0KPiAt
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Ow0KPiArICAgICAgICAgICAgICAgcmV0dXJu
IC1FSU5WQUw7DQo+ICAgICAgICAgfQ0KPiANCj4gICAgICAgICBtdXRleF9sb2NrKCZod21nci0+
c211X2xvY2spOw0KPiBAQCAtMTM3OSw3ICsxMzc5LDcgQEAgc3RhdGljIGludCBwcF9zZXRfaGFy
ZF9taW5fZmNsa19ieV9mcmVxKHZvaWQNCj4gKmhhbmRsZSwgdWludDMyX3QgY2xvY2spDQo+IA0K
PiAgICAgICAgIGlmIChod21nci0+aHdtZ3JfZnVuYy0+c2V0X2hhcmRfbWluX2ZjbGtfYnlfZnJl
cSA9PSBOVUxMKSB7DQo+ICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXMgd2FzIG5vdCBpbXBs
ZW1lbnRlZC5cbiIsIF9fZnVuY19fKTsNCj4gLSAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFM
OzsNCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiAgICAgICAgIH0NCj4gDQo+
ICAgICAgICAgbXV0ZXhfbG9jaygmaHdtZ3ItPnNtdV9sb2NrKTsNCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jDQo+IGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3IvaGFyZHdhcmVtYW5hZ2VyLmMNCj4g
aW5kZXggYzFjNTFjMTE1ZTU3Li43MGY3ZjQ3YTJmY2YgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL2hhcmR3YXJlbWFuYWdlci5jDQo+IEBA
IC03Niw3ICs3Niw3IEBAIGludCBwaG1fc2V0X3Bvd2VyX3N0YXRlKHN0cnVjdCBwcF9od21nciAq
aHdtZ3IsDQo+IGludCBwaG1fZW5hYmxlX2R5bmFtaWNfc3RhdGVfbWFuYWdlbWVudChzdHJ1Y3Qg
cHBfaHdtZ3IgKmh3bWdyKSAgew0KPiAgICAgICAgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gTlVMTDsNCj4gLSAgICAgICBpbnQgcmV0ID0gLUVJTlZBTDs7DQo+ICsgICAgICAgaW50IHJl
dCA9IC1FSU5WQUw7DQo+ICAgICAgICAgUEhNX0ZVTkNfQ0hFQ0soaHdtZ3IpOw0KPiAgICAgICAg
IGFkZXYgPSBod21nci0+YWRldjsNCj4gDQo+IC0tDQo+IDIuMjAuMQ0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
