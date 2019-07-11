Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F09C651DC
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 08:29:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214D5892B7;
	Thu, 11 Jul 2019 06:29:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C343289133;
 Thu, 11 Jul 2019 06:29:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 23:29:08 -0700
X-IronPort-AV: E=Sophos;i="5.63,476,1557212400"; d="scan'208";a="159976996"
Received: from jkrzyszt-desk.igk.intel.com (HELO
 jkrzyszt-desk.ger.corp.intel.com) ([172.22.244.18])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 23:29:05 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [RFC PATCH] drm/i915: Drop extern qualifiers from header function
 prototypes
Date: Thu, 11 Jul 2019 08:28:55 +0200
Message-ID: <1625229.KzvQlO0Tx8@jkrzyszt-desk.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <156277086449.4055.15655120452619911756@skylake-alporthouse-com>
References: <20190710145239.12844-1-janusz.krzysztofik@linux.intel.com>
 <156277086449.4055.15655120452619911756@skylake-alporthouse-com>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 =?utf-8?B?TWljaGHFgg==?= Wajdeczko <michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXMsCgpPbiBXZWRuZXNkYXksIEp1bHkgMTAsIDIwMTkgNTowMTowNCBQTSBDRVNUIENo
cmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIEphbnVzeiBLcnp5c3p0b2ZpayAoMjAxOS0wNy0x
MCAxNTo1MjozOSkKPiA+IEZvbGxvdyBkaW0gY2hlY2twYXRjaCByZWNvbW1lbmRhdGlvbiBzbyBp
dCBkb2Vzbid0IGNvbXBsYWluIG9uIHRoYXQgbm93Cj4gPiBhbmQgYWdhaW4gb24gaGVhZGVyIGZp
bGUgbW9kaWZpY2F0aW9ucy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFudXN6IEtyenlzenRv
ZmlrIDxqYW51c3oua3J6eXN6dG9maWtAbGludXguaW50ZWwuY29tPgo+IAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaAo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9kcnYuaAo+ID4gQEAgLTIzODgsMTkgKzIzODgsMTggQEAgX19pOTE1X3ByaW50ayhz
dHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsIApjb25zdCBjaGFyICpsZXZlbCwKPiA+
ICAgICAgICAgX19pOTE1X3ByaW50ayhkZXZfcHJpdiwgS0VSTl9FUlIsIGZtdCwgIyNfX1ZBX0FS
R1NfXykKPiA+ICAKPiA+ICAjaWZkZWYgQ09ORklHX0NPTVBBVAo+ID4gLWV4dGVybiBsb25nIGk5
MTVfY29tcGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBpbnQgY21kLAo+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhcmcpOwo+ID4gK2xv
bmcgaTkxNV9jb21wYXRfaW9jdGwoc3RydWN0IGZpbGUgKmZpbHAsIHVuc2lnbmVkIGludCBjbWQs
IHVuc2lnbmVkIGxvbmcgCmFyZyk7Cj4gPiAgI2Vsc2UKPiA+ICAjZGVmaW5lIGk5MTVfY29tcGF0
X2lvY3RsIE5VTEwKPiA+ICAjZW5kaWYKPiA+ICBleHRlcm4gY29uc3Qgc3RydWN0IGRldl9wbV9v
cHMgaTkxNV9wbV9vcHM7Cj4gPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIGk5MTVf
cG1fb3BzXzE7Cj4gCj4gVGhhdCdzIG5vdmVsLgoKT2gsIHNvcnJ5LCB0aGF0IHdhcyBteSB0ZXN0
aW5nIG9mIGhvdyBkaW0gY2hlY2twYXRjaCByZWFjdHMgb24gZXh0ZXJuIApxdWFsaWZpZXJzIG9u
IHZhcmlhYmxlcy4gIFRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhpcy4KCkphbnVzegoKPiA+IC1DaHJp
cwo+IAoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
