Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2874571FC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 21:48:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B47036E40D;
	Wed, 26 Jun 2019 19:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EB36E40D;
 Wed, 26 Jun 2019 19:48:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Jun 2019 12:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,421,1557212400"; d="scan'208";a="162384104"
Received: from dk-thinkpad-x260.jf.intel.com ([10.54.75.51])
 by fmsmga008.fm.intel.com with ESMTP; 26 Jun 2019 12:48:12 -0700
Message-ID: <ccf988d7eee9616959ac0b6fb7df476c93992fc3.camel@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/connector: Allow max possible encoders
 to attach to a connector
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>
Date: Wed, 26 Jun 2019 12:48:01 -0700
In-Reply-To: <20190626143117.GO12905@phenom.ffwll.local>
References: <20190625234045.31321-1-dhinakaran.pandiyan@intel.com>
 <20190626134328.GQ5942@intel.com>
 <20190626143117.GO12905@phenom.ffwll.local>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Reply-To: dhinakaran.pandiyan@intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDE5LTA2LTI2IGF0IDE2OjMxICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDA0OjQzOjI4UE0gKzAzMDAsIFZpbGxlIFN5cmrDpGzD
pCB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDI1LCAyMDE5IGF0IDA0OjQwOjQ1UE0gLTA3MDAsIERo
aW5ha2FyYW4gUGFuZGl5YW4gd3JvdGU6Cj4gPiA+IEN1cnJlbnRseSB3ZSByZXN0cmljdCB0aGUg
bnVtYmVyIG9mIGVuY29kZXJzIHRoYXQgY2FuIGJlIGxpbmtlZCB0bwo+ID4gPiBhIGNvbm5lY3Rv
ciB0byAzLCBpbmNyZWFzZSBpdCB0byBtYXRjaCB0aGUgbWF4aW11bSBudW1iZXIgb2YgZW5jb2Rl
cnMKPiA+ID4gdGhhdCBjYW4gYmUgaW5pdGlhbGl6ZWQgLSAzMi4gVGhlIGN1cnJlbnQgbGltaXRh
dGlvbiBsb29rcyBhcnRpZmljaWFsLgo+ID4gPiBJbmNyZWFzaW5nIHRoZSBsaW1pdCB0byAzMiBk
b2VzIGhvd2V2ZXIgaW5jcmVhc2VzIHRoZSBzaXplIG9mIHRoZSBzdGF0aWMKPiA+ID4gdTMyIGFy
cmF5IGtlZXBpbmcgdHJhY2sgb2YgdGhlIGVuY29kZXIgSURzLgo+ID4gPiAKPiA+ID4gQ2M6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgo+ID4gPiBDYzogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+ID4gU2lnbmVkLW9mZi1ieTogRGhpbmFr
YXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIHwgMiArLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Nvbm5lY3Rvci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Nvbm5l
Y3Rvci5oCj4gPiA+IGluZGV4IGNhNzQ1ZDlmZWFmNS4uOTE0NTViNGE5MzYwIDEwMDY0NAo+ID4g
PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2Nvbm5lY3Rvci5oCj4gPiA+IEBAIC0xMjc4LDcgKzEyNzgsNyBAQCBzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciB7Cj4gPiA+ICAJLyoqIEBvdmVycmlkZV9lZGlkOiBoYXMgdGhlIEVESUQgYmVl
biBvdmVyd3JpdHRlbiB0aHJvdWdoIGRlYnVnZnMgZm9yCj4gPiA+IHRlc3Rpbmc/ICovCj4gPiA+
ICAJYm9vbCBvdmVycmlkZV9lZGlkOwo+ID4gPiAgCj4gPiA+IC0jZGVmaW5lIERSTV9DT05ORUNU
T1JfTUFYX0VOQ09ERVIgMwo+ID4gPiArI2RlZmluZSBEUk1fQ09OTkVDVE9SX01BWF9FTkNPREVS
IDMyCj4gPiA+ICAJLyoqCj4gPiA+ICAJICogQGVuY29kZXJfaWRzOiBWYWxpZCBlbmNvZGVycyBm
b3IgdGhpcyBjb25uZWN0b3IuIFBsZWFzZSBvbmx5IHVzZQo+ID4gPiAgCSAqIGRybV9jb25uZWN0
b3JfZm9yX2VhY2hfcG9zc2libGVfZW5jb2RlcigpIHRvIGVudW1lcmF0ZSB0aGVzZS4KPiA+IAo+
ID4gSSB3b25kZXIgaWYgd2UgY291bGRuJ3QganVzdCByZXBsYWNlIHRoaXMgYXJyYXkgd2l0aCBh
IGJpdG1hc2s/Cj4gPiBJIHRoaW5rIHRoZSBmb3JfZWFjaF9wb3NzaWJsZV9lbmNvZGVyKCkgdGhp
bmcgSSBkaWQgYSB3aGlsZSBiYWNrCj4gPiBzaG91bGQgbWFrZSB0aGlzIGVhc2llciBwb3RlbnRp
YWxseSBiZWNhdXNlIG1vc3QgZHJpdmVyIGNvZGUganVzdAo+ID4gdXNlcyB0aGF0Lgo+IAo+ICsx
IG9uIHBvc3NpYmxlIGVuY29kZXJzIGJpdG1hc2suIE1vcmUgY29uc2lzdGVudCBhdCBsZWFzdC4K
CkFncmVlZCwgSSdsbCBtYWtlIHRoaXMgY2hhbmdlLgoKLURLCgo+IC1EYW5pZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
