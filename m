Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F26B109D3B
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 12:47:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FBA6E073;
	Tue, 26 Nov 2019 11:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E7EA96E073
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 11:46:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BC691FB;
 Tue, 26 Nov 2019 03:46:56 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2C4463F52E;
 Tue, 26 Nov 2019 03:46:56 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id E5A28682AC4; Tue, 26 Nov 2019 11:46:54 +0000 (GMT)
Date: Tue, 26 Nov 2019 11:46:54 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH 2/2] drm/fourcc: Fill out all block sizes for P210
Message-ID: <20191126114654.kvncds3adtxfy77h@e110455-lin.cambridge.arm.com>
References: <20191126091414.226070-1-daniel.vetter@ffwll.ch>
 <20191126091414.226070-2-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191126091414.226070-2-daniel.vetter@ffwll.ch>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Ayan Kumar Halder <ayan.halder@arm.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBOb3YgMjYsIDIwMTkgYXQgMTA6MTQ6MTRBTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiAwIG1lYW5zIDEgYXMgdGhlIGRlZmF1bHQsIGJ1dCBpdCdzIG1pZ2h0eSBjb25mdXNp
bmcgaWYgdGhlIGJsb2NrIHNpemUKPiBmb3IgdGhlIGZpcnN0IHBsYW5lIGlzIHNwZWxsZWQgb3V0
IGV4cGxpY2l0bHksIGJ1dCBub3QgZm9yIHRoZSAybmQKPiBwbGFuZS4KPiAKPiBObyBjYzogc3Rh
YmxlIGJlY2F1c2UgdGhpcyBpcyBqdXN0IGNvbmZ1c2lvbiwgYnV0IDAgZnVuY3Rpb25hbCBpc3N1
ZS4KCkFncmVlIQoKPiAKPiBGaXhlczogN2JhMGZlZTI0N2VlICgiZHJtL2ZvdXJjYzogQWRkIEFG
QkMgeXV2IGZvdXJjY3MgZm9yIE1hbGkiKQo+IENjOiBCcmlhbiBTdGFya2V5IDxicmlhbi5zdGFy
a2V5QGFybS5jb20+Cj4gQ2M6IEF5YW4gS3VtYXIgSGFsZGVyIDxheWFuLmhhbGRlckBhcm0uY29t
Pgo+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkFja2VkLWJ5OiBMaXZp
dSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KCkJlc3QgcmVnYXJkcywKCj4gQ2M6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2FAcm9zZW56d2VpZy5pbz4KPiBDYzogTWFhcnRlbiBMYW5raG9y
c3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiBDYzogTWF4aW1lIFJpcGFy
ZCA8bXJpcGFyZEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJj
Yy5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZm91cmNjLmMKPiBpbmRleCBmZTc5Y2U4NTdjOGEuLmIyMzRiZmFlZGEw
NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYwo+IEBAIC0yNjMsNyArMjYzLDcgQEAgY29uc3Qgc3Ry
dWN0IGRybV9mb3JtYXRfaW5mbyAqX19kcm1fZm9ybWF0X2luZm8odTMyIGZvcm1hdCkKPiAgCQkg
IC5oc3ViID0gMiwgLnZzdWIgPSAyLCAuaXNfeXV2ID0gdHJ1ZX0sCj4gIAkJeyAuZm9ybWF0ID0g
RFJNX0ZPUk1BVF9QMjEwLAkJLmRlcHRoID0gMCwKPiAgCQkgIC5udW1fcGxhbmVzID0gMiwgLmNo
YXJfcGVyX2Jsb2NrID0geyAyLCA0LCAwIH0sCj4gLQkJICAuYmxvY2tfdyA9IHsgMSwgMCwgMCB9
LCAuYmxvY2tfaCA9IHsgMSwgMCwgMCB9LCAuaHN1YiA9IDIsCj4gKwkJICAuYmxvY2tfdyA9IHsg
MSwgMSwgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMSwgMCB9LCAuaHN1YiA9IDIsCj4gIAkJICAudnN1
YiA9IDEsIC5pc195dXYgPSB0cnVlIH0sCj4gIAkJeyAuZm9ybWF0ID0gRFJNX0ZPUk1BVF9WVVkx
MDEwMTAsCS5kZXB0aCA9IDAsCj4gIAkJICAubnVtX3BsYW5lcyA9IDEsIC5jcHAgPSB7IDAsIDAs
IDAgfSwgLmhzdWIgPSAxLCAudnN1YiA9IDEsCj4gLS0gCj4gMi4yNC4wCj4gCgotLSAKPT09PT09
PT09PT09PT09PT09PT0KfCBJIHdvdWxkIGxpa2UgdG8gfAp8IGZpeCB0aGUgd29ybGQsICB8Cnwg
YnV0IHRoZXkncmUgbm90IHwKfCBnaXZpbmcgbWUgdGhlICAgfAogXCBzb3VyY2UgY29kZSEgIC8K
ICAtLS0tLS0tLS0tLS0tLS0KICAgIMKvXF8o44OEKV8vwq8KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
