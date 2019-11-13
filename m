Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A41FC133
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 09:09:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001976E34D;
	Thu, 14 Nov 2019 08:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09B376ED81
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 15:57:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; d="scan'208";a="31593969"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
 by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:46 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir6.idc.renesas.com (Postfix) with ESMTP id B391E400EE6B;
 Thu, 14 Nov 2019 00:52:41 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v4 13/13] [HACK] dt-bindings: display: bridge: lvds-codec:
 Absorb thine, thc63lvdm83d.txt
Date: Wed, 13 Nov 2019 15:51:32 +0000
Message-Id: <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
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

QXQgdGhpcyBwb2ludCBpbiB0aW1lLCBjb21wYXRpYmxlIHN0cmluZyAidGhpbmUsdGhjNjNsdmRt
ODNkIiBpcwpiYWNrZWQgYnkgdGhlIGx2ZHMtY29kZWMgZHJpdmVyLCBhbmQgdGhlIGRvY3VtZW50
YXRpb24gY29udGFpbmVkCmluIHRoaW5lLHRoYzYzbHZkbTgzZC50eHQgaXMgYmFzaWNhbGx5IHRo
ZSBzYW1lIGFzIHRoZSBvbmUKY29udGFpbmVkIGluIGx2ZHMtY29kZWMueWFtbCAoZ2VuZXJpYyBm
YWxsYmFjayBjb21wYXRpYmxlIHN0cmluZwphc2lkZSksIHRoZXJlZm9yZSBhYnNvcmIgdGhpbmUs
dGhjNjNsdmRtODNkLnR4dC4KClNpZ25lZC1vZmYtYnk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6
aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgoKLS0tCkhpIExhdXJlbnQsCgp3aGF0IGRvIHlvdSB0
aGluayBhYm91dCB0aGlzIHBhdGNoPwoKVGhhbmtzLApGYWIKCnYzLT52NDoKKiBOZXcgcGF0Y2gK
LS0tCiAuLi4vYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sICAgICAgICB8
ICA1ICstLQogLi4uL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkbTgzZC50
eHQgfCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkbTgzZC50
eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9icmlkZ2UvbHZkcy1jb2RlYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2x2ZHMtY29kZWMueWFtbAppbmRleCAyMWY4YzZlLi40MjBiZmNl
IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9i
cmlkZ2UvbHZkcy1jb2RlYy55YW1sCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2JyaWRnZS9sdmRzLWNvZGVjLnlhbWwKQEAgLTMwLDkgKzMwLDYgQEAgZGVz
Y3JpcHRpb246IHwKIAogcHJvcGVydGllczoKICAgY29tcGF0aWJsZToKLSAgICBkZXNjcmlwdGlv
bjogfAotICAgICAgTXVzdCBsaXN0IHRoZSBkZXZpY2Ugc3BlY2lmaWMgY29tcGF0aWJsZSBzdHJp
bmcgZmlyc3QsIGZvbGxvd2VkIGJ5IHRoZQotICAgICAgZ2VuZXJpYyBjb21wYXRpYmxlIHN0cmlu
Zy4KICAgICBvbmVPZjoKICAgICAgIC0gaXRlbXM6CiAgICAgICAgIC0gZW51bToKQEAgLTQ0LDYg
KzQxLDggQEAgcHJvcGVydGllczoKICAgICAgICAgLSBlbnVtOgogICAgICAgICAgIC0gdGksZHM5
MGNmMzg0YSAgICAgIyBGb3IgdGhlIERTOTBDRjM4NEEgRlBELUxpbmsgTFZEUyBSZWNlaXZlcgog
ICAgICAgICAtIGNvbnN0OiBsdmRzLWRlY29kZXIgIyBHZW5lcmljIExWRFMgZGVjb2RlcnMgY29t
cGF0aWJsZSBmYWxsYmFjaworICAgICAgLSBlbnVtOgorICAgICAgICAtIHRoaW5lLHRoYzYzbHZk
bTgzZCAgIyBGb3IgdGhlIFRIQzYzTFZETTgzRCBMVkRTIHNlcmlhbGl6ZXIKIAogICBwb3J0czoK
ICAgICB0eXBlOiBvYmplY3QKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2JyaWRnZS90aGluZSx0aGM2M2x2ZG04M2QudHh0IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5lLHRoYzYzbHZkbTgz
ZC50eHQKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGZlZTNjODguLjAwMDAwMDAKLS0t
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3RoaW5l
LHRoYzYzbHZkbTgzZC50eHQKKysrIC9kZXYvbnVsbApAQCAtMSw1MCArMCwwIEBACi1USGluZSBF
bGVjdHJvbmljcyBUSEM2M0xWRE04M0QgTFZEUyBzZXJpYWxpemVyCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0KLVRoZSBUSEM2M0xWRE04M0QgaXMgYW4g
TFZEUyBzZXJpYWxpemVyIGRlc2lnbmVkIHRvIHN1cHBvcnQgcGl4ZWwgZGF0YQotdHJhbnNtaXNz
aW9uIGJldHdlZW4gYSBob3N0IGFuZCBhIGZsYXQgcGFuZWwuCi0KLVJlcXVpcmVkIHByb3BlcnRp
ZXM6Ci0KLS0gY29tcGF0aWJsZTogU2hvdWxkIGJlICJ0aGluZSx0aGM2M2x2ZG04M2QiCi0KLU9w
dGlvbmFsIHByb3BlcnRpZXM6Ci0KLS0gcG93ZXJkb3duLWdwaW9zOiBQb3dlciBkb3duIGNvbnRy
b2wgR1BJTyAodGhlIC9QV0ROIHBpbiwgYWN0aXZlIGxvdykuCi0KLVJlcXVpcmVkIG5vZGVzOgot
Ci1UaGUgVEhDNjNMVkRNODNEIGhhcyB0d28gdmlkZW8gcG9ydHMuIFRoZWlyIGNvbm5lY3Rpb25z
IGFyZSBtb2RlbGVkIHVzaW5nIHRoZQotT0ZncmFwaCBiaW5kaW5ncyBzcGVjaWZpZWQgaW4gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dyYXBoLnR4dC4KLQotLSBWaWRlbyBwb3J0
IDAgZm9yIENNT1MvVFRMIGlucHV0Ci0tIFZpZGVvIHBvcnQgMSBmb3IgTFZEUyBvdXRwdXQKLQot
Ci1FeGFtcGxlCi0tLS0tLS0tCi0KLQlsdmRzX2VuYzogZW5jb2RlckAwIHsKLQkJY29tcGF0aWJs
ZSA9ICJ0aGluZSx0aGM2M2x2ZG04M2QiOwotCi0JCXBvcnRzIHsKLQkJCSNhZGRyZXNzLWNlbGxz
ID0gPDE+OwotCQkJI3NpemUtY2VsbHMgPSA8MD47Ci0KLQkJCXBvcnRAMCB7Ci0JCQkJcmVnID0g
PDA+OwotCi0JCQkJbHZkc19lbmNfaW46IGVuZHBvaW50QDAgewotCQkJCQlyZW1vdGUtZW5kcG9p
bnQgPSA8JnJnYl9vdXQ+OwotCQkJCX07Ci0JCQl9OwotCi0JCQlwb3J0QDEgewotCQkJCXJlZyA9
IDwxPjsKLQotCQkJCWx2ZHNfZW5jX291dDogZW5kcG9pbnRAMCB7Ci0JCQkJCXJlbW90ZS1lbmRw
b2ludCA9IDwmcGFuZWxfaW4+OwotCQkJCX07Ci0JCQl9OwotCQl9OwotCX07Ci0tIAoyLjcuNAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
