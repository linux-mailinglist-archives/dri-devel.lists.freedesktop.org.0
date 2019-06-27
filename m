Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE4358310
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 15:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827596E36F;
	Thu, 27 Jun 2019 13:03:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363B76E321;
 Thu, 27 Jun 2019 13:03:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jun 2019 06:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,423,1557212400"; d="scan'208";a="156230435"
Received: from math-mobl1.ger.corp.intel.com (HELO [10.252.62.64])
 ([10.252.62.64])
 by orsmga008.jf.intel.com with ESMTP; 27 Jun 2019 06:03:10 -0700
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-next-fixes
Message-ID: <20a62234-bc27-00eb-e0e2-22b55eec1cb2@linux.intel.com>
Date: Thu, 27 Jun 2019 15:03:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
Content-Language: en-US
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
Cc: dim-tools@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 intel-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtLW1pc2MtbmV4dC1maXhlcy0yMDE5LTA2LTI3OgotIEZpeGVzIHRvIHRoZSB0ZnA0MTAgYnJp
ZGdlLgotIFNtYWxsIGJ1aWxkIGZpeCBmb3IgdmdhX3N3aXRjaGVyb28gdG8gcHJldmVudCBidWls
ZGluZyBhZ2FpbnN0IG1vZHVsYXIgZmJjb24uCgpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2Ug
Y29tbWl0IDgwZDQyZGIwMmIzYTViZWI4Y2ZmYmEwODIwN2FkZjVmNGM1MjVlZTM6CgogIGRybS9l
ZGlkOiB1c2UgZm9yX2VhY2hfZGlzcGxheWlkX2RiIHdoZXJlIGFwcGxpY2FibGUgKDIwMTktMDYt
MjUgMTQ6NDQ6MDMgKzEwMDApCgphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVwb3NpdG9yeSBh
dDoKCiAgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS1taXNjIHRhZ3MvZHJt
LW1pc2MtbmV4dC1maXhlcy0yMDE5LTA2LTI3Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gZGFlZDI3N2U0ZDVhY2UwODgzZDMwYjliZTI0NWQzNWM0NjI4OWY0OToKCiAgTWVyZ2UgdGFn
ICd0b3BpYy9yZW1vdmUtZmJjb24tbm90aWZpZXJzLTIwMTktMDYtMjYnIGludG8gZHJtLW1pc2Mt
bmV4dC1maXhlcyAoMjAxOS0wNi0yNiAxMjoyNjozNCArMDIwMCkKCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KZHJtLW1pc2Mt
bmV4dC1maXhlcyBmb3IgdjUuMzoKLSBGaXhlcyB0byB0aGUgdGZwNDEwIGJyaWRnZS4KLSBTbWFs
bCBidWlsZCBmaXggZm9yIHZnYV9zd2l0Y2hlcm9vIHRvIHByZXZlbnQgYnVpbGRpbmcgYWdhaW5z
dCBtb2R1bGFyIGZiY29uLgoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpEYW5pZWwgVmV0dGVyICgxKToKICAgICAgdmdhX3N3
aXRjaGVyb286IERlcGVuZCB1cG9uIGZiY29uIGJlaW5nIGJ1aWx0LWluLCBpZiBlbmFibGVkCgpN
YWFydGVuIExhbmtob3JzdCAoMik6CiAgICAgIE1lcmdlIHJlbW90ZS10cmFja2luZyBicmFuY2gg
J2RybS9kcm0tbmV4dCcgaW50byBkcm0tbWlzYy1uZXh0LWZpeGVzCiAgICAgIE1lcmdlIHRhZyAn
dG9waWMvcmVtb3ZlLWZiY29uLW5vdGlmaWVycy0yMDE5LTA2LTI2JyBpbnRvIGRybS1taXNjLW5l
eHQtZml4ZXMKClRvbWkgVmFsa2VpbmVuICgyKToKICAgICAgZHJtL2JyaWRnZTogdGZwNDEwOiBm
aXggbWVtbGVhayBpbiBnZXRfbW9kZXMoKQogICAgICBkcm0vYnJpZGdlOiB0ZnA0MTA6IGZpeCB1
c2Ugb2YgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90
aS10ZnA0MTAuYyB8IDEwICsrKysrKysrLS0KIGRyaXZlcnMvZ3B1L3ZnYS9LY29uZmlnICAgICAg
ICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
