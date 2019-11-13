Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96C4FC11B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:08:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F38D6E1B1;
	Thu, 14 Nov 2019 08:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id D23106ED7D
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31593939"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:26 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id ADDC2400EE6B;
 Thu, 14 Nov 2019 00:52:21 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 09/13] dt-bindings: display: bridge: lvds-codec: Document
 ti, ds90cf384a
Date: Wed, 13 Nov 2019 15:51:28 +0000
Message-Id: <1573660292-10629-10-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Thu, 14 Nov 2019 08:07:51 +0000
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

VGhlIERTOTBDRjM4NEEgZnJvbSBUSSBpcyBhIHRyYW5zcGFyZW50IExWRFMgcmVjZWl2ZXIgKGRl
Y29kZXIpLAphbmQgdGhlcmVmb3JlIGl0IGlzIGNvbXBhdGlibGUgd2l0aCB0aGUgbHZkcy1jb2Rl
YyBkcml2ZXIgYW5kCmJpbmRpbmdzLgoKRG9jdW1lbnQgdGhlIHRpLGRzOTBjZjM4NGEgY29tcGF0
aWJsZSBzdHJpbmcgd2l0aCB0aGUgZHQtYmluZGluZ3MuCk5vIGRyaXZlciBjaGFuZ2UgcmVxdWly
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaXppbyBDYXN0cm8gPGZhYnJpemlvLmNhc3Ryb0BicC5y
ZW5lc2FzLmNvbT4KCi0tLQp2My0+djQ6CiogTmV3IHBhdGNoCi0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbCB8IDcgKysr
KystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlk
Z2UvbHZkcy1jb2RlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAppbmRleCAwZWNjOGE0Li4yMWY4YzZlIDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
bHZkcy1jb2RlYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwKQEAgLTQwLDcgKzQwLDEwIEBAIHByb3BlcnRp
ZXM6CiAgICAgICAgICAgLSB0aSxkczkwYzE4NyAgICAgICAjIEZvciB0aGUgVEkgRFM5MEMxODcg
RlBELUxpbmsgU2VyaWFsaXplcgogICAgICAgICAgIC0gdGksc243NWx2ZHM4MyAgICAgIyBGb3Ig
dGhlIFRJIFNONzVMVkRTODMgRmxhdExpbmsgdHJhbnNtaXR0ZXIKICAgICAgICAgLSBjb25zdDog
bHZkcy1lbmNvZGVyICMgR2VuZXJpYyBMVkRTIGVuY29kZXIgY29tcGF0aWJsZSBmYWxsYmFjawot
ICAgICAgLSBjb25zdDogbHZkcy1kZWNvZGVyICAgIyBHZW5lcmljIExWRFMgZGVjb2RlcnMgY29t
cGF0aWJsZSBmYWxsYmFjaworICAgICAgLSBpdGVtczoKKyAgICAgICAgLSBlbnVtOgorICAgICAg
ICAgIC0gdGksZHM5MGNmMzg0YSAgICAgIyBGb3IgdGhlIERTOTBDRjM4NEEgRlBELUxpbmsgTFZE
UyBSZWNlaXZlcgorICAgICAgICAtIGNvbnN0OiBsdmRzLWRlY29kZXIgIyBHZW5lcmljIExWRFMg
ZGVjb2RlcnMgY29tcGF0aWJsZSBmYWxsYmFjawogCiAgIHBvcnRzOgogICAgIHR5cGU6IG9iamVj
dApAQCAtMTAyLDcgKzEwNSw3IEBAIGV4YW1wbGVzOgogCiAgIC0gfAogICAgIGx2ZHMtZGVjb2Rl
ciB7Ci0gICAgICBjb21wYXRpYmxlID0gImx2ZHMtZGVjb2RlciI7CisgICAgICBjb21wYXRpYmxl
ID0gInRpLGRzOTBjZjM4NGEiLCAibHZkcy1kZWNvZGVyIjsKIAogICAgICAgcG9ydHMgewogICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
