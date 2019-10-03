Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D1DC9FE1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 15:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5074F6E9DF;
	Thu,  3 Oct 2019 13:53:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B736E9DF
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 13:53:23 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Oct 2019 06:53:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; d="scan'208";a="192127166"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 03 Oct 2019 06:53:19 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 03 Oct 2019 16:53:18 +0300
Date: Thu, 3 Oct 2019 16:53:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
Message-ID: <20191003135318.GH1208@intel.com>
References: <20191002183011.GA29177@ravnborg.org>
 <20191003075118.6257-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191003075118.6257-1-andrzej.p@collabora.com>
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

T24gVGh1LCBPY3QgMDMsIDIwMTkgYXQgMDk6NTE6MThBTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IFRvIGh1bWFuIHJlYWRlcnMKClRoZSBjb21taXQgbWVzc2FnZSBpcyBh
bHdheXMgZm9yIGh1bWFuIHJlYWRlcnMsIG5vIG5lZWQgdG8gcG9pbnQgdGhhdApvdXQuLi4KCj4g
Cj4gImFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0IG1vZGlmaWVycyIgaXMgYWxtb3N0IGluZGlz
dGluZ3Vpc2hhYmxlIGZyb20KPiAiYXJyYXkgb2Ygc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXJz
IiwgZXNwZWNpYWxseSBnaXZlbiB0aGF0Cj4gc3RydWN0IGRybV9mb3JtYXRfbW9kaWZpZXIgZG9l
cyBleGlzdC4KCi4uYnV0IHRoaXMgcGFyYWdyYXBoIHN0aWxsIG1hbmFnZXMgdG8gMTAwJSBjb25m
dXNlIHRoaXMgcGFydGljdWxhciBodW1hbi4KClRoZSBhY3R1YWwgY29kZSBjaGFuZ2VzIGxndG0s
IHNvIHdpdGggdGhlIGNvbW1pdCBtZXNzYWdlIHJld29yZGVkCnRoaXMgcGF0Y2ggaXMKUmV2aWV3
ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cgo+
IAo+IEFuZCBpbmRlZWQgdGhlIHBhcmFtZXRlciBwYXNzZXMgYW4gYXJyYXkgb2YgdWludDY0X3Qg
cmF0aGVyIHRoYW4gYW4gYXJyYXkKPiBvZiBzdHJ1Y3RzLCBidXQgdGhlIGZpcnN0IHdvcmRzIG9m
IHRoZSBjb21tZW50IHN1Z2dlc3QgdGhhdCBpdCBwYXNzZXMKPiAKPiBTaWduZWQtb2ZmLWJ5OiBB
bmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiBpbmRleCBkNmFk
NjBhYjBkMzguLjBkNGY5MTcyYzBkZCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X3BsYW5lLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiBAQCAtMTYwLDcg
KzE2MCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lCj4gICAqIEBmdW5jczogY2FsbGJhY2tz
IGZvciB0aGUgbmV3IHBsYW5lCj4gICAqIEBmb3JtYXRzOiBhcnJheSBvZiBzdXBwb3J0ZWQgZm9y
bWF0cyAoRFJNX0ZPUk1BVFxfXCopCj4gICAqIEBmb3JtYXRfY291bnQ6IG51bWJlciBvZiBlbGVt
ZW50cyBpbiBAZm9ybWF0cwo+IC0gKiBAZm9ybWF0X21vZGlmaWVyczogYXJyYXkgb2Ygc3RydWN0
IGRybV9mb3JtYXQgbW9kaWZpZXJzIHRlcm1pbmF0ZWQgYnkKPiArICogQGZvcm1hdF9tb2RpZmll
cnM6IGFycmF5IG9mIGZvcm1hdCBtb2RpZmllcnMgdGVybWluYXRlZCBieQo+ICAgKiAgICAgICAg
ICAgICAgICAgICAgRFJNX0ZPUk1BVF9NT0RfSU5WQUxJRAo+ICAgKiBAdHlwZTogdHlwZSBvZiBw
bGFuZSAob3ZlcmxheSwgcHJpbWFyeSwgY3Vyc29yKQo+ICAgKiBAbmFtZTogcHJpbnRmIHN0eWxl
IGZvcm1hdCBzdHJpbmcgZm9yIHRoZSBwbGFuZSBuYW1lLCBvciBOVUxMIGZvciBkZWZhdWx0IG5h
bWUKPiAtLSAKPiAyLjE3LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
