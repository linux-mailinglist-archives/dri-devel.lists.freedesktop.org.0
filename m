Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00F727FFD
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 16:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8529889DB4;
	Thu, 23 May 2019 14:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE44189DB4
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 14:40:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 May 2019 07:40:55 -0700
X-ExtLoop1: 1
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga005.jf.intel.com with ESMTP; 23 May 2019 07:40:53 -0700
Received: from fmsmsx119.amr.corp.intel.com (10.18.124.207) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 07:39:37 -0700
Received: from bgsmsx110.gar.corp.intel.com (10.223.4.212) by
 FMSMSX119.amr.corp.intel.com (10.18.124.207) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Thu, 23 May 2019 07:38:40 -0700
Received: from bgsmsx104.gar.corp.intel.com ([169.254.5.115]) by
 BGSMSX110.gar.corp.intel.com ([169.254.11.234]) with mapi id 14.03.0415.000;
 Thu, 23 May 2019 20:08:37 +0530
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Sean Paul <sean@poorly.run>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/edid: Fix docbook in
 drm_hdmi_infoframe_set_hdr_metadata()
Thread-Topic: [PATCH] drm/edid: Fix docbook in
 drm_hdmi_infoframe_set_hdr_metadata()
Thread-Index: AQHVEW8jKhswlWJD7UajKGzk9tM0xaZ4xwCA
Date: Thu, 23 May 2019 14:38:37 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F8203029D@BGSMSX104.gar.corp.intel.com>
References: <20190523135504.184354-1-sean@poorly.run>
In-Reply-To: <20190523135504.184354-1-sean@poorly.run>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZTZjNmFkODktZGIyZi00YzhiLWE2M2UtNDYxM2FlOWE5MmE1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiSFFVd3JqRmRVTmp6V3dzUUIwZ3c4elBjNnYxRlRlc05DT1Z5MXU4Zk15WVNXOStpU2NXdDBaaHJQQVNYcTI2YiJ9
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-originating-ip: [10.223.10.10]
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Hans Verkuil <hansverk@cisco.com>,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IFNlYW4gUGF1bCBbbWFpbHRv
OnNlYW5AcG9vcmx5LnJ1bl0NCj5TZW50OiBUaHVyc2RheSwgTWF5IDIzLCAyMDE5IDc6MjUgUE0N
Cj5UbzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBTZWFuIFBhdWwgPHNl
YW5wYXVsQGNocm9taXVtLm9yZz47IFNoYW5rYXIsIFVtYSA8dW1hLnNoYW5rYXJAaW50ZWwuY29t
PjsNCj5TaGFybWEsIFNoYXNoYW5rIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPjsgVmlsbGUg
U3lyasOkbMOkDQo+PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPjsgTWFhcnRlbiBMYW5r
aG9yc3QNCj48bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFy
ZA0KPjxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPjsgU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+OyBEYXZpZCBBaXJsaWUNCj48YWlybGllZEBsaW51eC5pZT47IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD47IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3oNCj48Yi56b2xuaWVya2ll
QHNhbXN1bmcuY29tPjsgSGFucyBWZXJrdWlsIDxoYW5zdmVya0BjaXNjby5jb20+OyBsaW51eC0N
Cj5mYmRldkB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBbUEFUQ0hdIGRybS9lZGlkOiBGaXgg
ZG9jYm9vayBpbiBkcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YSgpDQo+DQo+RnJv
bTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+DQo+DQo+Rml4ZXMgdGhlIGZvbGxv
d2luZyB3YXJuaW5nczoNCj4uLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYzo0OTI1OiB3YXJu
aW5nOiBGdW5jdGlvbiBwYXJhbWV0ZXIgb3IgbWVtYmVyDQo+J2Nvbm5fc3RhdGUnIG5vdCBkZXNj
cmliZWQgaW4gJ2RybV9oZG1pX2luZm9mcmFtZV9zZXRfaGRyX21ldGFkYXRhJw0KPi4uL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jOjQ5MjU6IHdhcm5pbmc6IEV4Y2VzcyBmdW5jdGlvbiBwYXJh
bWV0ZXINCj4naGRyX21ldGFkYXRhJyBkZXNjcmlwdGlvbiBpbiAnZHJtX2hkbWlfaW5mb2ZyYW1l
X3NldF9oZHJfbWV0YWRhdGEnDQoNClRoYW5rcyBTZWFuIFBhdWwgZm9yIGZpeGluZyB0aGlzLg0K
UmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQoNCj5GaXhl
czogMmNkYmZkNjZhODI5ICgiZHJtOiBFbmFibGUgSERSIGluZm9mcmFtZSBzdXBwb3J0IikNCj5D
YzogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4NCj5DYzogU2hhc2hhbmsgU2hh
cm1hIDxzaGFzaGFuay5zaGFybWFAaW50ZWwuY29tPg0KPkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPg0KPkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPkNjOiBNYXhpbWUgUmlwYXJkIDxtYXhp
bWUucmlwYXJkQGJvb3RsaW4uY29tPg0KPkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4N
Cj5DYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPkNjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+DQo+Q2M6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3ogPGIuem9s
bmllcmtpZUBzYW1zdW5nLmNvbT4NCj5DYzogIlZpbGxlIFN5cmrDpGzDpCIgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPg0KPkNjOiBIYW5zIFZlcmt1aWwgPGhhbnN2ZXJrQGNpc2NvLmNv
bT4NCj5DYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPkNjOiBsaW51eC1mYmRl
dkB2Z2VyLmtlcm5lbC5vcmcNCj5TaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNo
cm9taXVtLm9yZz4NCj4tLS0NCj4gZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyICstDQo+
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZWRpZC5jIGluZGV4DQo+MjYyNTEwYzJhNjcwLi5kODdmNTc0ZmVlY2EgMTAwNjQ0DQo+LS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Vk
aWQuYw0KPkBAIC00OTE0LDcgKzQ5MTQsNyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfZW90Zl9z
dXBwb3J0ZWQodTggb3V0cHV0X2VvdGYsIHU4DQo+c2lua19lb3RmKQ0KPiAgKiBkcm1faGRtaV9p
bmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YSgpIC0gZmlsbCBhbiBIRE1JIERSTSBpbmZvZnJhbWUg
d2l0aA0KPiAgKiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSERSIG1l
dGFkYXRhIGZyb20gdXNlcnNwYWNlDQo+ICAqIEBmcmFtZTogSERNSSBEUk0gaW5mb2ZyYW1lDQo+
LSAqIEBoZHJfbWV0YWRhdGE6IGhkcl9zb3VyY2VfbWV0YWRhdGEgaW5mbyBmcm9tIHVzZXJzcGFj
ZQ0KPisgKiBAY29ubl9zdGF0ZTogQ29ubmVjdG9yIHN0YXRlIGNvbnRhaW5pbmcgSERSIG1ldGFk
YXRhDQo+ICAqDQo+ICAqIFJldHVybjogMCBvbiBzdWNjZXNzIG9yIGEgbmVnYXRpdmUgZXJyb3Ig
Y29kZSBvbiBmYWlsdXJlLg0KPiAgKi8NCj4tLQ0KPlNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5l
ZXIsIEdvb2dsZSAvIENocm9taXVtIE9TDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
