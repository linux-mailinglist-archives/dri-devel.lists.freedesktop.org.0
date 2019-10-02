Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE99DC8E66
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC7789F63;
	Wed,  2 Oct 2019 16:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1658A89F63
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:32:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Oct 2019 09:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,249,1566889200"; d="scan'208";a="190991887"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 02 Oct 2019 09:31:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 02 Oct 2019 19:31:47 +0300
Date: Wed, 2 Oct 2019 19:31:47 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH] drm: Fix comment doc for format_modifiers
Message-ID: <20191002163147.GB1208@intel.com>
References: <20191002154349.26895-1-andrzej.p@collabora.com>
 <20191002161822.GA1208@intel.com>
 <51583e96-6a2c-b945-5bc8-ff0dd5e33e4e@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51583e96-6a2c-b945-5bc8-ff0dd5e33e4e@collabora.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMDIsIDIwMTkgYXQgMDY6MjI6MjNQTSArMDIwMCwgQW5kcnplaiBQaWV0cmFz
aWV3aWN6IHdyb3RlOgo+IEhpIFZpbGxlLAo+IAo+IFcgZG5pdSAwMi4xMC4yMDE5IG/CoDE4OjE4
LCBWaWxsZSBTeXJqw6Rsw6QgcGlzemU6Cj4gPiBPbiBXZWQsIE9jdCAwMiwgMjAxOSBhdCAwNTo0
Mzo0OVBNICswMjAwLCBBbmRyemVqIFBpZXRyYXNpZXdpY3ogd3JvdGU6Cj4gPj4gVG8gaHVtYW4g
cmVhZGVycwo+ID4+Cj4gPj4gImFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0IG1vZGlmaWVycyIg
aXMgYWxtb3N0IGluZGlzdGluZ3Vpc2hhYmxlIGZyb20KPiA+PiAiYXJyYXkgb2Ygc3RydWN0IGRy
bV9mb3JtYXRfbW9kaWZpZXJzIiwKPiA+IAo+ID4gVW5sZXNzIEknbSBibGluZCB0aG9zZSB0d28g
KmFyZSogaW5kaXN0aW5ndWlzaGFibGUgOlAKPiA+IAo+ID4+IGVzcGVjaWFsbHkgZ2l2ZW4gdGhh
dAo+ID4+IHN0cnVjdCBkcm1fZm9ybWF0X21vZGlmaWVyIGRvZXMgZXhpc3QuCj4gPj4KPiA+PiBB
bmQgaW5kZWVkIHRoZSBwYXJhbWV0ZXIgcGFzc2VzIGFuIGFycmF5IG9mIHVpbnQ2NF90IHJhdGhl
ciB0aGFuIGFuIGFycmF5Cj4gPj4gb2Ygc3RydWN0cywgYnV0IHRoZSBmaXJzdCB3b3JkcyBvZiB0
aGUgY29tbWVudCBzdWdnZXN0IHRoYXQgaXQgcGFzc2VzCj4gPj4gYW4gYXJyYXkgb2Ygc3RydWN0
cy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnpl
ai5wQGNvbGxhYm9yYS5jb20+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX3Bs
YW5lLmMgfCAyICstCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiA+PiBpbmRleCBkNmFkNjBhYjBkMzgu
LmRmMDVkOGEwZGQ2MyAxMDA2NDQKPiA+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5l
LmMKPiA+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3BsYW5lLmMKPiA+PiBAQCAtMTYwLDcg
KzE2MCw3IEBAIHN0YXRpYyBpbnQgY3JlYXRlX2luX2Zvcm1hdF9ibG9iKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lCj4gPiAKPiA+IExvb2tzIGxpa2UgeW91
IGhhdmUgYSBicm9rZW4gdmVyc2lvbiBvZiBnaXQuCj4gPiAKPiA+PiAgICAqIEBmdW5jczogY2Fs
bGJhY2tzIGZvciB0aGUgbmV3IHBsYW5lCj4gPj4gICAgKiBAZm9ybWF0czogYXJyYXkgb2Ygc3Vw
cG9ydGVkIGZvcm1hdHMgKERSTV9GT1JNQVRcX1wqKQo+ID4+ICAgICogQGZvcm1hdF9jb3VudDog
bnVtYmVyIG9mIGVsZW1lbnRzIGluIEBmb3JtYXRzCj4gPj4gLSAqIEBmb3JtYXRfbW9kaWZpZXJz
OiBhcnJheSBvZiBzdHJ1Y3QgZHJtX2Zvcm1hdCBtb2RpZmllcnMgdGVybWluYXRlZCBieQo+ID4+
ICsgKiBAZm9ybWF0X21vZGlmaWVyczogYXJyYXkgb2YgbW9kaWZpZXJzIG9mIHN0cnVjdCBkcm1f
Zm9ybWF0IHRlcm1pbmF0ZWQgYnkKPiA+IAo+ID4gTm93IGl0IHNlZW1zIHRvIGJlIHNheWluZyBp
dCdzIHBhc3NpbmcgaW4gc3RydWN0IGRybV9mb3JtYXQgZm9vW10uCj4gPiBUaGF0IGRvZXNuJ3Qg
c2VlbSByaWdodCBlaXRoZXIuCj4gCj4gR29vZCBwb2ludCEKPiAKPiBhcnJheSBvZiBtb2RpZmll
cnMgYXBwbGllZCB0byBzdHJ1Y3QgZHJtX2Zvcm1hdD8KCk5vdCBzdXJlIHdoYXQgdGhpcyBoYXMg
dG8gZG8gd2l0aCB0aGF0IHN0cnVjdD8KCkkgdGhpbmsgSSdkIGp1c3QgbWFrZSBpdCAiYXJyYXkg
b2YgbW9kaWZpZXJzIHRlcm1pbmF0ZWQgYnkgLi4uIgoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRl
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
