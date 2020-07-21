Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59028228896
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 20:54:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5204E6E040;
	Tue, 21 Jul 2020 18:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BC96E040;
 Tue, 21 Jul 2020 18:54:43 +0000 (UTC)
IronPort-SDR: WZy63+yxqppqItWGVffMBRpdECa5CXsm4ewkTRTWBqaKc8jIxF4H/foGVvAEJxykl4VxzzzwAE
 xEX2mj7aQz1g==
X-IronPort-AV: E=McAfee;i="6000,8403,9689"; a="211757155"
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="211757155"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2020 11:54:42 -0700
IronPort-SDR: K03CADHerB3a+2m1t//BCchPjrwsb9KsJI8PW/2k7I+Zxqe9TRCTkEiyCaTkdtBQs3JUfoBLTt
 qio2D0N86iUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,379,1589266800"; d="scan'208";a="271797707"
Received: from labuser-z97x-ud5h.jf.intel.com (HELO intel.com)
 ([10.165.21.211])
 by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2020 11:54:42 -0700
Date: Tue, 21 Jul 2020 11:56:55 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>
Subject: Re: [PATCH 1/2] drm/dp: Add PHY_TEST_PATTERN CP2520 Pattern 2 and 3
Message-ID: <20200721185655.GA18835@intel.com>
References: <20200720234126.11853-1-khaled.almahallawy@intel.com>
 <20200721000734.GA14395@intel.com>
 <696350283535930fc6d4a62194c24207db95d4cf.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <696350283535930fc6d4a62194c24207db95d4cf.camel@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Manna,
 Animesh" <animesh.manna@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjAsIDIwMjAgYXQgMDU6NDA6MTBQTSAtMDcwMCwgQWxtYWhhbGxhd3ksIEto
