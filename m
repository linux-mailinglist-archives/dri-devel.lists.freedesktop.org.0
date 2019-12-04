Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D0113122
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 18:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A516E941;
	Wed,  4 Dec 2019 17:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2432A6E941
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 17:53:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrR3P079725;
 Wed, 4 Dec 2019 11:53:27 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xB4HrR1t125780
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 4 Dec 2019 11:53:27 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Dec
 2019 11:53:20 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Dec 2019 11:53:20 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB4HrBuB048941;
 Wed, 4 Dec 2019 11:53:17 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>, <tony@atomide.com>, <sam@ravnborg.org>, 
 <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: display: Add obsolete note to "ti, tilcdc,
 panel" binding
Date: Wed, 4 Dec 2019 19:53:11 +0200
Message-ID: <eabe78184ea7125dcff50826a0ee12a892443017.1575481630.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575481630.git.jsarha@ti.com>
References: <cover.1575481630.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575482007;
 bh=F0nt7Pmnh68/O5Kde/RiIQN8BvHVUZTNfgFgZMTCYBA=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=gPv5tYmPE1KQ25A9KFhR+W/RUdD4u5Y+xbYFN5sivADptIxq8DU56lOlH19oAAh3n
 4MA827H5nsAum7axEp5scWPXKIRFuD8VcgJrv/UXdaXdPfrUOkNbcncgpINt1zewQ8
 wg4kaVpr0+DoRXEHXIGFk1dfSBv/TbgV++j7N0vI=
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
