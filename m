Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C96116D3A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 13:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF69089DCF;
	Mon,  9 Dec 2019 12:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 446 seconds by postgrey-1.36 at gabe;
 Mon, 09 Dec 2019 12:40:52 UTC
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9342A89DCF
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 12:40:52 +0000 (UTC)
Received: from localhost.localdomain
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EAEC299A;
 Mon,  9 Dec 2019 13:33:23 +0100 (CET)
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH] drm/omapdrm: Fix trivial spelling
Date: Mon,  9 Dec 2019 12:33:19 +0000
Message-Id: <20191209123320.10186-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575894804;
 bh=7N/vcjbHUP634pkpqBeAjmGDVE5vc9IYL17LL66ggYA=;
 h=From:To:Cc:Subject:Date:From;
 b=Euv+PyGQo6xXjItwNMtL2j2iPC+a9H64ZcS2oauGOLiv8XmWUexr2gs1k0X60JkI3
 jKeWDaX0yk4pi/ep5Pr7XU/8BR8rjHVYbuDCuhdvQPfQw47t1wnsKQzcyvP2TxDhQ3
 wxxF7Sdcx44jHGPWZllCdDjsSCl0v49UlZVJDP2k=
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
Cc: Jiri Kosina <trivial@kernel.org>, David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR TI OMAP" <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRyaXZpYWwgc3BlbGxpbmcgaWRlbnRpZmllZCB3aGlsZSBleGFtaW5pbmcgdGhlIGNvZGUu
CgoJcy9zdXBwcnRlZC4vc3VwcG9ydGVkLi8KClNpZ25lZC1vZmYtYnk6IEtpZXJhbiBCaW5naGFt
IDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9jcnRjLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfY3J0Yy5jCmlu
ZGV4IDNjNWRkYmYzMGU5Ny4uZmNlN2U5NDRhMjgwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2NydGMuYwpAQCAtODMxLDcgKzgzMSw3IEBAIHN0cnVjdCBkcm1fY3J0YyAqb21hcF9jcnRjX2lu
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkgKiBPTUFQX0RTU19DSEFOTkVMX0RJR0lULiBY
IHNlcnZlciBhc3N1bWVzIDI1NiBlbGVtZW50IGdhbW1hCiAJICogdGFibGVzIHNvIGxldHMgdXNl
IHRoYXQuIFNpemUgb2YgSFcgZ2FtbWEgdGFibGUgY2FuIGJlCiAJICogZXh0cmFjdGVkIHdpdGgg
ZGlzcGNfbWdyX2dhbW1hX3NpemUoKS4gSWYgaXQgcmV0dXJucyAwCi0JICogZ2FtbWEgdGFibGUg
aXMgbm90IHN1cHBydGVkLgorCSAqIGdhbW1hIHRhYmxlIGlzIG5vdCBzdXBwb3J0ZWQuCiAJICov
CiAJaWYgKHByaXYtPmRpc3BjX29wcy0+bWdyX2dhbW1hX3NpemUocHJpdi0+ZGlzcGMsIGNoYW5u
ZWwpKSB7CiAJCXVuc2lnbmVkIGludCBnYW1tYV9sdXRfc2l6ZSA9IDI1NjsKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