YWxlZCB3cm90ZToKPiBPbiBNb24sIDIwMjAtMDctMjAgYXQgMTc6MDcgLTA3MDAsIE1hbmFzaSBO
YXZhcmUgd3JvdGU6Cj4gPiBPbiBNb24sIEp1bCAyMCwgMjAyMCBhdCAwNDo0MToyNVBNIC0wNzAw
LCBLaGFsZWQgQWxtYWhhbGxhd3kgd3JvdGU6Cj4gPiA+IEFkZCB0aGUgbWlzc2luZyBDUDI1MjAg
cGF0dGVybiAyIGFuZCAzIHBoeSBjb21wbGlhbmNlIHBhdHRlcm5zCj4gPiA+Cj4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEtoYWxlZCBBbG1haGFsbGF3eSA8a2hhbGVkLmFsbWFoYWxsYXd5QGludGVsLmNv
bT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMiAr
LQo+ID4gPiAgaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICB8IDQgKysrLQo+ID4gPiAg
MiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwo+ID4gPiBpbmRleCBhM2M4MmU3MjYwNTcu
LmQwZmI3OGM2YWNhNiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9o
ZWxwZXIuYwo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCj4gPiA+
IEBAIC0xNTgzLDcgKzE1ODMsNyBAQCBpbnQgZHJtX2RwX2dldF9waHlfdGVzdF9wYXR0ZXJuKHN0
cnVjdAo+ID4gPiBkcm1fZHBfYXV4ICphdXgsCj4gPiA+ICByZXR1cm4gZXJyOwo+ID4gPgo+ID4g
PiAgYnJlYWs7Cj4gPiA+IC1jYXNlIERQX1BIWV9URVNUX1BBVFRFUk5fQ1AyNTIwOgo+ID4gPiAr
Y2FzZSBEUF9QSFlfVEVTVF9QQVRURVJOX0NQMjUyMF9QQVQxOgo+ID4gPiAgZXJyID0gZHJtX2Rw
X2RwY2RfcmVhZChhdXgsCj4gPiA+IERQX1RFU1RfSEJSMl9TQ1JBTUJMRVJfUkVTRVQsCj4gPiA+
ICAgICAgICAgJmRhdGEtPmhicjJfcmVzZXQsCj4gPiA+ICAgICAgICAgc2l6ZW9mKGRhdGEtPmhi
cjJfcmVzZXQpKTsKPiA+Cj4gPiBXaGVyZSBkbyB3ZSByZWFkIFBBVDIgYW5kIFBBVDMsIEkgc2Vl
IHlvdSBkZWZpbmVkIHRob3NlIG5ld2x5IGFuZAo+ID4gcGF0Y2ggMi8yIGhhcyB0aGVtCj4gPiBp
biB0ZWggc3dpdGNoIGNhc2UgYnV0IHRoZSBkcm1fZHBfZ2V0X3BoeV90ZXN0X3BhdHRlcm4gZnVu
Y3Rpb24KPiA+IGRvZXNudCByZWFkIHRoZW0/Cj4gPgo+IAo+IFBlciBteSB1bmRlcnN0YW5kaW5n
IGZyb20gdGhlIHNwZWNzLCBvbmx5IEhCUjIgKENQMjUyMCBQQVQxKSByZXF1aXJlcwo+IHJlYWRp
bmcgZHBjZCBhZGRyZXNzIDAwMjRBaCB0byBzZXQgSEJSMl9DT01QTElBTkNUX1NDUkFNQkxFUl9S
RVNFVC4KPiBUUFM0IChDUDI1MjAgUEFUMykgZG9lc27igJl0IHJlcXVpcmUgdGhhdC4KPiBJ4oCZ
bSBub3Qgc3VyZSBhYm91dCBDUDI1MjAgUEFUMiBpZiBpdCBoYXMgdXNlIG9yIG5vdC4gSW4gdGhl
IHRlc3Qgc2NvcGUKPiB3ZSBjYW4gc2VsZWN0IDYgcGF0dGVybnMuIFBBVDIgaXMgbm90IG9uZSBv
ZiB0aGVtLgo+IAo+IFRoYW5rcwo+IH5LaGFsZWQKCk9rYXkgZ290IGl0LCB3aXRoIHRoYXQKClJl
dmlld2VkLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgoKTWFu
YXNpCgo+IAo+ID4gTWFuYXNpCj4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X2RwX2hlbHBlci5oCj4gPiA+IGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCj4gPiA+IGlu
ZGV4IGU0N2RjMjJlYmY1MC4uNjVkZDZjZDcxZjFlIDEwMDY0NAo+ID4gPiAtLS0gYS9pbmNsdWRl
L2RybS9kcm1fZHBfaGVscGVyLmgKPiA+ID4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBl
ci5oCj4gPiA+IEBAIC03MDgsNyArNzA4LDkgQEAKPiA+ID4gICMgZGVmaW5lIERQX1BIWV9URVNU
X1BBVFRFUk5fRVJST1JfQ09VTlQgICAgMHgyCj4gPiA+ICAjIGRlZmluZSBEUF9QSFlfVEVTVF9Q
QVRURVJOX1BSQlM3ICAgICAgICAgIDB4Mwo+ID4gPiAgIyBkZWZpbmUgRFBfUEhZX1RFU1RfUEFU
VEVSTl84MEJJVF9DVVNUT00gICAweDQKPiA+ID4gLSMgZGVmaW5lIERQX1BIWV9URVNUX1BBVFRF
Uk5fQ1AyNTIwICAgICAgICAgMHg1Cj4gPiA+ICsjIGRlZmluZSBEUF9QSFlfVEVTVF9QQVRURVJO
X0NQMjUyMF9QQVQxMHg1Cj4gPiA+ICsjIGRlZmluZSBEUF9QSFlfVEVTVF9QQVRURVJOX0NQMjUy
MF9QQVQyMHg2Cj4gPiA+ICsjIGRlZmluZSBEUF9QSFlfVEVTVF9QQVRURVJOX0NQMjUyMF9QQVQz
MHg3Cj4gPiA+Cj4gPiA+ICAjZGVmaW5lIERQX1RFU1RfSEJSMl9TQ1JBTUJMRVJfUkVTRVQgICAg
ICAgIDB4MjRBCj4gPiA+ICAjZGVmaW5lIERQX1RFU1RfODBCSVRfQ1VTVE9NX1BBVFRFUk5fN18w
ICAgIDB4MjUwCj4gPiA+IC0tCj4gPiA+IDIuMTcuMQo+ID4gPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
