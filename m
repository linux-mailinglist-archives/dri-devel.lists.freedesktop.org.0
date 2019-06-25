Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9244652867
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 11:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1972589D02;
	Tue, 25 Jun 2019 09:44:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680060.outbound.protection.outlook.com [40.107.68.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFEE89D02;
 Tue, 25 Jun 2019 09:44:35 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1564.namprd12.prod.outlook.com (10.172.39.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 09:44:31 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 09:44:31 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>
Subject: Re: [PATCH libdrm 0/9] amdgpu:
Thread-Topic: [PATCH libdrm 0/9] amdgpu:
Thread-Index: AQHVKyxgzuilyrOrN0SRzpx8eIHJUqasHs2A
Date: Tue, 25 Jun 2019 09:44:31 +0000
Message-ID: <78d5a7c1-8534-7917-58bc-1827dff106c8@amd.com>
References: <20190624165406.13682-1-michel@daenzer.net>
 <b48aae10-c1db-b76b-ddde-9c0a47028633@gmail.com>
 <6e737397-9b3d-b66c-7948-59b5acdbca60@daenzer.net>
In-Reply-To: <6e737397-9b3d-b66c-7948-59b5acdbca60@daenzer.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::17) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e24f5c3-51d8-4e45-30f9-08d6f951b8c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1564; 
x-ms-traffictypediagnostic: DM5PR12MB1564:
x-microsoft-antispam-prvs: <DM5PR12MB1564F40FFCBA571EC44830FB83E30@DM5PR12MB1564.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(376002)(346002)(39860400002)(366004)(136003)(396003)(189003)(199004)(5660300002)(6436002)(2906002)(6916009)(6116002)(229853002)(6486002)(99286004)(52116002)(76176011)(31686004)(65826007)(316002)(305945005)(54906003)(58126008)(6246003)(7736002)(46003)(4326008)(25786009)(8936002)(81166006)(81156014)(8676002)(68736007)(64756008)(66556008)(66946007)(66476007)(66446008)(53936002)(65956001)(65806001)(386003)(6506007)(53546011)(186003)(73956011)(72206003)(476003)(486006)(36756003)(102836004)(478600001)(446003)(2616005)(11346002)(14454004)(64126003)(71190400001)(71200400001)(256004)(86362001)(6512007)(31696002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1564;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jgkeH2EfZVzz2SHZfW4FoUELB2BdLQyfqcvCUyVUJPhlTuVWPOeZqdKLtBjF8t4hNfwz0v5G077/b8G133SwZGK2KqSxHt4aov6BRMkddUxr5Ol2aGtZnUx5voKijlbxITZ/uArV+NhDwa2aGOnWTdMuiNdC32eScjuTGiuF1g9i5n9sNTEIxRceSq4948i48rA0U6kIhLiqYkk/n73AhEl24k/s57i8Vjxnd6TX96QtEAC50tq5pa6uNvxxuuLiFSbhRsqOohm5cBH4VkBEH0ZqllUWQpWbMWeKc9iit1/T0JNVnFK7zbdtWlXAO1Snrn3W4Z+1nF+7zf342Gf3Ukoecq5U1kYDK5TGOfBrTgalYO4cYCsV8q/mhI7im/EKZdHk5MZMXsjc6UAMwe1r3KRGB4wgDMZlZP3iFkQXZGc=
Content-ID: <E8F5B335B9ED824A9ED1117DD8C3548D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e24f5c3-51d8-4e45-30f9-08d6f951b8c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 09:44:31.0857 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1564
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qAnuXG1weI6FDzga+bQ17Lv8zSKA2nAWYACutTN7NPQ=;
 b=cYk1mE7xgxl5aZMyVNSRghaTNXFveCty75wR9xo1M0GutbpqguC/7OMWodfS10ugcpEuNozYxNxxPMJeIkK5AToHf6GG18VDtQO6Wb2WSPv4LS1VW/ySgotZAVjDE/2IuVB/8cAJb4+OjC3GkJFf+OxzyV68mn3J82zaMGm3/MU=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMTkgdW0gMTA6MDIgc2NocmllYiBNaWNoZWwgRMOkbnplcjoNCj4gT24gMjAxOS0w
Ni0yNCA3OjMxIHAubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6DQo+PiBQYXRjaGVzICMxIC0g
IzMgbG9vayBnb29kIHRvIG1lLCBidXQgSSdtIG5vdCBzdXJlIGlmIHRoZSByZXN0IGlzIHN1Y2gg
YQ0KPj4gZ29vZCBpZGVhLg0KPj4NCj4+IEJhc2ljYWxseSB5b3Ugbm90IG9ubHkgd2FudCB0byB1
c2UgdGhlIHNhbWUgRkQgZm9yIENTLCBidXQgYWxzbyBmb3INCj4+IGJhc2ljYWxseSBhbGwgYnVm
ZmVyIGZ1bmN0aW9ucyBhbmQgYXMgZmFyIGFzIEkgY2FuIHNlZSB3ZSBicmVhayB0aGF0IGhlcmUu
DQo+IEhvdyBzbz8gVGhlIGNvcmUgRkQgaXMgdXNlZCBmb3IgZXZlcnl0aGluZyBleGNlcHQgZmxp
bmsgYW5kDQo+IGFtZGdwdV9ib19oYW5kbGVfdHlwZV9rbXNfdXNlci4NCg0KSUlSQyBpbiB0aGUg
TWVzYSB3aW5zeXMgd2UgY29tcGFyZSB0aGUgYW1kZ3B1X2RldmljZSBhbmQgYW1kZ3B1X2JvIA0K
cG9pbnRlcnMgdG8gZmlndXJlIG91dCBpZiBhbiBvcGVuZWQgZGV2aWNlIG9yIGltcG9ydGVkIEJP
IGlzIHRoZSBzYW1lIGFzIA0Kb25lIHdlIGFscmVhZHkga25vdy4NCg0KV2l0aCB0aGlzIHBhdGNo
IHRoYXQgd29uJ3Qgd29yayBhbnkgbW9yZSBhbmQgZm9yIGV4YW1wbGUgT3BlbkdMIGFuZCANClZB
LUFQSSBjb3VsZCBwb3RlbnRpYWxseSB1c2Ugc2VwYXJhdGUgYW1kZ3B1X2JvIHBvaW50ZXJzIGZv
ciB0aGUgc2FtZSANCnVuZGVybHlpbmcgYnVmZmVyLiBUaGF0IGluIHR1cm4gd291bGQgYnJlYWsg
c3luY2hyb25pemF0aW9uLg0KDQpBZGRpdGlvbmFsIHRvIHRoYXQgd2UgcG90ZW50aWFsbHkgY291
bGQga2VlcCBhIGJ1bmNoIG9mIGZpbGUgZGVzY3JpcHRvcnMgDQphcm91bmQgd2hpY2ggd2UgZG9u
J3QgbmVjZXNzYXJ5IHdhbnQuIEluIG90aGVyIHdvcmRzIHdlIHByZXZpb3VzbHkgDQpjbG9zZWQg
dGhlIGV4dHJhIGZpbGUgZGVzY3JpcHRvcnMsIGJ1dCBub3cgd2Uga2VlcCB0aGVtIG9wZW4gYXMg
d2VsbC4gDQpCdXQgdGhhdCBzaG91bGQgcHJvYmFibHkgYmUgb25seSBhIG1pbm9yIHByb2JsZW0u
DQoNCj4+IEkgd291bGQgcmF0aGVyIGFkZCBhIG5ldyBmdW5jdGlvbiB0byBleHBvcnQgdGhlIEtN
UyBoYW5kbGUgZm9yIGEgY2VydGFpbg0KPj4gQk8vRkQgcGFpci4gRXhwb3J0aW5nIHRoZSBoYW5k
bGUgYmFzZWQgb24gYSB0eXBlIHdhcyBhbHNvIGxpa2UgdHJ5aW5nIHRvDQo+PiBzcXVlZXplIGEg
cm91bmQgcGlnIHRocm91Z2ggYSBzcXVhcmUgaG9sZSBpbiB0aGUgZmlyc3QgcGxhY2UuDQo+Pg0K
Pj4gS01TLCBmbGluayBhbmQgRE1BLWJ1ZiBmZCBhcmUgZnVuZGFtZW50YWxseSBkaWZmZXJlbnQg
YW5kIHNob3VsZG4ndCBiZQ0KPj4gaGFuZGxlZCBieSB0aGUgc2FtZSBmdW5jdGlvbiBpbiB0aGUg
Zmlyc3QgcGxhY2UuDQo+IEkgZG9uJ3QgcmVhbGx5IHNlZSB0aGUgcHJvYmxlbS4gcmFkZW9uc2kg
JiBSQURWIGFyZSB1c2luZw0KPiBhbWRncHVfYm9faGFuZGxlX3R5cGVfa21zIHRvIGdldCBoYW5k
bGVzIGZvciBjb21tYW5kIHN0cmVhbSBzdWJtaXNzaW9uLA0KPiBzbyB0aG9zZSBoYW5kbGVzIGhh
dmUgdG8gYmUgdmFsaWQgZm9yIHRoZSBjb3JlIEZELiBOb3cgdGhlcmUncw0KPiBhbWRncHVfYm9f
aGFuZGxlX3R5cGVfa21zX3VzZXIgdG8gZ2V0IGEgaGFuZGxlIHZhbGlkIGZvciB0aGUgRkQgcGFz
c2VkDQo+IHRvIGFtZGdwdV9kZXZpY2VfaW5pdGlhbGl6ZS4gQ2FuIHlvdSBkZXNjcmliZSBhIHNj
ZW5hcmlvIHdoZXJlIGEgaGFuZGxlDQo+IHZhbGlkIGZvciB5ZXQgYW5vdGhlciBmaWxlIGRlc2Ny
aXB0aW9uIGlzIG5lZWRlZD8NCg0KTm90IHlldCBhbm90aGVyIGZpbGUgZGVzY3JpcHRvciwgYnV0
IHRoZSB1bmRlcmx5aW5nIHByb2JsZW0gaGVyZSBzZWVtcyANCnRvIGJlIHRoYXQgd2UgZG9uJ3Qg
dGVsbCBsaWJkcm0gaW4gd2hpY2ggZG9tYWluL2ZpbGUgZGVzY3JpcHRvciB0aGUgS01TIA0Kc2hv
dWxkIGFjdHVhbGx5IGJlIHZhbGlkIGluLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
