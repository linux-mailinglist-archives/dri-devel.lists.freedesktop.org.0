Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A51C2100D3
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 02:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33476E045;
	Wed,  1 Jul 2020 00:02:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775B76E045;
 Wed,  1 Jul 2020 00:01:59 +0000 (UTC)
IronPort-SDR: kAxDHgYIYM+L47W/UK6UGtW65CeyDvmoPRt+gSJ4KP8LC4NJT2paoiwvGslcbZf2bIZbTDqKi2
 nPw6sRYrciEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="231276382"
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="231276382"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2020 17:01:59 -0700
IronPort-SDR: 67Fk0i79FiBHEnmfJ9gg3X/uQg/jKJZzYRCVnpXix9QUVmVE0A9vn2Z+XylOvee2Q/DWn0Prhq
 WW/4g3PRMW2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,298,1589266800"; d="scan'208";a="355936136"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga001.jf.intel.com with ESMTP; 30 Jun 2020 17:01:58 -0700
Received: from FMSMSX109.amr.corp.intel.com (10.18.116.9) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 30 Jun 2020 17:01:57 -0700
Received: from fmsmsx116.amr.corp.intel.com ([169.254.2.40]) by
 FMSMSX109.amr.corp.intel.com ([169.254.15.60]) with mapi id 14.03.0439.000;
 Tue, 30 Jun 2020 17:01:57 -0700
From: "Souza, Jose" <jose.souza@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/edid: Clean up some curly braces
Thread-Topic: [PATCH 3/3] drm/edid: Clean up some curly braces
Thread-Index: AQHWNCc58GVsLdZCq0uHlBMaAp+ddajygyqA
Date: Wed, 1 Jul 2020 00:01:56 +0000
Message-ID: <3b39c148c6cd8a6927101ca1afb29a94248f57bb.camel@intel.com>
References: <20200527130310.27099-1-ville.syrjala@linux.intel.com>
 <20200527130310.27099-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20200527130310.27099-3-ville.syrjala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.255.76.92]
Content-ID: <0074A857C1E6DF41BD0D0D782540355A@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDIwLTA1LTI3IGF0IDE2OjAzICswMzAwLCBWaWxsZSBTeXJqYWxhIHdyb3RlOg0K
PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0K
PiANCj4gRHJvcCBzb21lIHBvaW50bGVzcyBjdXJseSBicmFjZXMsIGFuZCBhZGQgc29tZSBhY3Jv
c3MgdGhlDQo+IGVsc2Ugd2hlbiB0aGUgaWYgaGFzIHRoZW0gdG9vLg0KDQpSZXZpZXdlZC1ieTog
Sm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQoNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCA5ICsrKystLS0tLQ0K
PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jDQo+IGluZGV4IGRjYjIzNTYzZDI5ZC4uOGE5NTFlMmJmYjQxIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VkaWQuYw0KPiBAQCAtNTgzNiwyMiArNTgzNiwyMSBAQCBzdGF0aWMgdm9pZCBkcm1f
cGFyc2VfdGlsZWRfYmxvY2soc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gIAlE
Uk1fREVCVUdfS01TKCJ2ZW5kICVjJWMlY1xuIiwgdGlsZS0+dG9wb2xvZ3lfaWRbMF0sIHRpbGUt
PnRvcG9sb2d5X2lkWzFdLCB0aWxlLT50b3BvbG9neV9pZFsyXSk7DQo+ICANCj4gIAl0ZyA9IGRy
bV9tb2RlX2dldF90aWxlX2dyb3VwKGNvbm5lY3Rvci0+ZGV2LCB0aWxlLT50b3BvbG9neV9pZCk7
DQo+IC0JaWYgKCF0Zykgew0KPiArCWlmICghdGcpDQo+ICAJCXRnID0gZHJtX21vZGVfY3JlYXRl
X3RpbGVfZ3JvdXAoY29ubmVjdG9yLT5kZXYsIHRpbGUtPnRvcG9sb2d5X2lkKTsNCj4gLQl9DQo+
ICAJaWYgKCF0ZykNCj4gIAkJcmV0dXJuOw0KPiAgDQo+ICAJaWYgKGNvbm5lY3Rvci0+dGlsZV9n
cm91cCAhPSB0Zykgew0KPiAgCQkvKiBpZiB3ZSBoYXZlbid0IGdvdCBhIHBvaW50ZXIsDQo+ICAJ
CSAgIHRha2UgdGhlIHJlZmVyZW5jZSwgZHJvcCByZWYgdG8gb2xkIHRpbGUgZ3JvdXAgKi8NCj4g
LQkJaWYgKGNvbm5lY3Rvci0+dGlsZV9ncm91cCkgew0KPiArCQlpZiAoY29ubmVjdG9yLT50aWxl
X2dyb3VwKQ0KPiAgCQkJZHJtX21vZGVfcHV0X3RpbGVfZ3JvdXAoY29ubmVjdG9yLT5kZXYsIGNv
bm5lY3Rvci0+dGlsZV9ncm91cCk7DQo+IC0JCX0NCj4gIAkJY29ubmVjdG9yLT50aWxlX2dyb3Vw
ID0gdGc7DQo+IC0JfSBlbHNlDQo+ICsJfSBlbHNlIHsNCj4gIAkJLyogaWYgc2FtZSB0aWxlIGdy
b3VwLCB0aGVuIHJlbGVhc2UgdGhlIHJlZiB3ZSBqdXN0IHRvb2suICovDQo+ICAJCWRybV9tb2Rl
X3B1dF90aWxlX2dyb3VwKGNvbm5lY3Rvci0+ZGV2LCB0Zyk7DQo+ICsJfQ0KPiAgfQ0KPiAgDQo+
ICBzdGF0aWMgdm9pZCBkcm1fZGlzcGxheWlkX3BhcnNlX3RpbGVkKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
