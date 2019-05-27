Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F002B6ED
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DF36E219;
	Mon, 27 May 2019 13:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019846E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:48:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm9rh012510;
 Mon, 27 May 2019 08:48:09 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm9hX096101
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:09 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:08 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviH065947;
 Mon, 27 May 2019 08:48:07 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 4/6] dt-bindings: display: sii902x: Remove trailing white
 space
Date: Mon, 27 May 2019 16:47:55 +0300
Message-ID: <f1f2ef82c4e8ecea920c408bd4e569f5ed27d20a.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558964889;
 bh=5kqhzE3IcUtd1zhmOu0aWvtk9OmxjF6LW8lgnJDouOo=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=h4jkBklXYqOq8wLXcvzcQ0+YNv3ZXbpijcSu/H/QqyMHDtqg/qFVHjVwp29Kgo25n
 BE8ZZNAQgXHIGgbiveQJOVxBh9QDCdY1jd/L85Ywa8kjHCEhjhAALsBd07MW8m1Dwc
 CdhUvC44YxxJvvyX1437fm6tm8gXeYU9kKlfeEI4=
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

UmVtb3ZlIHRyYWlsaW5nIHdoaXRlIHNwYWNlIGZyb20gc2lpOTAyeCBkaXNwbGF5IGJyaWRnZSBi
aW5kaW5nLgoKU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJoYSA8anNhcmhhQHRpLmNvbT4KUmV2aWV3
ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4KUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL3NpaTkwMngudHh0IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdl
L3NpaTkwMngudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL3NpaTkwMngudHh0CmluZGV4IDcyZDJkYzZjM2U2Yi4uYzRjMTg1NWNhNjU0IDEwMDY0
NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2Uv
c2lpOTAyeC50eHQKKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvYnJpZGdlL3NpaTkwMngudHh0CkBAIC01LDcgKzUsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVz
OgogCS0gcmVnOiBpMmMgYWRkcmVzcyBvZiB0aGUgYnJpZGdlCiAKIE9wdGlvbmFsIHByb3BlcnRp
ZXM6Ci0JLSBpbnRlcnJ1cHRzOiBkZXNjcmliZSB0aGUgaW50ZXJydXB0IGxpbmUgdXNlZCB0byBp
bmZvcm0gdGhlIGhvc3QgCisJLSBpbnRlcnJ1cHRzOiBkZXNjcmliZSB0aGUgaW50ZXJydXB0IGxp
bmUgdXNlZCB0byBpbmZvcm0gdGhlIGhvc3QKIAkgIGFib3V0IGhvdHBsdWcgZXZlbnRzLgogCS0g
cmVzZXQtZ3Bpb3M6IE9GIGRldmljZS10cmVlIGdwaW8gc3BlY2lmaWNhdGlvbiBmb3IgUlNUX04g
cGluLgogCi0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIy
LCAwMDE4MCBIZWxzaW5raS4gWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBh
aWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
