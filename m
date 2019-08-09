Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6CC883BA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 22:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1A46EE92;
	Fri,  9 Aug 2019 20:15:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 056C86EE92
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 20:15:57 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B2BDE8043C;
 Fri,  9 Aug 2019 22:15:52 +0200 (CEST)
Date: Fri, 9 Aug 2019 22:15:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH] drm: Fix kerneldoc warns in connector-related docs
Message-ID: <20190809201551.GA30284@ravnborg.org>
References: <20190807162808.119141-1-sean@poorly.run>
 <20190807173023.GA30025@ravnborg.org>
 <20190809190553.GD104440@art_vandelay>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809190553.GD104440@art_vandelay>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=da8YyR1k0nDRRcKHbIUA:9 a=CjuIK1q_8ugA:10
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

SGkgU2Vhbi4KCj4gPiA+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaAo+ID4gPiAr
KysgYi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgKPiA+ID4gQEAgLTU0Myw4ICs1NDMsOCBA
QCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSB7Cj4gPiA+ICAJICoKPiA+ID4gIAkgKiBUaGlz
IGlzIGFsc28gdXNlZCBpbiB0aGUgYXRvbWljIGhlbHBlcnMgdG8gbWFwIGVuY29kZXJzIHRvIHRo
ZWlyCj4gPiA+ICAJICogY3VycmVudCBhbmQgcHJldmlvdXMgY29ubmVjdG9ycywgc2VlCj4gPiA+
IC0JICogJmRybV9hdG9taWNfZ2V0X29sZF9jb25uZWN0b3JfZm9yX2VuY29kZXIoKSBhbmQKPiA+
ID4gLQkgKiAmZHJtX2F0b21pY19nZXRfbmV3X2Nvbm5lY3Rvcl9mb3JfZW5jb2RlcigpLgo+ID4g
PiArCSAqICZkcm1fYXRvbWljX2dldF9vbGRfY29ubmVjdG9yX2Zvcl9lbmNvZGVyIGFuZAo+ID4g
PiArCSAqICZkcm1fYXRvbWljX2dldF9uZXdfY29ubmVjdG9yX2Zvcl9lbmNvZGVyLgo+ID4gUGxl
YXNlIGZpeCB0aGlzIHRvIHVzZSAoKSBmb3IgdGhlIGZ1bmN0aW9ucyBhbmQgZHJvcCB0aGUgIiYi
Lgo+ID4gVGhpcyBpcyB3aGF0IHdlIHVzZSBpbiBkcm0ga2VybmVsLWRvYyBmb3IgZnVuY3Rpb25z
Lgo+ID4gU2VlIGZvciBleGFtcGxlIGZ1bmN0aW9uIHJlZmVyZW5jZXMgaW4gZG9jIG9mIHdyaXRl
YmFja19qb2IgaW4gdGhlIHNhbWUgZmlsZS4KPiAKPiBEb2luZyB0aGlzIHdvbid0IGdldCBhIGh5
cGVybGluayBpbiB0aGUgZG9jcy4gSXQgc2VlbXMgbGlrZSB0aGVzZSBob29rcyBhcmVuJ3QKPiBy
ZWNvZ25pemVkIGFzIGZ1bmN0aW9ucyBieSBzcGhpbnggKG5vdCBzdXJlIGRpZG4ndCBsb29rIGlu
dG8gaXQgdG9vIGRlZXBseSkuIFRoZQo+IG90aGVyICJfZnVuY3MuKiIgaG9va3MgYXJlIGFsc28g
aGFuZGxlZCB3aXRoICcmJyAodGhlcmUgYXJlIGxvdHMgb2YgZXhhbXBsZXMgaW4KPiBkcm1fY29u
bmVjdG9yLmgpLgo+IAo+IEkgdGhpbmsgcHJlc2VydmluZyB0aGUgaHlwZXJsaW5rcyBwcm9iYWJs
eSBvdXR3ZWlnaHMgdGhlIG1pc3NpbmcgKCksIHRob3VnaHRzPwoKSG1tLCBJIGFjdHVhbGx5IHRl
c3RlZCBpdCBoZXJlIC0gd2l0aCBzcGhpbnhfMS40LjkuClRoZSBsaW5rcyB3YXMgcHJlc2VydmVk
LCB0aGUgb25seSBkaWZmZXJlbmNlIHdhcyB0aGF0IHRoZXkgaGFkIHRoZSAoKQpwcmVmaXhlZCB0
byB0aGVpciBuYW1lLgoKRG8geW91IGhhcHBlbiB0byB1c2UgYW4gb2xkZXIgc3BoaW54IHZlcnNp
b24/CgoJU2FtCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
