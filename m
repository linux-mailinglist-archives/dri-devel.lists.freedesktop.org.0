Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5E7116F40
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D026E487;
	Mon,  9 Dec 2019 14:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2EC6E483
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 14:42:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgTk8068969;
 Mon, 9 Dec 2019 08:42:29 -0600
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgTWJ099070;
 Mon, 9 Dec 2019 08:42:29 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 9 Dec
 2019 08:42:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 9 Dec 2019 08:42:24 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB9EgGvg122297;
 Mon, 9 Dec 2019 08:42:22 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>, <sam@ravnborg.org>, 
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: display: Add obsolete note to "ti, tilcdc,
 panel" binding
Date: Mon, 9 Dec 2019 16:42:15 +0200
Message-ID: <459ed943fe0725200062171755bcfe5f73713d50.1575901747.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575901747.git.jsarha@ti.com>
References: <cover.1575901747.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575902549;
 bh=F0nt7Pmnh68/O5Kde/RiIQN8BvHVUZTNfgFgZMTCYBA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=EktQOM3I1jgvia9epVUaczD73PM3XUEPLoMnwGlJciybUUyZlxrbsBWuHR7sTXFkm
 1Y+tip7VHcx6zXDH/QzpXsgK4mecYnDd5fkDq1Ot7Ngy9tbdIA0d/Se4aDWmzbewX9
 nmnHkvhU0iOD6FfxXsrdrza4466wYtyIz14vwluU=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlICJ0aSx0aWxjZGMscGFuZWwiIGJpbmRpbmcgc2hvdWxkIG5vdCBiZSB1c2VkIGFueW1vcmUs
IHNpbmNlIHRpbGNkYwppcyBmdWxseSBjYXBhYmxlIG9mIHVzaW5nIGdlbmVyaWMgZHJtIHBhbmVs
cyBsaWtlIHBhbmVsLXNpbXBsZSBhbmQKcGFuZWwtY29tbW9uIGJpbmRpbmcuIEhvd2V2ZXIsIHRo
ZSBvYnNvbGV0ZSBiaW5kaW5nIGlzIHN0aWxsIHdpZGVseQp1c2VkIGluIG1hbnkgbWFpbmxpbmUg
c3VwcG9ydGVkIHBsYXRmb3JtcyB0aGF0IEkgZG8gbm90IGhhdmUgYWNjZXNzIHRvCmFuZCB3aG8g
a25vd3MgaG93IG1hbnkgY3VzdG9tIHBsYXRmb3Jtcy4gU28gSSBhbSBhZnJhaWQgd2UgaGF2ZSB0
bwprZWVwIHRoZSBvbGQgYnVuZGxlZCB0aWxjZGMgcGFuZWwgZHJpdmVyIGFyb3VuZC4KClNpZ25l
ZC1vZmYtYnk6IEp5cmkgU2FyaGEgPGpzYXJoYUB0aS5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dCB8IDYgKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQKaW5kZXgg
ODA4MjE2MzEwZWEyLi41NDk2M2Y5MTczY2MgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3RpbGNkYy9wYW5lbC50eHQKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGlsY2RjL3BhbmVsLnR4dApAQCAtMSw1
ICsxLDExIEBACiBEZXZpY2UtVHJlZSBiaW5kaW5ncyBmb3IgdGlsY2RjIERSTSBnZW5lcmljIHBh
bmVsIG91dHB1dCBkcml2ZXIKIAorTk9URTogVGhpcyBiaW5kaW5nIChhbmQgdGhlIHJlbGF0ZWQg
ZHJpdmVyKSBpcyBvYnNvbGV0ZSBhbmQgc2hvdWxkIG5vdAorICAgICAgYmUgdXNlZCBhbnltb3Jl
LiBQbGVhc2UgcmVmZXIgdG8gZHJtIHBhbmVsLWNvbW1vbiBiaW5kaW5nIChhbmQKKyAgICAgIHRv
IGEgZ2VuZXJpYyBkcm0gcGFuZWwgZHJpdmVyIGxpa2UgcGFuZWwtc2ltcGxlKS4KKyAgICAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL3BhbmVsLWNvbW1v
bi55YW1sCisgICAgICAoZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jKQorCiBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOgogIC0gY29tcGF0aWJsZTogdmFsdWUgc2hvdWxkIGJlICJ0aSx0
aWxjZGMscGFuZWwiLgogIC0gcGFuZWwtaW5mbzogY29uZmlndXJhdGlvbiBpbmZvIHRvIGNvbmZp
Z3VyZSBMQ0RDIGNvcnJlY3RseSBmb3IgdGhlIHBhbmVsCi0tIApUZXhhcyBJbnN0cnVtZW50cyBG
aW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVz
aW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
