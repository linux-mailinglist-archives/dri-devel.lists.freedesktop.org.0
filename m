Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA4810E21D
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2019 14:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AC46E086;
	Sun,  1 Dec 2019 13:50:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805466E086
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2019 13:50:28 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB1DoPm6018008;
 Sun, 1 Dec 2019 07:50:25 -0600
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB1DoPPe091000;
 Sun, 1 Dec 2019 07:50:25 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Sun, 1 Dec
 2019 07:50:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Sun, 1 Dec 2019 07:50:24 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB1DoLb2021717;
 Sun, 1 Dec 2019 07:50:22 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 5/5] MAINTAINERS: add entry for tidss
Date: Sun, 1 Dec 2019 15:50:21 +0200
Message-ID: <43262a281a7461be3dd5859bacc8db9bca41e729.1575203210.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1575203210.git.jsarha@ti.com>
References: <cover.1575203210.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1575208225;
 bh=OlhyvYWBm2a0NVBul4fKCDGUCrHH3P0A3ugf9sTZG3I=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=dQEKQVXndOF38dKyBg/wUck3GXlBSFBfdRqlXRJDqScJYHnzJRCWeD5NUBgRejHwN
 +C1kGVNGaylZxs9RvU2AK+SSS1baedanChf26r8H7Q54mCjZ69t+jcVJKiA9Xk6Ndo
 hURc6Kvn4TUapkSz1NwyoOFxhTHc13xGFifkyW88=
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
Cc: yamonkar@cadence.com, praneeth@ti.com, sjakhade@cadence.com,
 peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com, subhajit_paul@ti.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGVudHJ5IGZvciB0aWRzcyBEUk0gZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJo
YSA8anNhcmhhQHRpLmNvbT4KLS0tCiBNQUlOVEFJTkVSUyB8IDEwICsrKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9N
QUlOVEFJTkVSUwppbmRleCA3NDFlM2Y0MzNmNmUuLmRkNzg1NWU1OWJkMSAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTU1NjcsNiArNTU2NywxNiBAQCBGOglp
bmNsdWRlL3VhcGkvZHJtL3YzZF9kcm0uaAogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2dwdS9icmNtLGJjbS12M2QudHh0CiBUOglnaXQgZ2l0Oi8vYW5vbmdpdC5mcmVlZGVz
a3RvcC5vcmcvZHJtL2RybS1taXNjCiAKK0RSTSBEUklWRVJTIEZPUiBUSSBLRVlTVE9ORQorTToJ
SnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KK006CVRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtl
aW5lbkB0aS5jb20+CitMOglkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCitTOglNYWlu
dGFpbmVkCitGOglkcml2ZXJzL2dwdS9kcm0vdGlkc3MvCitGOglEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZGlzcGxheS90aS90aSxrMmctZHNzLnR4dAorRjoJRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGkvdGksYW02NXgtZHNzLnR4dAorRjoJRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvdGkvdGksajcyMWUtZHNzLnR4
dAorCiBEUk0gRFJJVkVSUyBGT1IgVkM0CiBNOglFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0
PgogVDoJZ2l0IGdpdDovL2dpdGh1Yi5jb20vYW5ob2x0L2xpbnV4Ci0tIApUZXhhcyBJbnN0cnVt
ZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4gWS10dW5u
dXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
