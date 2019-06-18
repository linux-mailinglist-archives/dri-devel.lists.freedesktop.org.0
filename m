Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE64A9BD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 20:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7B26E200;
	Tue, 18 Jun 2019 18:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B066E200;
 Tue, 18 Jun 2019 18:25:12 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Jun 2019 11:25:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,390,1557212400"; d="scan'208";a="243073205"
Received: from abureevx-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.23.218])
 by orsmga001.jf.intel.com with ESMTP; 18 Jun 2019 11:25:09 -0700
Date: Tue, 18 Jun 2019 19:25:08 +0100
From: Eric Engestrom <eric.engestrom@intel.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/todo: Update drm_gem_object_funcs todo even more
Message-ID: <20190618182508.lp6n4zcgxj7lsu6l@intel.com>
References: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
 <20190618140241.19856-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190618140241.19856-1-daniel.vetter@ffwll.ch>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
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
Cc: David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgMjAxOS0wNi0xOCAxNjowMjo0MSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90
ZToKPiBJIHJ1c2hlZCBtZXJnaW5nIHRoaXMgYSBiaXQgdG9vIG11Y2gsIGFuZCBOb3JhbGYgcG9p
bnRlZCBvdXQgdGhhdAo+IHdlJ3JlIGEgbG90IGJldHRlciBhbHJlYWR5IGFuZCBoYXZlIG1hZGUg
Z3JlYXQgcHJvZ3Jlc3MuCj4gCj4gTGV0J3MgdHJ5IGFnYWluLgo+IAo+IEZpeGVzOiA0MmRiYmI0
YjU0YTMgKCJkcm0vdG9kbzogQWRkIG5ldyBkZWJ1Z2ZzIHRvZG8iKQo+IENjOiBHcmVnIEtyb2Fo
LUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxp
bnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IE1hYXJ0
ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1h
eGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8
c2VhbkBwb29ybHkucnVuPgo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4KPiBDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+Cj4gQ2M6IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gQ2M6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRy
b25uZXMub3JnPgo+IENjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IENjOiBHZXJk
IEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9ncHUv
dG9kby5yc3QgfCA4ICsrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8u
cnN0IGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKPiBpbmRleCAyNTg3OGRkMDQ4ZmQuLjY2
YzEyMzczN2MzZCAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0Cj4gQEAgLTIxMiw5ICsyMTIsMTEgQEAgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzCj4gIEdFTSBvYmplY3RzIGNhbiBub3cgaGF2ZSBhIGZ1
bmN0aW9uIHRhYmxlIGluc3RlYWQgb2YgaGF2aW5nIHRoZSBjYWxsYmFja3Mgb24gdGhlCj4gIERS
TSBkcml2ZXIgc3RydWN0LiBUaGlzIGlzIG5vdyB0aGUgcHJlZmVycmVkIHdheSBhbmQgZHJpdmVy
cyBjYW4gYmUgbW92ZWQgb3Zlci4KPiAgCj4gLVVuZm9ydHVuYXRlbHkgc29tZSBvZiB0aGUgcmVj
ZW50bHkgYWRkZWQgR0VNIGhlbHBlcnMgYXJlIGdvaW5nIGluIHRoZSB3cm9uZwo+IC1kaXJlY3Rp
b24gYnkgYWRkaW5nIE9QUyBtYWNyb3MgdGhhdCB1c2UgdGhlIG9sZCwgZGVwcmVjYXRlZCBob29r
cy4gU2VlCj4gLURSTV9HRU1fQ01BX1ZNQVBfRFJJVkVSX09QUywgRFJNX0dFTV9TSE1FTV9EUklW
RVJfT1BTLCBhbmQgRFJNX0dFTV9WUkFNX0RSSVZFUl9QUklNRS4KPiArRFJNX0dFTV9DTUFfVk1B
UF9EUklWRVJfT1BTLCBEUk1fR0VNX1NITUVNX0RSSVZFUl9PUFMgYWxyZWFkeSBzdXBwb3J0IHRo
aXMsIGJ1dAo+ICtEUk1fR0VNX1ZSQU1fRFJJVkVSX1BSSU1FIGRvZXMgbm90IHlldCBhbmQgbmVl
ZHMgdG8gYmUgYWxpZ2VuZCB3aXRoIHRoZSBwcmV2aW91cwoKcy9hbGlnZW5kL2FsaWduZWQvCgo+
ICt0d28uIFdlIGFsc28gbmVlZCBhIDJuZCB2ZXJzaW9uIG9mIHRoZSBDTUEgZGVmaW5lIHRoYXQg
ZG9lc24ndCByZXF1aXJlIHRoZQo+ICt2bWFwcGluZyB0byBiZSBwcmVzZW50IChkaWZmZXJlbnQg
aG9vayBmb3IgcHJpbWUgaW1wb3J0aW5nKS4gUGx1cyB0aGlzIG5lZWRzIHRvCj4gK2JlIHJvbGxl
ZCBvdXQgdG8gYWxsIGRyaXZlcnMgdXNpbmcgdGhlaXIgb3duIGltcGxlbWVudGF0aW9ucywgdG9v
Lgo+ICAKPiAgVXNlIERSTV9NT0RFU0VUX0xPQ0tfQUxMXyogaGVscGVycyBpbnN0ZWFkIG9mIGJv
aWxlcnBsYXRlCj4gIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQo+IC0tIAo+IDIuMjAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
