Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE5C24C473
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 19:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0736E99D;
	Thu, 20 Aug 2020 17:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDB16E99D
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 17:25:13 +0000 (UTC)
IronPort-SDR: vrpvg9EhjJJcLJP1Wpp5o8n1dgL7VSuwd3NjPu3aDUEtSVsUCzdR10whf/9REpS3fxU/L5rJeT
 rrXkzAAjSlLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="156417716"
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; d="scan'208";a="156417716"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2020 10:24:56 -0700
IronPort-SDR: 27LC/iSRRMVhOkn5zUEpPkWc7ZN5fdPaRClSf8Yr38ybk/fYuN23DK8u5ov2zj3wCwE4OjhB3Q
 dl0NedN9+oYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,333,1592895600"; d="scan'208";a="280049094"
Received: from fmsmsx602-2.cps.intel.com (HELO fmsmsx602.amr.corp.intel.com)
 ([10.18.84.212])
 by fmsmga008.fm.intel.com with ESMTP; 20 Aug 2020 10:24:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 20 Aug 2020 10:24:55 -0700
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 20 Aug 2020 10:24:55 -0700
Received: from fmsmsx107.amr.corp.intel.com ([169.254.6.136]) by
 fmsmsx158.amr.corp.intel.com ([169.254.15.137]) with mapi id 14.03.0439.000;
 Thu, 20 Aug 2020 10:24:55 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "adam.miszczak@linux.intel.com" <adam.miszczak@linux.intel.com>
Subject: Re: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Thread-Topic: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Thread-Index: AQHWds7/4oVhXLMxMUKlBIMeVZCb6qlBthUA
Date: Thu, 20 Aug 2020 17:24:55 +0000
Message-ID: <81f5cd962f8474c275fd7062b651e1ef28d40b66.camel@intel.com>
References: <20200820084642.26562-1-adam.miszczak@linux.intel.com>
In-Reply-To: <20200820084642.26562-1-adam.miszczak@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.240.12]
Content-ID: <98A6D1FFC462AA4CA98B619E18FA5E45@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMDIwLTA4LTIwIGF0IDEwOjQ2ICswMjAwLCBBZGFtIE1pc3pjemFrIHdyb3RlOg0K
PiBBZGQgREcxIGFuZCBjbGVhbi11cCBWTFYgUENJIElEcy4NCj4gDQo+IEFsaWduIHdpdGgga2Vy
bmVsIGNvbW1pdHM6DQo+IGYyYmRlMjU0NmI4MSAoImRybS9pOTE1OiBSZW1vdmUgZHViaW91cyBW
YWxsZXl2aWV3IFBDSSBJRHMiKQ0KPiBmZDM4Y2RiODExMDUgKCJkcm0vaTkxNS9kZzE6IEFkZCBE
RzEgUENJIElEcyIpDQo+IA0KDQpSZXZpZXdlZC1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8
am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCkJ1dCB0aGUgY3VycmVudCBwcm9jZXNzIGZvciBsaWJk
cm0gcGF0Y2hlcyBpcyB0byBvcGVuIGEgbWVyZ2UgcmVxdWVzdCBpbiBGcmVlZGVza3RvcCBnaXRs
YWIsIHdoZW4geW91IGRvIENDIG1lLg0KDQo+IFNpZ25lZC1vZmYtYnk6IEFkYW0gTWlzemN6YWsg
PA0KPiBhZGFtLm1pc3pjemFrQGxpbnV4LmludGVsLmNvbQ0KPiA+DQo+IENjOiBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIDwNCj4gam9zZS5zb3V6YUBpbnRlbC5jb20NCj4gPg0KPiAtLS0NCj4gIGlu
dGVsL2k5MTVfcGNpaWRzLmggfCA4ICsrKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2ludGVsL2k5MTVf
cGNpaWRzLmggYi9pbnRlbC9pOTE1X3BjaWlkcy5oDQo+IGluZGV4IGQ2Y2IyODk5Li44ZTdhZTMw
ZSAxMDA2NDQNCj4gLS0tIGEvaW50ZWwvaTkxNV9wY2lpZHMuaA0KPiArKysgYi9pbnRlbC9pOTE1
X3BjaWlkcy5oDQo+IEBAIC0yNTgsOSArMjU4LDcgQEANCj4gIAlJTlRFTF9WR0FfREVWSUNFKDB4
MGYzMCwgaW5mbyksIFwNCj4gIAlJTlRFTF9WR0FfREVWSUNFKDB4MGYzMSwgaW5mbyksIFwNCj4g
IAlJTlRFTF9WR0FfREVWSUNFKDB4MGYzMiwgaW5mbyksIFwNCj4gLQlJTlRFTF9WR0FfREVWSUNF
KDB4MGYzMywgaW5mbyksIFwNCj4gLQlJTlRFTF9WR0FfREVWSUNFKDB4MDE1NywgaW5mbyksIFwN
Cj4gLQlJTlRFTF9WR0FfREVWSUNFKDB4MDE1NSwgaW5mbykNCj4gKwlJTlRFTF9WR0FfREVWSUNF
KDB4MGYzMywgaW5mbykNCj4gIA0KPiAgI2RlZmluZSBJTlRFTF9CRFdfVUxUX0dUMV9JRFMoaW5m
bykgXA0KPiAgCUlOVEVMX1ZHQV9ERVZJQ0UoMHgxNjA2LCBpbmZvKSwgLyogR1QxIFVMVCAqLyBc
DQo+IEBAIC02MTgsNCArNjE2LDggQEANCj4gIAlJTlRFTF9WR0FfREVWSUNFKDB4NEM5MCwgaW5m
byksIFwNCj4gIAlJTlRFTF9WR0FfREVWSUNFKDB4NEM5QSwgaW5mbykNCj4gIA0KPiArLyogREcx
ICovDQo+ICsjZGVmaW5lIElOVEVMX0RHMV9JRFMoaW5mbykgXA0KPiArCUlOVEVMX1ZHQV9ERVZJ
Q0UoMHg0OTA1LCBpbmZvKQ0KPiArDQo+ICAjZW5kaWYgLyogX0k5MTVfUENJSURTX0ggKi8NCj4g
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
