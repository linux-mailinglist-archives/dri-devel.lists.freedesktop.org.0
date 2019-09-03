Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C90A605C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 06:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F20E899D6;
	Tue,  3 Sep 2019 04:58:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06A40899D4;
 Tue,  3 Sep 2019 04:57:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Sep 2019 21:57:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,461,1559545200"; d="scan'208";a="211866362"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
 by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2019 21:57:57 -0700
Received: from irsmsx106.ger.corp.intel.com ([169.254.8.187]) by
 IRSMSX108.ger.corp.intel.com ([169.254.11.50]) with mapi id 14.03.0439.000;
 Tue, 3 Sep 2019 05:57:56 +0100
From: "Mun, Gwan-gyeong" <gwan-gyeong.mun@intel.com>
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 3/6] drm: Add DisplayPort colorspace
 property
Thread-Topic: [Intel-gfx] [PATCH v2 3/6] drm: Add DisplayPort colorspace
 property
Thread-Index: AQHVWZiOpwLIluoXW0G5xDPr66sqracYdewAgADuaIA=
Date: Tue, 3 Sep 2019 04:57:56 +0000
Message-ID: <5a97134236818e1542dc8db8b826a69e98d6de37.camel@intel.com>
References: <20190823095232.28908-1-gwan-gyeong.mun@intel.com>
 <20190823095232.28908-4-gwan-gyeong.mun@intel.com>
 <20190902144436.GX7482@intel.com>
In-Reply-To: <20190902144436.GX7482@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.149]
Content-ID: <F2E46AAD2D21284598BA24CB3DD59F95@intel.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA5LTAyIGF0IDE3OjQ0ICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6
DQo+IE9uIEZyaSwgQXVnIDIzLCAyMDE5IGF0IDEyOjUyOjI5UE0gKzAzMDAsIEd3YW4tZ3llb25n
IE11biB3cm90ZToNCj4gPiBJbiBvcmRlciB0byB1c2UgY29sb3JzcGFjZSBwcm9wZXJ0eSB0byBE
aXNwbGF5IFBvcnQgY29ubmVjdG9ycywgaXQNCj4gPiBleHRlbmRzDQo+ID4gRFJNX01PREVfQ09O
TkVDVE9SX0Rpc3BsYXlQb3J0IGNvbm5lY3Rvcl90eXBlIG9uDQo+ID4gZHJtX21vZGVfY3JlYXRl
X2NvbG9yc3BhY2VfcHJvcGVydHkgZnVuY3Rpb24uDQo+ID4gDQo+ID4gU2lnbmVkLW9mZi1ieTog
R3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIHwgNCArKystDQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYw0KPiA+IGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9jb25uZWN0b3IuYw0KPiA+IGluZGV4IDRjNzY2NjI0YjIwZC4uNjU1YWRhOWQ0YzE2
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jDQo+ID4gQEAgLTE3MDMsNyArMTcw
Myw5IEBAIGludA0KPiA+IGRybV9tb2RlX2NyZWF0ZV9jb2xvcnNwYWNlX3Byb3BlcnR5KHN0cnVj
dCBkcm1fY29ubmVjdG9yDQo+ID4gKmNvbm5lY3RvcikNCj4gPiAgCXN0cnVjdCBkcm1fcHJvcGVy
dHkgKnByb3A7DQo+ID4gIA0KPiA+ICAJaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0g
RFJNX01PREVfQ09OTkVDVE9SX0hETUlBIHx8DQo+ID4gLQkgICAgY29ubmVjdG9yLT5jb25uZWN0
b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUIpIHsNCj4gPiArCSAgICBjb25uZWN0
b3ItPmNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQiB8fA0KPiA+ICsJ
ICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3Bs
YXlQb3J0DQo+ID4gfHwNCj4gPiArCSAgICBjb25uZWN0b3ItPmNvbm5lY3Rvcl90eXBlID09IERS
TV9NT0RFX0NPTk5FQ1RPUl9lRFApIHsNCj4gDQo+IFdlIGRvbid0IG5lZWQgYSBzZXBhcmF0ZSBz
ZXQgb2YgZW51bSB2YWx1ZXMgZm9yIERQPw0KPiANCkkgY2hlY2tlZCBEUCAxLjRhIHNwZWMsIDIu
Mi41LjcuNSBWU0MgU0RQIFBheWxvYWQgZm9yIFBpeGVsDQpFbmNvZGluZy9Db2xvcmltZXRyeSBh
Z2FpbiwNCkZvbGxvd2VkIHlvdXIgY29tbWVudHMsIHRoZSBzcGVjIHJlcXVpcmVzIG1vcmUgbmV3
IGNvbG9yaW1ldHJ5IG9wdGlvbnMNCmZvciBEUCAxLjRhIGNvbG9yaW1ldHJ5IGZvcm1hdC4NCkkn
bGwgYWRkIG1pc3NlZCBjb2xvcmltZXRyeSBvcHRpb25zIGFuZCB3aWxsIHNlcGFyYXRlIHNldCBv
Zg0KY29sb3JpbWV0cnkgZW51bSB2YWx1ZXMgZm9yIERQLg0KDQo+ID4gIAkJcHJvcCA9IGRybV9w
cm9wZXJ0eV9jcmVhdGVfZW51bShkZXYsDQo+ID4gRFJNX01PREVfUFJPUF9FTlVNLA0KPiA+ICAJ
CQkJCQkiQ29sb3JzcGFjZSIsDQo+ID4gIAkJCQkJCWhkbWlfY29sb3JzcGFjZXMsDQo+ID4gLS0g
DQo+ID4gMi4yMi4wDQo+ID4gDQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4gPiBJbnRlbC1nZnggbWFpbGluZyBsaXN0DQo+ID4gSW50ZWwtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
