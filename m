Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BD9E1C26
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 15:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B47E6EA9B;
	Wed, 23 Oct 2019 13:18:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9264E6EA9B
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 13:18:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 06:18:12 -0700
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; d="scan'208";a="191826942"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Oct 2019 06:18:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] drm/virtio: print a single line with device features
In-Reply-To: <20191022090533.GB11828@phenom.ffwll.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191018113832.5460-1-kraxel@redhat.com>
 <20191022090533.GB11828@phenom.ffwll.local>
Date: Wed, 23 Oct 2019 16:18:06 +0300
Message-ID: <87mudreh2p.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCAyMiBPY3QgMjAxOSwgRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPiB3cm90
ZToKPiBPbiBGcmksIE9jdCAxOCwgMjAxOSBhdCAwMTozODozMlBNICswMjAwLCBHZXJkIEhvZmZt
YW5uIHdyb3RlOgo+PiBTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0
LmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMgfCA5
ICsrKystLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlv
bnMoLSkKPj4gCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMKPj4gaW5kZXggMGIz
Y2RiMGQ4M2IwLi4yZjU3NzNlNDM1NTcgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92
aXJ0aW8vdmlydGdwdV9rbXMuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRn
cHVfa21zLmMKPj4gQEAgLTE1NSwxNiArMTU1LDE1IEBAIGludCB2aXJ0aW9fZ3B1X2luaXQoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikKPj4gICNpZmRlZiBfX0xJVFRMRV9FTkRJQU4KPj4gIAlpZiAo
dmlydGlvX2hhc19mZWF0dXJlKHZnZGV2LT52ZGV2LCBWSVJUSU9fR1BVX0ZfVklSR0wpKQo+PiAg
CQl2Z2Rldi0+aGFzX3ZpcmdsXzNkID0gdHJ1ZTsKPj4gLQlEUk1fSU5GTygidmlyZ2wgM2QgYWNj
ZWxlcmF0aW9uICVzXG4iLAo+PiAtCQkgdmdkZXYtPmhhc192aXJnbF8zZCA/ICJlbmFibGVkIiA6
ICJub3Qgc3VwcG9ydGVkIGJ5IGhvc3QiKTsKPj4gLSNlbHNlCj4+IC0JRFJNX0lORk8oInZpcmds
IDNkIGFjY2VsZXJhdGlvbiBub3Qgc3VwcG9ydGVkIGJ5IGd1ZXN0XG4iKTsKPj4gICNlbmRpZgo+
PiAgCWlmICh2aXJ0aW9faGFzX2ZlYXR1cmUodmdkZXYtPnZkZXYsIFZJUlRJT19HUFVfRl9FRElE
KSkgewo+PiAgCQl2Z2Rldi0+aGFzX2VkaWQgPSB0cnVlOwo+PiAtCQlEUk1fSU5GTygiRURJRCBz
dXBwb3J0IGF2YWlsYWJsZS5cbiIpOwo+PiAgCX0KPj4gIAo+PiArCURSTV9JTkZPKCJmZWF0dXJl
czogJWN2aXJnbCAlY2VkaWRcbiIsCj4+ICsJCSB2Z2Rldi0+aGFzX3ZpcmdsXzNkID8gJysnIDog
Jy0nLAo+PiArCQkgdmdkZXYtPmhhc19lZGlkICAgICA/ICcrJyA6ICctJyk7Cj4KPiBNYXliZSB3
ZSBzaG91bGQgbW92ZSB0aGUgdmFyaW91cyB5ZXNuby9vbm9mZi9lbmFibGVkZGlzYWJsZWQgaGVs
cGVycyBmcm9tCj4gaTkxNV91dGlscy5oIHRvIGRybV91dGlscy5oIGFuZCB1c2UgdGhlbSBtb3Jl
IHdpZGVseT8KCkknbSB0cnlpbmcgdG8gdGFrZSBpdCBvbmUgc3RlcCBmdXJ0aGVyIGJ5IGFkZGlu
ZyB0aGVtIHRvCmluY2x1ZGUvbGludXgvc3RyaW5nLWNob2ljZS5oIFsxXS4gTWF5YmUsIHVoLCBm
b3VydGggdGltZSdzIHRoZSBjaGFybT8KCkJSLApKYW5pLgoKWzFdIGh0dHA6Ly9sb3JlLmtlcm5l
bC5vcmcvci8yMDE5MTAyMzEzMTMwOC45NDIwLTEtamFuaS5uaWt1bGFAaW50ZWwuY29tCgoKLS0g
CkphbmkgTmlrdWxhLCBJbnRlbCBPcGVuIFNvdXJjZSBHcmFwaGljcyBDZW50ZXIKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
