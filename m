Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E043F109B85
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 10:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAFF6E2B1;
	Tue, 26 Nov 2019 09:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 754536E2B1
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 09:53:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAQ9rGIc105936;
 Tue, 26 Nov 2019 03:53:16 -0600
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAQ9rGgs022523
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Nov 2019 03:53:16 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 26
 Nov 2019 03:53:15 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 26 Nov 2019 03:53:15 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAQ9r71l044654;
 Tue, 26 Nov 2019 03:53:13 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 5/5] MAINTAINERS: add entry for tidss
Date: Tue, 26 Nov 2019 11:53:07 +0200
Message-ID: <53c192dae8c1d00239b11c2ecf39bc2eeb18846c.1574760777.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574760777.git.jsarha@ti.com>
References: <cover.1574760777.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574761996;
 bh=Xk7tzyu/jY3vtXBU0biSBQFLe3tJ8/HzkFzo9GDFBMM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ialjRgOMkfTKTurrhFDZqfKZHrB1/y015DclTjYV54EJYLuwSMR91e5ajTDl8INIV
 0KvqJu9YfKnkkMP/ntROZ2FI1zukXsrtkosmPriOYTV/IHY3wA54ALNlVdqSSt0cqf
 nI5VZQxSHFug7bUDteye8WszSV12PJzVS5sAZMV0=
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
QUlOVEFJTkVSUwppbmRleCBlYjE5ZmFkMzcwZDcuLjU1NmI3NDI1ZTg4MyAxMDA2NDQKLS0tIGEv
TUFJTlRBSU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTU1NTQsNiArNTU1NCwxNiBAQCBGOglp
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
