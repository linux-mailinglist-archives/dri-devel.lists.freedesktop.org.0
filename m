Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175B5631C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 09:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3976F6E2A9;
	Wed, 26 Jun 2019 07:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063B96E2A9
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 07:20:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6E28580314;
 Wed, 26 Jun 2019 09:20:49 +0200 (CEST)
Date: Wed, 26 Jun 2019 09:20:48 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [v3 1/4] dt-bindngs: display: panel: Add BOE tv101wum-n16 panel
 bindings
Message-ID: <20190626072048.GB14541@ravnborg.org>
References: <20190626025400.109567-1-jitao.shi@mediatek.com>
 <20190626025400.109567-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626025400.109567-2-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8 a=GOHkJZeNjhEJBjOU3QsA:9
 a=CjuIK1q_8ugA:10 a=6heAxKwa5pAsJatQ0mat:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, stonea168@163.com,
 dri-devel@lists.freedesktop.org, Ajay Kumar <ajaykumar.rs@samsung.com>,
 Vincent Palatin <vpalatin@chromium.org>, cawa.cheng@mediatek.com,
 yingjoe.chen@mediatek.com, Thierry Reding <treding@nvidia.com>,
 Sean Paul <seanpaul@chromium.org>, linux-pwm@vger.kernel.org,
 Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org, Rahul Sharma <rahul.sharma@samsung.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Sascha Hauer <kernel@pengutronix.de>, Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTA6NTM6NTdBTSArMDgwMCwgSml0YW8gU2hpIHdyb3Rl
Ogo+IEFkZCBkb2N1bWVudGF0aW9uIGZvciBib2UgdHYxMDF3dW0tbjE2IHBhbmVsLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4KUmV2aWV3ZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiAtLS0KPiAgLi4uL2Rpc3BsYXkv
cGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQgICAgICAgIHwgMzQgKysrKysrKysrKysrKysrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2
MTAxd3VtLW5sNi50eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9ib2UsdHYxMDF3dW0tbmw2LnR4
dAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5iZDQ0YWY2MzYz
OTAKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvYm9lLHR2MTAxd3VtLW5sNi50eHQKPiBAQCAtMCwwICsxLDM0IEBA
Cj4gK0JvZSBDb3Jwb3JhdGlvbiAxMC4xIiBXVVhHQSBURlQgTENEIHBhbmVsCj4gKwo+ICtSZXF1
aXJlZCBwcm9wZXJ0aWVzOgo+ICstIGNvbXBhdGlibGU6IHNob3VsZCBiZSAiYm9lLHR2MTAxd3Vt
LW5sNiIKPiArLSByZWc6IHRoZSB2aXJ0dWFsIGNoYW5uZWwgbnVtYmVyIG9mIGEgRFNJIHBlcmlw
aGVyYWwKPiArLSBlbmFibGUtZ3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0aGUgZW5hYmxlIHBpbgo+
ICstIHBwMTgwMC1zdXBwbHk6IGNvcmUgdm9sdGFnZSBzdXBwbHkKPiArLSBhdmRkLXN1cHBseTog
cGhhbmRsZSBvZiB0aGUgcmVndWxhdG9yIHRoYXQgcHJvdmlkZXMgcG9zaXRpdmUgdm9sdGFnZQo+
ICstIGF2ZWUtc3VwcGx5OiBwaGFuZGxlIG9mIHRoZSByZWd1bGF0b3IgdGhhdCBwcm92aWRlcyBu
ZWdhdGl2ZSB2b2x0YWdlCj4gKy0gYmFja2xpZ2h0OiBwaGFuZGxlIG9mIHRoZSBiYWNrbGlnaHQg
ZGV2aWNlIGF0dGFjaGVkIHRvIHRoZSBwYW5lbAo+ICsKPiArVGhlIGRldmljZSBub2RlIGNhbiBj
b250YWluIG9uZSAncG9ydCcgY2hpbGQgbm9kZSB3aXRoIG9uZSBjaGlsZAo+ICsnZW5kcG9pbnQn
IG5vZGUsIGFjY29yZGluZyB0byB0aGUgYmluZGluZ3MgZGVmaW5lZCBpbgo+ICttZWRpYS92aWRl
by1pbnRlcmZhY2VzLnR4dC4gVGhpcyBub2RlIHNob3VsZCBkZXNjcmliZSBwYW5lbCdzIHZpZGVv
IGJ1cy4KPiArCj4gK0V4YW1wbGU6Cj4gKyZkc2kgewo+ICsJLi4uCj4gKwlwYW5lbEAwIHsKPiAr
CQljb21wYXRpYmxlID0gImJvZSx0djEwMXd1bS1ubDYiOwo+ICsJCXJlZyA9IDwwPjsKPiArCQll
bmFibGUtZ3Bpb3MgPSA8JnBpbyA0NSAwPjsKPiArCQlhdmRkLXN1cHBseSA9IDwmcHB2YXJuX2xj
ZD47Cj4gKwkJYXZlZS1zdXBwbHkgPSA8JnBwdmFycF9sY2Q+Owo+ICsJCXBwMTgwMC1zdXBwbHkg
PSA8JnBwMTgwMF9sY2Q+Owo+ICsJCWJhY2tsaWdodCA9IDwmYmFja2xpZ2h0X2xjZDA+Owo+ICsJ
CXN0YXR1cyA9ICJva2F5IjsKPiArCQlwb3J0IHsKPiArCQkJcGFuZWxfaW46IGVuZHBvaW50IHsK
PiArCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmZHNpX291dD47Cj4gKwkJCX07Cj4gKwkJfTsKPiAr
CX07Cj4gK307Cj4gLS0gCj4gMi4yMS4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
