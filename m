Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DCC4693B7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E107ABB0;
	Mon,  6 Dec 2021 10:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C266EA9B;
 Mon,  6 Dec 2021 04:29:35 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="217932010"
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; d="scan'208";a="217932010"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2021 20:29:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,290,1631602800"; d="scan'208";a="478986470"
Received: from irsmsx601.ger.corp.intel.com ([163.33.146.7])
 by orsmga002.jf.intel.com with ESMTP; 05 Dec 2021 20:29:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 irsmsx601.ger.corp.intel.com (163.33.146.7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Mon, 6 Dec 2021 04:29:32 +0000
Received: from fmsmsx611.amr.corp.intel.com ([10.18.126.91]) by
 fmsmsx611.amr.corp.intel.com ([10.18.126.91]) with mapi id 15.01.2308.020;
 Sun, 5 Dec 2021 20:29:30 -0800
From: "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [v3 0/3] Introduce Raptor Lake S
Thread-Topic: [v3 0/3] Introduce Raptor Lake S
Thread-Index: AQHX6BA7TyaThqfBrUy8DLSZw6jWPawhBdaAgAPddeA=
Date: Mon, 6 Dec 2021 04:29:30 +0000
Message-ID: <72998a361a854e59acdbe1ec2c75a0a2@intel.com>
References: <20211203063545.2254380-1-anusha.srivatsa@intel.com>
 <7576de4a-fbd9-ea5c-2d3d-1c5ada9f30e1@linux.intel.com>
In-Reply-To: <7576de4a-fbd9-ea5c-2d3d-1c5ada9f30e1@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
dlp-reaction: no-action
x-originating-ip: [10.223.10.1]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "Nikula,
 Jani" <jani.nikula@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJl
ciAzLCAyMDIxIDI6NTcgUE0NCj4gVG86IFNyaXZhdHNhLCBBbnVzaGEgPGFudXNoYS5zcml2YXRz
YUBpbnRlbC5jb20+OyBpbnRlbC0NCj4gZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzog
eDg2QGtlcm5lbC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IEluZ28gTW9s
bmFyDQo+IDxtaW5nb0ByZWRoYXQuY29tPjsgQm9yaXNsYXYgUGV0a292IDxicEBhbGllbjguZGU+
OyBEYXZlIEhhbnNlbg0KPiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPjsgSm9vbmFzIExh
aHRpbmVuDQo+IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgTmlrdWxhLCBKYW5p
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbdjMgMC8zXSBJbnRyb2R1
Y2UgUmFwdG9yIExha2UgUw0KPiANCj4gDQo+IE9uIDAzLzEyLzIwMjEgMDY6MzUsIEFudXNoYSBT
cml2YXRzYSB3cm90ZToNCj4gPiBSYXB0b3IgTGFrZSBTKFJQTC1TKSBpcyBhIHZlcnNpb24gMTIN
Cj4gPiBEaXNwbGF5LCBNZWRpYSBhbmQgUmVuZGVyLiBGb3IgYWxsIGk5MTUgcHVycG9zZXMgaXQg
aXMgdGhlIHNhbWUgYXMNCj4gPiBBbGRlciBMYWtlIFMgKEFETC1TKS4NCj4gPg0KPiA+IFRoZSBz
ZXJpZXMgaW50cm9kdWNlcyBpdCBhcyBhIHN1YnBsYXRmb3JtIG9mIEFETC1TLiBUaGUgb25lIGRp
ZmZlcmVuY2UNCj4gPiBpcyB0aGUgR3VDIHN1Ym1pc3Npb24gd2hpY2ggaXMgZGVmYXVsdCBvbiBS
UEwtUyBidXQgd2FzIG5vdCB0aGUgY2FzZQ0KPiA+IHdpdGggQURMLVMuDQo+IA0KPiBBcyBhIHNp
ZGUgbm90ZSwgbm90IGEgYmxvY2tlciBvZiBhbnkga2luZCwgSSBhbSBzbGlnaHRseSBkaXNoZWFy
dGVuZWQgYnV0IHRoZQ0KPiBjb25mdXNpb24gb2YgQURMX1AgYW5kIEFETF9TIGJlaW5nIHNlcGFy
YXRlIHBsYXRmb3JtcywgYnV0IHRoZW4gUlBMX1MgaXMNCj4gc3VicGxhdGZvcm0gb2YgQURMX1Mu
IE1heWJlIGl0IGlzIGp1c3QgbWUgbm90IGJlaW5nIGFibGUgdG8ga2VlcCB0cmFjayBvZg0KPiB0
aGluZ3MuDQo+IA0KPiA+IEFsbCBwYXRjaGVzIGFyZSByZXZpZXdlZC4gSmFuaSBoYXMgYWNrZWQg
dGhlIHNlcmllcy4NCj4gPiBMb29raW5nIGZvciBvdGhlciBhY2tzIGluIG9yZGVyIHRvIG1lcmdl
IHRoZXNlIHRvIHJlc3BlY3RpdmUgYnJhbmNoZXMuDQo+IA0KPiBXaGljaCBicmFuY2hlcyB3b3Vs
ZCB0aGF0IGJlIGZvciB0aGlzIHNlcmllcz8gRmlyc3QgdHdvIHRvIGRybS1pbnRlbC1uZXh0IGFu
ZA0KPiBsYXN0IG9uZSB0byBkcm0taW50ZWwtZ3QtbmV4dD8gSXMgdGhhdCBjb21wbGljYXRpb24g
bmVlZGVkIGFuZC9vciB3b3J0aCB0aGUNCj4gZWZmb3J0Pw0KDQpUdnJ0a28sDQogQWxsIHRocmVl
IGhhdmUgdG8gbGFuZCB0byBkcm0taW50ZWwtbmV4dC4gVGhlIGxhc3Qgb25lIGhhcyBkZXBlbmRl
bmN5IG9uIHRoZSBmaXJzdCBwYXRjaCBhbmQgaXMgYSB0cml2aWFsIGNoYW5nZS4NCg0KQW51c2hh
DQo+IFJlZ2FyZHMsDQo+IA0KPiBUdnJ0a28NCj4gDQo+ID4gQ2M6IHg4NkBrZXJuZWwub3JnDQo+
ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBDYzogSW5nbyBNb2xu
YXIgPG1pbmdvQHJlZGhhdC5jb20+DQo+ID4gQ2M6IEJvcmlzbGF2IFBldGtvdiA8YnBAYWxpZW44
LmRlPg0KPiA+IENjOiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPg0K
PiA+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+
DQo+ID4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+
DQo+ID4gQWNrZWQtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4N
Cj4gPiBBbnVzaGEgU3JpdmF0c2EgKDMpOg0KPiA+ICAgIGRybS9pOTE1L3JwbC1zOiBBZGQgUENJ
IElEUyBmb3IgUmFwdG9yIExha2UgUw0KPiA+ICAgIGRybS9pOTE1L3JwbC1zOiBBZGQgUENIIFN1
cHBvcnQgZm9yIFJhcHRvciBMYWtlIFMNCj4gPiAgICBkcm0vaTkxNS9ycGwtczogRW5hYmxlIGd1
YyBzdWJtaXNzaW9uIGJ5IGRlZmF1bHQNCj4gPg0KPiA+ICAgYXJjaC94ODYva2VybmVsL2Vhcmx5
LXF1aXJrcy5jICAgICAgICAgICB8IDEgKw0KPiA+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
dWMvaW50ZWxfdWMuYyAgICB8IDIgKy0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVf
ZHJ2LmggICAgICAgICAgfCAyICsrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X3Bj
aS5jICAgICAgICAgIHwgMSArDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kZXZp
Y2VfaW5mby5jIHwgNyArKysrKysrDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9k
ZXZpY2VfaW5mby5oIHwgMyArKysNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3Bj
aC5jICAgICAgICAgfCAxICsNCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3BjaC5o
ICAgICAgICAgfCAxICsNCj4gPiAgIGluY2x1ZGUvZHJtL2k5MTVfcGNpaWRzLmggICAgICAgICAg
ICAgICAgfCA5ICsrKysrKysrKw0KPiA+ICAgOSBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCg==
