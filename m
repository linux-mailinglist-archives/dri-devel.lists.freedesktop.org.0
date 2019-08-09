Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA8288464
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 23:06:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9186EE9F;
	Fri,  9 Aug 2019 21:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886406EE9F
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 21:06:11 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CCE36803FE;
 Fri,  9 Aug 2019 23:06:08 +0200 (CEST)
Date: Fri, 9 Aug 2019 23:06:07 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm: Fix kerneldoc warns in connector-related docs
Message-ID: <20190809210607.GA852@ravnborg.org>
References: <20190807162808.119141-1-sean@poorly.run>
 <20190807173023.GA30025@ravnborg.org>
 <20190809190553.GD104440@art_vandelay>
 <20190809201551.GA30284@ravnborg.org>
 <20190809202911.GE104440@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809202911.GE104440@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=ntk0H4uNWa1CpODchSAA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2Vhbi4KCj4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+
ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ID4gPiA+ID4gQEAgLTU0
Myw4ICs1NDMsOCBAQCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSB7Cj4gPiA+ID4gPiAgCSAq
Cj4gPiA+ID4gPiAgCSAqIFRoaXMgaXMgYWxzbyB1c2VkIGluIHRoZSBhdG9taWMgaGVscGVycyB0
byBtYXAgZW5jb2RlcnMgdG8gdGhlaXIKPiA+ID4gPiA+ICAJICogY3VycmVudCBhbmQgcHJldmlv
dXMgY29ubmVjdG9ycywgc2VlCj4gPiA+ID4gPiAtCSAqICZkcm1fYXRvbWljX2dldF9vbGRfY29u
bmVjdG9yX2Zvcl9lbmNvZGVyKCkgYW5kCj4gPiA+ID4gPiAtCSAqICZkcm1fYXRvbWljX2dldF9u
ZXdfY29ubmVjdG9yX2Zvcl9lbmNvZGVyKCkuCj4gPiA+ID4gPiArCSAqICZkcm1fYXRvbWljX2dl
dF9vbGRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyIGFuZAo+ID4gPiA+ID4gKwkgKiAmZHJtX2F0b21p
Y19nZXRfbmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2Rlci4KPiA+ID4gPiBQbGVhc2UgZml4IHRoaXMg
dG8gdXNlICgpIGZvciB0aGUgZnVuY3Rpb25zIGFuZCBkcm9wIHRoZSAiJiIuCj4gPiA+ID4gVGhp
cyBpcyB3aGF0IHdlIHVzZSBpbiBkcm0ga2VybmVsLWRvYyBmb3IgZnVuY3Rpb25zLgo+ID4gPiA+
IFNlZSBmb3IgZXhhbXBsZSBmdW5jdGlvbiByZWZlcmVuY2VzIGluIGRvYyBvZiB3cml0ZWJhY2tf
am9iIGluIHRoZSBzYW1lIGZpbGUuCj4gPiA+IAo+ID4gPiBEb2luZyB0aGlzIHdvbid0IGdldCBh
IGh5cGVybGluayBpbiB0aGUgZG9jcy4gSXQgc2VlbXMgbGlrZSB0aGVzZSBob29rcyBhcmVuJ3QK
PiA+ID4gcmVjb2duaXplZCBhcyBmdW5jdGlvbnMgYnkgc3BoaW54IChub3Qgc3VyZSBkaWRuJ3Qg
bG9vayBpbnRvIGl0IHRvbyBkZWVwbHkpLiBUaGUKPiA+ID4gb3RoZXIgIl9mdW5jcy4qIiBob29r
cyBhcmUgYWxzbyBoYW5kbGVkIHdpdGggJyYnICh0aGVyZSBhcmUgbG90cyBvZiBleGFtcGxlcyBp
bgo+ID4gPiBkcm1fY29ubmVjdG9yLmgpLgo+ID4gPiAKPiA+ID4gSSB0aGluayBwcmVzZXJ2aW5n
IHRoZSBoeXBlcmxpbmtzIHByb2JhYmx5IG91dHdlaWdocyB0aGUgbWlzc2luZyAoKSwgdGhvdWdo
dHM/Cj4gPiAKPiA+IEhtbSwgSSBhY3R1YWxseSB0ZXN0ZWQgaXQgaGVyZSAtIHdpdGggc3BoaW54
XzEuNC45Lgo+ID4gVGhlIGxpbmtzIHdhcyBwcmVzZXJ2ZWQsIHRoZSBvbmx5IGRpZmZlcmVuY2Ug
d2FzIHRoYXQgdGhleSBoYWQgdGhlICgpCj4gPiBwcmVmaXhlZCB0byB0aGVpciBuYW1lLgo+ID4g
Cj4gPiBEbyB5b3UgaGFwcGVuIHRvIHVzZSBhbiBvbGRlciBzcGhpbnggdmVyc2lvbj8KPiAKPiBJ
J20gb24gMS43LjkuIEkganVzdCByZWNoZWNrZWQgYW5kIHdhcyBhIGJpdCBjb25mdXNlZCBpbiBt
eSBsYXN0IG1haWwuIFRoZQo+IGRybV9hdG9taWNfZ2V0XypfY29ubmVjdG9yX2Zvcl9lbmNvZGVy
IGxpbmtzIGRvIHdvcmsgd2l0aCAoKSwgaXQncyB0aGUgb25lcwo+IGRybV9jb25uZWN0b3JfaGVs
cGVyX2Z1bmNzIGluIHRoZSBwYXJhZ3JhcGggYWJvdmUgdGhhdCBuZWVkIHRoZSAnJicuIFNvIEkn
bGwKPiBzd2l0Y2ggdXAgdGhlc2UgMiBhbmQgbGVhdmUgdGhlIG90aGVycyBhcy1pcy4gQ29vbD8K
UGVyZmVjdCEKCllvdSBjYW4gYWRkIG15OgoKUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KCmFuZCB0aGVuIGFwcGx5LgoKCVNhbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
