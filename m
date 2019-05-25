Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6E82A351
	for <lists+dri-devel@lfdr.de>; Sat, 25 May 2019 09:36:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F22156E149;
	Sat, 25 May 2019 07:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F07F6E149
 for <dri-devel@lists.freedesktop.org>; Sat, 25 May 2019 07:36:21 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C8916804BF;
 Sat, 25 May 2019 09:36:18 +0200 (CEST)
Date: Sat, 25 May 2019 09:36:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] drm/mcde: Add new driver for ST-Ericsson MCDE
Message-ID: <20190525073616.GE9586@ravnborg.org>
References: <20190522072153.13727-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190522072153.13727-1-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=m_Je5-PlRfT3v9rmweEA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGludXMKCk9uIFdlZCwgTWF5IDIyLCAyMDE5IGF0IDA5OjIxOjUzQU0gKzAyMDAsIExpbnVz
IFdhbGxlaWogd3JvdGU6Cj4gVGhpcyBhZGRzIGEgbmV3IERSTSBkcml2ZXIgZm9yIHRoZSBTVC1F
cmljc3NvbiBNdWx0aSBDaGFubmVsCj4gRGlzcGxheSBFbmdpbmUsIE1DREUgZGlzcGxheSBjb250
cm9sbGVyLgoKVGhpcyBkcml2ZXIgYnJlYWtzIGJ1aWxkIGluIGRybS1taXNjLW5leHQgYXQgdGhl
IG1vbWVudC4KCkZvbGxvd2luZyBwYXRjaCBmaXhlZCBib3RoIGEgYnVpbGQgd2FybmluZyBhbmQg
YSBidWlsZCBlcnJvci4KQ291bGQgeW91IHRha2UgYSBsb29rIGFuZCBnZXQgaXQgZml4ZWQgcHJv
cGVybHkuCgpJZiByZWxldmFudCAtIHRoZW4gcGF0Y2ggaXM6ClNpZ25lZC1vZmYtYnk6IFNhbSBS
YXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCglTYW0KCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWNkZS9tY2RlX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZGlz
cGxheS5jCmluZGV4IDE3ZGM0NmQ1NTRiMC4uZjNlZjEwOGE0MWQ5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNk
ZS9tY2RlX2Rpc3BsYXkuYwpAQCAtODIzLDcgKzgyMyw3IEBAIHN0YXRpYyB2b2lkIG1jZGVfZGlz
cGxheV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLAogCXUzMiBm
b3JtYXR0ZXJfcHBsID0gbW9kZS0+aGRpc3BsYXk7IC8qIHBpeGVscyBwZXIgbGluZSAqLwogCXUz
MiBmb3JtYXR0ZXJfbHBmID0gbW9kZS0+dmRpc3BsYXk7IC8qIGxpbmVzIHBlciBmcmFtZSAqLwog
CWludCBwa3Rfc2l6ZSwgZmlmb193dHJtcms7Ci0JaW50IGNwcCA9IGRybV9mb3JtYXRfcGxhbmVf
Y3BwKGZvcm1hdCwgMCk7CisJaW50IGNwcCA9IGZiLT5mb3JtYXQtPmNwcFswXTsKIAlpbnQgZm9y
bWF0dGVyX2NwcDsKIAlzdHJ1Y3QgZHJtX2Zvcm1hdF9uYW1lX2J1ZiB0bXA7CiAJdTMyIGZvcm1h
dHRlcl9mcmFtZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCmluZGV4IDQ1NmI0MzQ4MjQ0OC4uMDdm
NzA5MGQwOGIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKQEAgLTE5MSw3ICsxOTEsNyBAQCBz
dGF0aWMgc3NpemVfdCBtY2RlX2RzaV9ob3N0X3RyYW5zZmVyKHN0cnVjdCBtaXBpX2RzaV9ob3N0
ICpob3N0LAogCX0KIAogCWRldl9kYmcoZC0+ZGV2LAotCQkibWVzc2FnZSB0byBjaGFubmVsICVk
LCAldSBieXRlcyIsCisJCSJtZXNzYWdlIHRvIGNoYW5uZWwgJWQsICV6ZCBieXRlcyIsCiAJCW1z
Zy0+Y2hhbm5lbCwKIAkJdHhsZW4pOwoKCVNhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
