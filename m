Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3EAAA67
	for <lists+dri-devel@lfdr.de>; Thu,  5 Sep 2019 19:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E60E76E09F;
	Thu,  5 Sep 2019 17:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334436E09F
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2019 17:54:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2019 10:54:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,470,1559545200"; d="scan'208";a="212868189"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2019 10:54:30 -0700
Received: from fmsmsx153.amr.corp.intel.com (10.18.125.6) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 5 Sep 2019 10:54:30 -0700
Received: from fmsmsx117.amr.corp.intel.com ([169.254.3.91]) by
 FMSMSX153.amr.corp.intel.com ([169.254.9.165]) with mapi id 14.03.0439.000;
 Thu, 5 Sep 2019 10:54:30 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Srivatsa, Anusha" <anusha.srivatsa@intel.com>
Subject: Re: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Thread-Topic: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Thread-Index: AQHVX3OPaU9Y5vCPZkKjoiMa1/EfKKcd3F4A
Date: Thu, 5 Sep 2019 17:54:29 +0000
Message-ID: <d40591691d984579bd2a63f5d09ed9ef80e24176.camel@intel.com>
References: <20190830203251.3050-1-anusha.srivatsa@intel.com>
In-Reply-To: <20190830203251.3050-1-anusha.srivatsa@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.9.135]
Content-ID: <5BEA721B47930943B8DE5D93A614601D@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTMwIGF0IDEzOjMyIC0wNzAwLCBBbnVzaGEgU3JpdmF0c2Egd3JvdGU6
DQo+IEFkZCB0aGUgbmV3IENNTCBQQ0kgSURTLg0KPiANCj4gQWxpZ24gd2l0aCBrZXJuZWwgY29t
bWl0Og0KPiBiZmM0YzM1OWIyODIyICgiZHJtL2k5MTUvY21sOiBBZGQgTWlzc2luZyBQQ0kgSURz
IikNCj4gDQo+IFRoaXMgaXMgaW4gc3luYyB3aXRoIGtlcm5lbCBoZWFkZXIgYXMgb2Y6DQo+IDA3
NDc1OTAyNjdlNyAoImRybS10aXA6IDIwMTl5LTA4bS0zMGQtMThoLTAzbS0xOHMgVVRDIGludGVn
cmF0aW9uDQo+IG1hbmlmZXN0IikNCj4gDQoNClJldmlld2VkLWJ5OiBKb3PDqSBSb2JlcnRvIGRl
IFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4NCg0KPiBDYzogSm9zw6kgUm9iZXJ0byBkZSBT
b3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEFudXNoYSBTcml2
YXRzYSA8YW51c2hhLnNyaXZhdHNhQGludGVsLmNvbT4NCj4gLS0tDQo+ICBpbnRlbC9pOTE1X3Bj
aWlkcy5oIHwgNSArKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2ludGVsL2k5MTVfcGNpaWRzLmggYi9pbnRl
bC9pOTE1X3BjaWlkcy5oDQo+IGluZGV4IGE3MGM5ODJkLi5iMWY2NmIxMSAxMDA2NDQNCj4gLS0t
IGEvaW50ZWwvaTkxNV9wY2lpZHMuaA0KPiArKysgYi9pbnRlbC9pOTE1X3BjaWlkcy5oDQo+IEBA
IC00NjYsNyArNDY2LDEwIEBADQo+ICAJSU5URUxfVkdBX0RFVklDRSgweDlCQzUsIGluZm8pLCBc
DQo+ICAJSU5URUxfVkdBX0RFVklDRSgweDlCQzgsIGluZm8pLCBcDQo+ICAJSU5URUxfVkdBX0RF
VklDRSgweDlCQzQsIGluZm8pLCBcDQo+IC0JSU5URUxfVkdBX0RFVklDRSgweDlCQzIsIGluZm8p
DQo+ICsJSU5URUxfVkdBX0RFVklDRSgweDlCQzIsIGluZm8pLCBcDQo+ICsJSU5URUxfVkdBX0RF
VklDRSgweDlCQzYsIGluZm8pLCBcDQo+ICsJSU5URUxfVkdBX0RFVklDRSgweDlCRTYsIGluZm8p
LCBcDQo+ICsJSU5URUxfVkdBX0RFVklDRSgweDlCRjYsIGluZm8pDQo+ICANCj4gICNkZWZpbmUg
SU5URUxfS0JMX0lEUyhpbmZvKSBcDQo+ICAJSU5URUxfS0JMX0dUMV9JRFMoaW5mbyksIFwNCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
