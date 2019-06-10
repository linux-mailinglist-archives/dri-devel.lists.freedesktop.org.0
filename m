Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA63B5FC
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2019 15:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891C98914F;
	Mon, 10 Jun 2019 13:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760040.outbound.protection.outlook.com [40.107.76.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6179E8914F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jun 2019 13:28:58 +0000 (UTC)
Received: from BYAPR12MB3607.namprd12.prod.outlook.com (20.178.197.29) by
 BYAPR12MB3493.namprd12.prod.outlook.com (20.178.196.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 10 Jun 2019 13:28:53 +0000
Received: from BYAPR12MB3607.namprd12.prod.outlook.com
 ([fe80::c01b:198b:3529:855]) by BYAPR12MB3607.namprd12.prod.outlook.com
 ([fe80::c01b:198b:3529:855%7]) with mapi id 15.20.1965.017; Mon, 10 Jun 2019
 13:28:52 +0000
From: "Zhang, Dingchen (David)" <Dingchen.Zhang@amd.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH] drm: remove the newline for CRC source name.
Thread-Topic: [PATCH] drm: remove the newline for CRC source name.
Thread-Index: AQHVHXvz+CRXRtn0k0mz2aLpO2MM6aaRp1gAgAM97+A=
Date: Mon, 10 Jun 2019 13:28:52 +0000
Message-ID: <BYAPR12MB3607813DE48B1FA59B56E9F88D130@BYAPR12MB3607.namprd12.prod.outlook.com>
References: <20190607213817.11767-1-dingchen.zhang@amd.com>
 <20190608115608.GA15120@ravnborg.org>
In-Reply-To: <20190608115608.GA15120@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9cccbe12-bdaf-49ca-4501-08d6eda794af
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3493; 
x-ms-traffictypediagnostic: BYAPR12MB3493:
x-microsoft-antispam-prvs: <BYAPR12MB3493A86255967F902CAC59CB8D130@BYAPR12MB3493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0064B3273C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(376002)(396003)(346002)(366004)(13464003)(199004)(189003)(51914003)(478600001)(55016002)(76176011)(229853002)(26005)(33656002)(68736007)(3846002)(6116002)(186003)(9686003)(7696005)(72206003)(52536014)(54906003)(99286004)(53546011)(14454004)(66066001)(102836004)(6506007)(6436002)(53936002)(2906002)(71190400001)(71200400001)(6246003)(14444005)(7736002)(4326008)(256004)(11346002)(446003)(476003)(305945005)(486006)(74316002)(25786009)(5660300002)(76116006)(86362001)(66446008)(64756008)(8676002)(6916009)(316002)(66556008)(66476007)(8936002)(73956011)(66946007)(81156014)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3493;
 H:BYAPR12MB3607.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V3fZUu9A1CQVmM3nJhF07A3Xt9+vTOeMFZCI64U/pC65vCWvd6ufKV1Mf0oSDGrBYW6tCo1s5aUzRlRAjPAoKVOk6J0IJNxvbs+r65ocRujlrMFG0wjCpuwnP7TzhDIzOuz1DtZNvxUyOz43OPpzwdOatsu6RtTtpovShzQTyU51dTeZ3k6Tm9gyr4rc3f+c6G2OfQtVhGiaUrSp3NwrTNhklcEUC4yFzUdeJpwFvct0rCQLbiRchxhkxuraq2bUrBkeFqBgKMDkWvZVDF4KIHcrmoSU/x6t7DsaWZnLPbz6CU9sCppoK+FSjTyghzpHZ+qwcIAntngRkzX3M5KDijD11WCCoPL8IMM/sdmTN8M9jZlwYyrnPaI7gp0luYmS+92K9/gDHlQeVp8/RyN3T/vWuKaUMpkSGjsb9lvptVo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cccbe12-bdaf-49ca-4501-08d6eda794af
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2019 13:28:52.8210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dingzhan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3493
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R4jaQZDUvDDfF5a4NKQCQlUcQFocsggHsvSJCg6R3Ds=;
 b=Iu1Gud9mVpGjctZZ2kr+gBr1f598R4u6DrLSKE3g/lJC0v3ZH27Lh2/NG/hRfcMb5LQSu4EjHMv66wI05ocQdqbeZxlSugClMPA/bW0xxN5GHsa8yYEw+WWLpQQUonyoBqORf0jQpwF86mgZgW9VBg8Bk6dL7k2nkK4mrlnYQCw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Dingchen.Zhang@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKVGhhbmtzIGZvciB0aGUgZ29vZCBjYXRjaC4gQWN0dWFsbHkgaXQncyBhIHR5cG8g
aW4gZW1haWwgcmVwbHkuIEl0IHNob3VsZCBiZSAnbGVuIC0gMScuCgpSZWdhcmRzLAoKLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KRnJvbTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3Jn
PiAKU2VudDogU2F0dXJkYXksIEp1bmUgOCwgMjAxOSA3OjU2IEFNClRvOiBaaGFuZywgRGluZ2No
ZW4gKERhdmlkKSA8RGluZ2NoZW4uWmhhbmdAYW1kLmNvbT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IExpLCBTdW4gcGVuZyAoTGVvKSA8U3VucGVuZy5MaUBhbWQuY29tPjsg
V2VudGxhbmQsIEhhcnJ5IDxIYXJyeS5XZW50bGFuZEBhbWQuY29tPgpTdWJqZWN0OiBSZTogW1BB
VENIXSBkcm06IHJlbW92ZSB0aGUgbmV3bGluZSBmb3IgQ1JDIHNvdXJjZSBuYW1lLgoKSGkgRGlu
Z2NoZW4uCgpQYXRjaCBpcyBtdWNoIGJldHRlciBub3cuCgpPbiBGcmksIEp1biAwNywgMjAxOSBh
dCAwNTozODoxN1BNIC0wNDAwLCBEaW5nY2hlbiBaaGFuZyB3cm90ZToKPiB1c2Vyc3BhY2UgbWF5
IHRyYW5zZmVyIGEgbmV3bGluZSwgYW5kIHRoaXMgdGVybWluYXRpbmcgbmV3bGluZSBpcyAKPiBy
ZXBsYWNlZCBieSBhICdcMCcgdG8gYXZvaWQgZm9sbG93dXAgaXNzdWVzLgo+IAo+ICduLTEnIGlz
IHRoZSBpbmRleCB0byByZXBsYWNlIHRoZSBuZXdsaW5lIG9mIENSQyBzb3VyY2UgbmFtZS4KSSBh
bSBhIGxpdHRsZSBjb25mdXNlZCB3aGVyZSAnbicgY29tZXMgZnJvbSBoZXJlPwpJIHlvdSBoYWQg
d3JpdHRlbiAnIGxlbiAtIDEnIHRoZW4gdGhlcmUgd2FzIGEgY2xlYXIgY29ubmVjdGlvbiB0byB0
aGUgcGF0Y2guCgpXaXRoIHRoaXMgZml4ZWQ6ClJldmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNh
bUByYXZuYm9yZy5vcmc+Cj4gCj4gdjI6IHVwZGF0ZSBwYXRjaCBzdWJqZWN0LCBib2R5IGFuZCBm
b3JtYXQuIChTYW0pCj4gCj4gQ2M6IExlbyBMaSA8c3VucGVuZy5saUBhbWQuY29tPgo+IENjOiBI
YXJyeSBXZW50bGFuZCA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT4KPiBDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERpbmdjaGVuIFpoYW5nIDxkaW5n
Y2hlbi56aGFuZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNf
Y3JjLmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2Ny
Yy5jIAo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4gaW5kZXggNTg1MTY5
ZjBkY2M1Li5kYWMyNjdlODQwYWYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
ZWJ1Z2ZzX2NyYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzX2NyYy5jCj4g
QEAgLTEzMSw4ICsxMzEsOCBAQCBzdGF0aWMgc3NpemVfdCBjcmNfY29udHJvbF93cml0ZShzdHJ1
Y3QgZmlsZSAqZmlsZSwgY29uc3QgY2hhciBfX3VzZXIgKnVidWYsCj4gIAlpZiAoSVNfRVJSKHNv
dXJjZSkpCj4gIAkJcmV0dXJuIFBUUl9FUlIoc291cmNlKTsKPiAgCj4gLQlpZiAoc291cmNlW2xl
bl0gPT0gJ1xuJykKPiAtCQlzb3VyY2VbbGVuXSA9ICdcMCc7Cj4gKwlpZiAoc291cmNlW2xlbiAt
IDFdID09ICdcbicpCj4gKwkJc291cmNlW2xlbiAtIDFdID0gJ1wwJzsKPiAgCj4gIAlyZXQgPSBj
cnRjLT5mdW5jcy0+dmVyaWZ5X2NyY19zb3VyY2UoY3J0Yywgc291cmNlLCAmdmFsdWVzX2NudCk7
Cj4gIAlpZiAocmV0KQo+IC0tCj4gMi4xNy4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
