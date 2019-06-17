Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B8D49A04
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7296E0F3;
	Tue, 18 Jun 2019 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 301 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 14:42:33 UTC
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2CE89276
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 14:42:33 +0000 (UTC)
Received: from ramsan ([84.194.111.163]) by andre.telenet-ops.be with bizsmtp
 id RqdV2000T3XaVaC01qdVHV; Mon, 17 Jun 2019 16:37:30 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcslF-0002J3-Jg; Mon, 17 Jun 2019 16:37:29 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1hcslF-0001IY-IN; Mon, 17 Jun 2019 16:37:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: Add missing newline at end of file
Date: Mon, 17 Jun 2019 16:37:28 +0200
Message-Id: <20190617143728.4949-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ImdpdCBkaWZmIiBzYXlzOgoKICAgIFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQoKYWZ0ZXIg
bW9kaWZ5aW5nIHRoZSBmaWxlLgoKU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
bW9kdWxlcy9wb3dlci9NYWtlZmlsZSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9tb2R1bGVzL3Bvd2VyL01ha2VmaWxlIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L21vZHVsZXMvcG93ZXIvTWFrZWZpbGUKaW5kZXggODc4NTFmODkyYTUyZDM3Mi4uOWQxYjIyZDM1
ZWNlOTEzNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMv
cG93ZXIvTWFrZWZpbGUKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L21vZHVsZXMv
cG93ZXIvTWFrZWZpbGUKQEAgLTI4LDQgKzI4LDQgQEAgTU9EX1BPV0VSID0gcG93ZXJfaGVscGVy
cy5vCiBBTURfREFMX01PRF9QT1dFUiA9ICQoYWRkcHJlZml4ICQoQU1EREFMUEFUSCkvbW9kdWxl
cy9wb3dlci8sJChNT0RfUE9XRVIpKQogIyQoaW5mbyAqKioqKioqKioqKiogIERBTCBQT1dFUiBN
T0RVTEUgTUFLRUZJTEUgKioqKioqKioqKioqKQogCi1BTURfRElTUExBWV9GSUxFUyArPSAkKEFN
RF9EQUxfTU9EX1BPV0VSKQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKK0FNRF9ESVNQTEFZ
X0ZJTEVTICs9ICQoQU1EX0RBTF9NT0RfUE9XRVIpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
