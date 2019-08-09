Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B8B8806F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 18:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4396EE62;
	Fri,  9 Aug 2019 16:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623B16EE62
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 16:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 2B1D1FB03;
 Fri,  9 Aug 2019 18:45:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zG0agjQGW3tZ; Fri,  9 Aug 2019 18:45:38 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id BDFB241D9E; Fri,  9 Aug 2019 18:45:37 +0200 (CEST)
Date: Fri, 9 Aug 2019 18:45:37 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Ville Baillie <vmbaillie@googlemail.com>
Subject: Re: [PATCH] mxsfb: allow attachment of display bridges
Message-ID: <20190809164537.GA4212@bogon.m.sigxcpu.org>
References: <20190801111853.GA24574@villeb-dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190801111853.GA24574@villeb-dev>
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
Cc: marex@denx.de, kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, s.hauer@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-imx@nxp.com, Robert Chiras <robert.chiras@nxp.com>, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCk9uIFRodSwgQXVnIDAxLCAyMDE5IGF0IDExOjE4OjUzQU0gKzAwMDAsIFZpbGxlIEJhaWxs
aWUgd3JvdGU6Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuYyB8IDIw
ICsrKysrKysrKysrKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYu
aCB8ICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL214c2ZiL214c2ZiX291dC5jIHwgMTQgKysrKysr
KysrKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBpbmRleCA2ZmFmYzkwZGE0ZWMu
LmMxOWE3YjdhYTNhNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJf
ZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfZHJ2LmMKPiBAQCAtMjI5
LDEwICsyMjksMjIgQEAgc3RhdGljIGludCBteHNmYl9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpk
cm0sIHVuc2lnbmVkIGxvbmcgZmxhZ3MpCj4gIAkJZ290byBlcnJfdmJsYW5rOwo+ICAJfQo+ICAK
PiAtCXJldCA9IGRybV9wYW5lbF9hdHRhY2gobXhzZmItPnBhbmVsLCAmbXhzZmItPmNvbm5lY3Rv
cik7Cj4gLQlpZiAocmV0KSB7Cj4gLQkJZGV2X2Vycihkcm0tPmRldiwgIkNhbm5vdCBjb25uZWN0
IHBhbmVsXG4iKTsKPiAtCQlnb3RvIGVycl92Ymxhbms7Cj4gKwlpZiAobXhzZmItPnBhbmVsKSB7
Cj4gKwkJcmV0ID0gZHJtX3BhbmVsX2F0dGFjaChteHNmYi0+cGFuZWwsICZteHNmYi0+Y29ubmVj
dG9yKTsKPiArCQlpZiAocmV0KSB7Cj4gKwkJCWRldl9lcnIoZHJtLT5kZXYsICJDYW5ub3QgY29u
bmVjdCBwYW5lbFxuIik7Cj4gKwkJCWdvdG8gZXJyX3ZibGFuazsKPiArCQl9Cj4gKwl9IGVsc2Ug
aWYgKG14c2ZiLT5icmlkZ2UpIHsKPiArCQlyZXQgPSBkcm1fYnJpZGdlX2F0dGFjaCgmbXhzZmIt
PnBpcGUuZW5jb2RlciwgbXhzZmItPmJyaWRnZSwKPiArCQkJCU5VTEwpOwo+ICsJCWlmIChyZXQp
IHsKPiArCQkJZGV2X2Vycihkcm0tPmRldiwgIkNhbm5vdCBjb25uZWN0IGJyaWRnZVxuIik7Cj4g
KwkJCWdvdG8gZXJyX3ZibGFuazsKPiArCQl9Cj4gKwl9IGVsc2Ugewo+ICsJCWRldl9lcnIoZHJt
LT5kZXYsICJObyBwYW5lbCBvciBicmlkZ2VcbiIpOwo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICAJ
fQo+ICAKPiAgCWRybS0+bW9kZV9jb25maWcubWluX3dpZHRoCT0gTVhTRkJfTUlOX1hSRVM7Cj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS9teHNmYi9teHNmYl9kcnYuaAo+IGluZGV4IGQ5NzUzMDBkY2EwNS4uNDM2ZmU0YmJi
NDdhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9teHNmYl9kcnYuaAo+IEBAIC0yOSw2ICsyOSw3IEBA
IHN0cnVjdCBteHNmYl9kcm1fcHJpdmF0ZSB7Cj4gIAlzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5
X3BpcGUJcGlwZTsKPiAgCXN0cnVjdCBkcm1fY29ubmVjdG9yCQljb25uZWN0b3I7Cj4gIAlzdHJ1
Y3QgZHJtX3BhbmVsCQkqcGFuZWw7Cj4gKwlzdHJ1Y3QgZHJtX2JyaWRnZQkJKmJyaWRnZTsKPiAg
fTsKPiAgCj4gIGludCBteHNmYl9zZXR1cF9jcnRjKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMKPiBpbmRleCA5MWU3NmY5Y2VhZDYuLjc3ZTAzZWIw
ZmNhNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXhzZmIvbXhzZmJfb3V0LmMKPiBAQCAtNzgsOSArNzgsMTEg
QEAgaW50IG14c2ZiX2NyZWF0ZV9vdXRwdXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgewo+
ICAJc3RydWN0IG14c2ZiX2RybV9wcml2YXRlICpteHNmYiA9IGRybS0+ZGV2X3ByaXZhdGU7Cj4g
IAlzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbDsKPiArCXN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2U7
Cj4gIAlpbnQgcmV0Owo+ICAKPiAtCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShk
cm0tPmRldi0+b2Zfbm9kZSwgMCwgMCwgJnBhbmVsLCBOVUxMKTsKPiArCXJldCA9IGRybV9vZl9m
aW5kX3BhbmVsX29yX2JyaWRnZShkcm0tPmRldi0+b2Zfbm9kZSwgMCwgMCwgJnBhbmVsLAo+ICsJ
CQkmYnJpZGdlKTsKPiAgCWlmIChyZXQpCj4gIAkJcmV0dXJuIHJldDsKPiAgCj4gQEAgLTkxLDgg
KzkzLDE0IEBAIGludCBteHNmYl9jcmVhdGVfb3V0cHV0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0p
Cj4gIAlyZXQgPSBkcm1fY29ubmVjdG9yX2luaXQoZHJtLCAmbXhzZmItPmNvbm5lY3RvciwKPiAg
CQkJCSAmbXhzZmJfcGFuZWxfY29ubmVjdG9yX2Z1bmNzLAo+ICAJCQkJIERSTV9NT0RFX0NPTk5F
Q1RPUl9Vbmtub3duKTsKPiAtCWlmICghcmV0KQo+IC0JCW14c2ZiLT5wYW5lbCA9IHBhbmVsOwo+
ICsJaWYgKCFyZXQpIHsKPiArCQlpZiAocGFuZWwpCj4gKwkJCW14c2ZiLT5wYW5lbCA9IHBhbmVs
Owo+ICsJCWVsc2UgaWYgKGJyaWRnZSkKPiArCQkJbXhzZmItPmJyaWRnZSA9IGJyaWRnZTsKPiAr
CQllbHNlCj4gKwkJCXJldHVybiAtRUlOVkFMOwo+ICsJfQo+ICAKPiAgCXJldHVybiByZXQ7Cj4g
IH0KPiAtLSAKPiAyLjE3LjEKClJvYmVydCBDaGlyYXMgcG9zdGVkIGJyaWRnZSBzdXBwb3J0IGZv
ciBteHNmYiBiYWNrIGluIEp1bmU6CgogICAgaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3BhdGNoLzMxNDQzMC8/c2VyaWVzPTYyODIyJnJldj0xCgpDaGVlcnMsCiAtLSBHdWlkbwoK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
