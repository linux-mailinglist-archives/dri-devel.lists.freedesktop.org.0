Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D27EEC8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9BC96ED17;
	Fri,  2 Aug 2019 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com
 [210.160.252.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09BE76ECDB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:39:37 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="22931916"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie6.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:36 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id A61B64007528;
 Fri,  2 Aug 2019 16:34:32 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH/RFC 01/12] dt-bindings: display: renesas: lvds: RZ/G2E needs
 renesas, companion too
Date: Fri,  2 Aug 2019 08:33:58 +0100
Message-Id: <1564731249-22671-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG9jdW1lbnQgUlovRzJFIHN1cHBvcnQgZm9yIHByb3BlcnR5IHJlbmVzYXMsY29tcGFuaW9uLgoK
U2lnbmVkLW9mZi1ieTogRmFicml6aW8gQ2FzdHJvIDxmYWJyaXppby5jYXN0cm9AYnAucmVuZXNh
cy5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJp
ZGdlL3JlbmVzYXMsbHZkcy50eHQgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvcmVuZXNhcyxsdmRzLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0
CmluZGV4IGM2YTE5NmQuLmRlY2U3OWUgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMudHh0CisrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2JyaWRnZS9yZW5lc2FzLGx2ZHMu
dHh0CkBAIC00OSw5ICs0OSw5IEBAIEVhY2ggcG9ydCBzaGFsbCBoYXZlIGEgc2luZ2xlIGVuZHBv
aW50LgogT3B0aW9uYWwgcHJvcGVydGllczoKIAogLSByZW5lc2FzLGNvbXBhbmlvbiA6IHBoYW5k
bGUgdG8gdGhlIGNvbXBhbmlvbiBMVkRTIGVuY29kZXIuIFRoaXMgcHJvcGVydHkgaXMKLSAgbWFu
ZGF0b3J5IGZvciB0aGUgZmlyc3QgTFZEUyBlbmNvZGVyIG9uIEQzIGFuZCBFMyBTb0NzLCBhbmQg
c2hhbGwgcG9pbnQgdG8KLSAgdGhlIHNlY29uZCBlbmNvZGVyIHRvIGJlIHVzZWQgYXMgYSBjb21w
YW5pb24gaW4gZHVhbC1saW5rIG1vZGUuIEl0IHNoYWxsIG5vdAotICBiZSBzZXQgZm9yIGFueSBv
dGhlciBMVkRTIGVuY29kZXIuCisgIG1hbmRhdG9yeSBmb3IgdGhlIGZpcnN0IExWRFMgZW5jb2Rl
ciBvbiBSLUNhciBEMywgUi1DYXIgRTMsIGFuZCBSWi9HMkUgU29DcywKKyAgYW5kIHNoYWxsIHBv
aW50IHRvIHRoZSBzZWNvbmQgZW5jb2RlciB0byBiZSB1c2VkIGFzIGEgY29tcGFuaW9uIGluIGR1
YWwtbGluaworICBtb2RlLiBJdCBzaGFsbCBub3QgYmUgc2V0IGZvciBhbnkgb3RoZXIgTFZEUyBl
bmNvZGVyLgogCiAKIEV4YW1wbGU6Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
