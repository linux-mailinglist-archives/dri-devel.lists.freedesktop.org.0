Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34816C8E1D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 313106E876;
	Wed,  2 Oct 2019 16:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940DC6E876
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:18:27 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 09:18:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; d="scan'208";a="203644059"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 02 Oct 2019 09:18:23 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2019 19:18:22 +0300
Date: Wed, 2 Oct 2019 19:18:22 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
Message-ID: <20191002161822.GA1208@intel.com>
References: <20191002154349.26895-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191002154349.26895-1-andrzej.p@collabora.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 kernel@collabora.com, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDU6NDM6NDlQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IFRvIGh1bWFuIHJlYWRlcnMKPiAKPiAiYXJyYXkgb2Ygc3RydWN0IGRy
bV9mb3JtYXQgbW9kaWZpZXJzIiBpcyBhbG1vc3QgaW5kaXN0aW5ndWlzaGFibGUgZnJvbQo+ICJh
cnJheSBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdF9tb2RpZmllcnMiLAoKVW5sZXNzIEknbSBibGluZCB0
aG9zZSB0d28gKmFyZSogaW5kaXN0aW5ndWlzaGFibGUgOlAKCj4gZXNwZWNpYWxseSBnaXZlbiB0
aGF0Cj4gc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgZG9lcyBleGlzdC4KPiAKPiBBbmQgaW5k
ZWVkIHRoZSBwYXJhbWV0ZXIgcGFzc2VzIGFuIGFycmF5IG9mIHVpbnQ2NF90IHJhdGhlciB0aGFu
IGFuIGFycmF5Cj4gb2Ygc3RydWN0cywgYnV0IHRoZSBmaXJzdCB3b3JkcyBvZiB0aGUgY29tbWVu
dCBzdWdnZXN0IHRoYXQgaXQgcGFzc2VzCj4gYW4gYXJyYXkgb2Ygc3RydWN0cy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCAyICstCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMK
PiBpbmRleCBkNmFkNjBhYjBkMzguLmRmMDVkOGEwZGQ2MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMK
PiBAQCAtMTYwLDcgKzE2MCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lCgpMb29rcyBsaWtl
IHlvdSBoYXZlIGEgYnJva2VuIHZlcnNpb24gb2YgZ2l0LgoKPiAgICogQGZ1bmNzOiBjYWxsYmFj
a3MgZm9yIHRoZSBuZXcgcGxhbmUKPiAgICogQGZvcm1hdHM6IGFycmF5IG9mIHN1cHBvcnRlZCBm
b3JtYXRzIChEUk1fRk9STUFUXF9cKikKPiAgICogQGZvcm1hdF9jb3VudDogbnVtYmVyIG9mIGVs
ZW1lbnRzIGluIEBmb3JtYXRzCj4gLSAqIEBmb3JtYXRfbW9kaWZpZXJzOiBhcnJheSBvZiBzdHJ1
Y3QgZHJtX2Zvcm1hdCBtb2RpZmllcnMgdGVybWluYXRlZCBieQo+ICsgKiBAZm9ybWF0X21vZGlm
aWVyczogYXJyYXkgb2YgbW9kaWZpZXJzIG9mIHN0cnVjdCBkcm1fZm9ybWF0IHRlcm1pbmF0ZWQg
YnkKCk5vdyBpdCBzZWVtcyB0byBiZSBzYXlpbmcgaXQncyBwYXNzaW5nIGluIHN0cnVjdCBkcm1f
Zm9ybWF0IGZvb1tdLgpUaGF0IGRvZXNuJ3Qgc2VlbSByaWdodCBlaXRoZXIuCgo+ICAgKiAgICAg
ICAgICAgICAgICAgICAgRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRAo+ICAgKiBAdHlwZTogdHlwZSBv
ZiBwbGFuZSAob3ZlcmxheSwgcHJpbWFyeSwgY3Vyc29yKQo+ICAgKiBAbmFtZTogcHJpbnRmIHN0
eWxlIGZvcm1hdCBzdHJpbmcgZm9yIHRoZSBwbGFuZSBuYW1lLCBvciBOVUxMIGZvciBkZWZhdWx0
IG5hbWUKPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
