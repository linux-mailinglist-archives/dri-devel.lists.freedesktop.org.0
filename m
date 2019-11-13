Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB1FC138
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B86E397;
	Thu, 14 Nov 2019 08:08:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9CE5C6ED75
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:49 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31593909"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:51:56 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id D97E4400E9F7;
 Thu, 14 Nov 2019 00:51:51 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 03/13] dt-bindings: display: bridge: lvds-transmitter:
 Absorb ti, ds90c185.txt
Date: Wed, 13 Nov 2019 15:51:22 +0000
Message-Id: <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:50 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org,
 Simon Horman <horms@verge.net.au>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Peter Rosin <peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGksZHM5MGMxODUudHh0IGRvY3VtZW50cyBMVkRTIGVuY29kZXJzIHVzaW5nIHRoZSBzYW1lIGRy
aXZlcgphcyB0aGUgb25lIGRvY3VtZW50ZWQgYnkgbHZkcy10cmFuc21pdHRlci55YW1sLgpTaW5j
ZSB0aGUgcHJvcGVydGllcyBsaXN0ZWQgaW4gdGksZHM5MGMxODUudHh0IGFyZSB0aGUgc2FtZQph
cyB0aGUgb25lcyBsaXN0ZWQgaW4gbHZkcy10cmFuc21pdHRlci55YW1sLCBhYnNvcmIgdGhlIGR0
LWJpbmRpbmcKaW50byBsdmRzLXRyYW5zbWl0dGVyLnlhbWwuCgpTaWduZWQtb2ZmLWJ5OiBGYWJy
aXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5yZW5lc2FzLmNvbT4KCi0tLQp2My0+djQ6
CiogTmV3IHBhdGNoCi0tLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNt
aXR0ZXIueWFtbCAgfCAxNCArKystLS0KIC4uLi9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxk
czkwYzE4NS50eHQgICAgICAgIHwgNTUgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDYxIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAw
NjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxk
czkwYzE4NS50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci55YW1sIGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtdHJhbnNtaXR0ZXIueWFtbApp
bmRleCAyNDg0NzM3Li5hODMyNmNlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy10cmFuc21pdHRlci55YW1sCisrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLXRyYW5z
bWl0dGVyLnlhbWwKQEAgLTMxLDExICszMSwxMyBAQCBkZXNjcmlwdGlvbjogfAogcHJvcGVydGll
czoKICAgY29tcGF0aWJsZToKICAgICBkZXNjcmlwdGlvbjogfAotICAgICAgQW55IGVuY29kZXIg
Y29tcGF0aWJsZSB3aXRoIHRoaXMgZ2VuZXJpYyBiaW5kaW5nLCBidXQgd2l0aCBhZGRpdGlvbmFs
Ci0gICAgICBwcm9wZXJ0aWVzIG5vdCBsaXN0ZWQgaGVyZSwgbXVzdCBkZWZpbmUgaXRzIG93biBi
aW5kaW5nIGFuZCBsaXN0IGEgZGV2aWNlCi0gICAgICBzcGVjaWZpYyBjb21wYXRpYmxlIGZpcnN0
IGZvbGxvd2VkIGJ5IHRoZSBnZW5lcmljIGNvbXBhdGlibGUuCi0gICAgZW51bToKLSAgICAgIC0g
bHZkcy1lbmNvZGVyCisgICAgICBNdXN0IGxpc3QgdGhlIGRldmljZSBzcGVjaWZpYyBjb21wYXRp
YmxlIHN0cmluZyBmaXJzdCwgZm9sbG93ZWQgYnkgdGhlCisgICAgICBnZW5lcmljIGNvbXBhdGli
bGUgc3RyaW5nLgorICAgIGl0ZW1zOgorICAgICAgLSBlbnVtOgorICAgICAgICAtIHRpLGRzOTBj
MTg1ICAgICAgICMgRm9yIHRoZSBUSSBEUzkwQzE4NSBGUEQtTGluayBTZXJpYWxpemVyCisgICAg
ICAgIC0gdGksZHM5MGMxODcgICAgICAgIyBGb3IgdGhlIFRJIERTOTBDMTg3IEZQRC1MaW5rIFNl
cmlhbGl6ZXIKKyAgICAgIC0gY29uc3Q6IGx2ZHMtZW5jb2RlciAjIEdlbmVyaWMgTFZEUyBlbmNv
ZGVyIGNvbXBhdGlibGUgZmFsbGJhY2sKIAogICBwb3J0czoKICAgICB0eXBlOiBvYmplY3QKQEAg
LTY5LDcgKzcxLDcgQEAgcmVxdWlyZWQ6CiBleGFtcGxlczoKICAgLSB8CiAgICAgbHZkcy1lbmNv
ZGVyIHsKLSAgICAgIGNvbXBhdGlibGUgPSAibHZkcy1lbmNvZGVyIjsKKyAgICAgIGNvbXBhdGli
bGUgPSAidGksZHM5MGMxODUiLCAibHZkcy1lbmNvZGVyIjsKIAogICAgICAgcG9ydHMgewogICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwYzE4NS50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvdGksZHM5MGMxODUudHh0
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlNTc1Zjk5Li4wMDAwMDAwCi0tLSBhL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aSxkczkwYzE4
NS50eHQKKysrIC9kZXYvbnVsbApAQCAtMSw1NSArMCwwIEBACi1UZXhhcyBJbnN0cnVtZW50cyBG
UEQtTGluayAoTFZEUykgU2VyaWFsaXplcgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KLQotVGhlIERTOTBDMTg1IGFuZCBEUzkwQzE4NyBhcmUgbG93LXBvd2Vy
IHNlcmlhbGl6ZXJzIGZvciBwb3J0YWJsZQotYmF0dGVyeS1wb3dlcmVkIGFwcGxpY2F0aW9ucyB0
aGF0IHJlZHVjZXMgdGhlIHNpemUgb2YgdGhlIFJHQgotaW50ZXJmYWNlIGJldHdlZW4gdGhlIGhv
c3QgR1BVIGFuZCB0aGUgZGlzcGxheS4KLQotUmVxdWlyZWQgcHJvcGVydGllczoKLQotLSBjb21w
YXRpYmxlOiBTaG91bGQgYmUKLSAgInRpLGRzOTBjMTg1IiwgImx2ZHMtZW5jb2RlciIgIGZvciB0
aGUgVEkgRFM5MEMxODUgRlBELUxpbmsgU2VyaWFsaXplcgotICAidGksZHM5MGMxODciLCAibHZk
cy1lbmNvZGVyIiAgZm9yIHRoZSBUSSBEUzkwQzE4NyBGUEQtTGluayBTZXJpYWxpemVyCi0KLU9w
dGlvbmFsIHByb3BlcnRpZXM6Ci0KLS0gcG93ZXJkb3duLWdwaW9zOiBQb3dlciBkb3duIGNvbnRy
b2wgR1BJTyAodGhlIFBEQiBwaW4sIGFjdGl2ZS1sb3cpCi0KLVJlcXVpcmVkIG5vZGVzOgotCi1U
aGUgZGV2aWNlcyBoYXZlIHR3byB2aWRlbyBwb3J0cy4gVGhlaXIgY29ubmVjdGlvbnMgYXJlIG1v
ZGVsZWQgdXNpbmcgdGhlIE9GCi1ncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4KLQotLSBWaWRlbyBwb3J0IDAgZm9y
IHBhcmFsbGVsIGlucHV0Ci0tIFZpZGVvIHBvcnQgMSBmb3IgTFZEUyBvdXRwdXQKLQotCi1FeGFt
cGxlCi0tLS0tLS0tCi0KLWx2ZHMtZW5jb2RlciB7Ci0JY29tcGF0aWJsZSA9ICJ0aSxkczkwYzE4
NSIsICJsdmRzLWVuY29kZXIiOwotCi0JcG93ZXJkb3duLWdwaW9zID0gPCZncGlvIDE3IEdQSU9f
QUNUSVZFX0xPVz47Ci0KLQlwb3J0cyB7Ci0JCSNhZGRyZXNzLWNlbGxzID0gPDE+OwotCQkjc2l6
ZS1jZWxscyA9IDwwPjsKLQotCQlwb3J0QDAgewotCQkJcmVnID0gPDA+OwotCi0JCQlsdmRzX2Vu
Y19pbjogZW5kcG9pbnQgewotCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmbGNkY19vdXRfcmdiPjsK
LQkJCX07Ci0JCX07Ci0KLQkJcG9ydEAxIHsKLQkJCXJlZyA9IDwxPjsKLQotCQkJbHZkc19lbmNf
b3V0OiBlbmRwb2ludCB7Ci0JCQkJcmVtb3RlLWVuZHBvaW50ID0gPCZsdmRzX3BhbmVsX2luPjsK
LQkJCX07Ci0JCX07Ci0JfTsKLX07Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
