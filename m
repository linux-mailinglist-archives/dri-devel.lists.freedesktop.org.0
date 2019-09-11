Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8BEB0931
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 09:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061356EBB3;
	Thu, 12 Sep 2019 07:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB986E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:14:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 10:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="336315272"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004.jf.intel.com with ESMTP; 11 Sep 2019 10:13:58 -0700
Received: from andy by smile with local (Exim 4.92.1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1i86Bo-0001zn-Jk; Wed, 11 Sep 2019 20:13:56 +0300
Date: Wed, 11 Sep 2019 20:13:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 00/11] Add support for software nodes to gpiolib
Message-ID: <20190911171356.GV2680@smile.fi.intel.com>
References: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911075215.78047-1-dmitry.torokhov@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Thu, 12 Sep 2019 07:07:54 +0000
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
Cc: Andrew Lunn <andrew@lunn.ch>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Florian Fainelli <f.fainelli@gmail.com>, linux-acpi@vger.kernel.org,
 linux-gpio@vger.kernel.org, David Airlie <airlied@linux.ie>,
 netdev@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Russell King <linux@armlinux.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTEsIDIwMTkgYXQgMTI6NTI6MDRBTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92
IHdyb3RlOgo+IFRoaXMgc2VyaWVzIGF0dGVtcHRzIHRvIGFkZCBzdXBwb3J0IGZvciBzb2Z0d2Fy
ZSBub2RlcyB0byBncGlvbGliLCB1c2luZwo+IHNvZnR3YXJlIG5vZGUgcmVmZXJlbmNlcyB0aGF0
IHdlcmUgaW50cm9kdWNlZCByZWNlbnRseS4gVGhpcyBhbGxvd3MgdXMKPiB0byBjb252ZXJ0IG1v
cmUgZHJpdmVycyB0byB0aGUgZ2VuZXJpYyBkZXZpY2UgcHJvcGVydGllcyBhbmQgZHJvcAo+IHN1
cHBvcnQgZm9yIGN1c3RvbSBwbGF0Zm9ybSBkYXRhOgo+IAo+IHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
c29mdHdhcmVfbm9kZSBncGlvX2JhbmtfYl9ub2RlID0gewo+IHwtLS0tLS0tLm5hbWUgPSAiQiIs
Cj4gfTsKPiAKPiBzdGF0aWMgY29uc3Qgc3RydWN0IHByb3BlcnR5X2VudHJ5IHNpbW9uZV9rZXlf
ZW50ZXJfcHJvcHNbXSA9IHsKPiB8LS0tLS0tLVBST1BFUlRZX0VOVFJZX1UzMigibGludXgsY29k
ZSIsIEtFWV9FTlRFUiksCj4gfC0tLS0tLS1QUk9QRVJUWV9FTlRSWV9TVFJJTkcoImxhYmVsIiwg
ImVudGVyIiksCj4gfC0tLS0tLS1QUk9QRVJUWV9FTlRSWV9SRUYoImdwaW9zIiwgJmdwaW9fYmFu
a19iX25vZGUsIDEyMywgR1BJT19BQ1RJVkVfTE9XKSwKPiB8LS0tLS0tLXsgfQo+IH07Cj4gCj4g
SWYgd2UgYWdyZWUgaW4gcHJpbmNpcGxlLCBJIHdvdWxkIGxpa2UgdG8gaGF2ZSB0aGUgdmVyeSBm
aXJzdCAzIHBhdGNoZXMKPiBpbiBhbiBpbW11dGFibGUgYnJhbmNoIG9mZiBtYXliZSAtcmM4IHNv
IHRoYXQgaXQgY2FuIGJlIHB1bGxlZCBpbnRvCj4gaW5kaXZpZHVhbCBzdWJzeXN0ZW1zIHNvIHRo
YXQgcGF0Y2hlcyBzd2l0Y2hpbmcgdmFyaW91cyBkcml2ZXJzIHRvCj4gZndub2RlX2dwaW9kX2dl
dF9pbmRleCgpIGNvdWxkIGJlIGFwcGxpZWQuCgpGV0lXLApSZXZpZXdlZC1ieTogQW5keSBTaGV2
Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+Cgpmb3IgcGF0Y2hlcyAx
LTggYWZ0ZXIgYWRkcmVzc2luZyBtaW5vciBpc3N1ZXMuCkknbGwgcmV2aWV3IHRoZSByZXN0IGxh
dGVyIG9uLgoKPiAKPiBUaGFua3MsCj4gRG1pdHJ5Cj4gCj4gRG1pdHJ5IFRvcm9raG92ICgxMSk6
Cj4gICBncGlvbGliOiBvZjogYWRkIGEgZmFsbGJhY2sgZm9yIHdsZixyZXNldCBHUElPIG5hbWUK
PiAgIGdwaW9saWI6IGludHJvZHVjZSBkZXZtX2Z3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKQo+ICAg
Z3Bpb2xpYjogaW50cm9kdWNlIGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKQo+ICAgbmV0OiBwaHls
aW5rOiBzd2l0Y2ggdG8gdXNpbmcgZndub2RlX2dwaW9kX2dldF9pbmRleCgpCj4gICBuZXQ6IG1k
aW86IHN3aXRjaCB0byB1c2luZyBmd25vZGVfZ3Bpb2RfZ2V0X2luZGV4KCkKPiAgIGRybS9icmlk
Z2U6IHRpLXRmcDQxMDogc3dpdGNoIHRvIHVzaW5nIGZ3bm9kZV9ncGlvZF9nZXRfaW5kZXgoKQo+
ICAgZ3BsaW9saWI6IG1ha2UgZndub2RlX2dldF9uYW1lZF9ncGlvZCgpIHN0YXRpYwo+ICAgZ3Bp
b2xpYjogb2Y6IHRlYXNlIGFwYXJ0IG9mX2ZpbmRfZ3BpbygpCj4gICBncGlvbGliOiBvZjogdGVh
c2UgYXBhcnQgYWNwaV9maW5kX2dwaW8oKQo+ICAgZ3Bpb2xpYjogY29uc29saWRhdGUgZndub2Rl
IEdQSU8gbG9va3Vwcwo+ICAgZ3Bpb2xpYjogYWRkIHN1cHBvcnQgZm9yIHNvZnR3YXJlIG5vZGVz
Cj4gCj4gIGRyaXZlcnMvZ3Bpby9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwo+ICBkcml2
ZXJzL2dwaW8vZ3Bpb2xpYi1hY3BpLmMgICAgICAgIHwgMTUzICsrKysrKysrKysrKysrLS0tLS0t
LS0tLQo+ICBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1hY3BpLmggICAgICAgIHwgIDIxICsrLS0KPiAg
ZHJpdmVycy9ncGlvL2dwaW9saWItZGV2cmVzLmMgICAgICB8ICAzMyArKy0tLS0KPiAgZHJpdmVy
cy9ncGlvL2dwaW9saWItb2YuYyAgICAgICAgICB8IDE1OSArKysrKysrKysrKysrKy0tLS0tLS0t
LS0tCj4gIGRyaXZlcnMvZ3Bpby9ncGlvbGliLW9mLmggICAgICAgICAgfCAgMjYgKystLQo+ICBk
cml2ZXJzL2dwaW8vZ3Bpb2xpYi1zd25vZGUuYyAgICAgIHwgIDkyICsrKysrKysrKysrKysrKwo+
ICBkcml2ZXJzL2dwaW8vZ3Bpb2xpYi1zd25vZGUuaCAgICAgIHwgIDEzICsrCj4gIGRyaXZlcnMv
Z3Bpby9ncGlvbGliLmMgICAgICAgICAgICAgfCAxODQgKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYyB8ICAgNCArLQo+ICBk
cml2ZXJzL25ldC9waHkvbWRpb19idXMuYyAgICAgICAgIHwgICA0ICstCj4gIGRyaXZlcnMvbmV0
L3BoeS9waHlsaW5rLmMgICAgICAgICAgfCAgIDQgKy0KPiAgaW5jbHVkZS9saW51eC9ncGlvL2Nv
bnN1bWVyLmggICAgICB8ICA1MyArKysrKystLS0KPiAgMTMgZmlsZXMgY2hhbmdlZCwgNDcxIGlu
c2VydGlvbnMoKyksIDI3NiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3Bpby9ncGlvbGliLXN3bm9kZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
aW8vZ3Bpb2xpYi1zd25vZGUuaAo+IAo+IC0tIAo+IDIuMjMuMC4xNjIuZzBiOWZiYjM3MzQtZ29v
Zwo+IAoKLS0gCldpdGggQmVzdCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
