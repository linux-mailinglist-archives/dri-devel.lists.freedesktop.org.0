Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E74274BC2D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 16:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E65E6E42C;
	Wed, 19 Jun 2019 14:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3404B6E3E7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 13:59:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 19 Jun 2019 06:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,392,1557212400"; d="scan'208";a="162055325"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga007.fm.intel.com with ESMTP; 19 Jun 2019 06:59:29 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 7A39914B; Wed, 19 Jun 2019 16:59:28 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] backlight: pwm_bl: convert to use SPDX identifier
Date: Wed, 19 Jun 2019 16:59:27 +0300
Message-Id: <20190619135927.29745-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 14:58:26 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVkdWNlIHNpemUgb2YgZHVwbGljYXRlZCBjb21tZW50cyBieSBzd2l0Y2hpbmcgdG8gdXNlIFNQ
RFggaWRlbnRpZmllci4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlLgoKV2hpbGUgaGVyZSwgY29ycmVj
dCBNT0RVTEVfTElDRU5TRSgpIHN0cmluZyB0byBiZSBhbGlnbmVkIHdpdGggbGljZW5zZSB0ZXh0
LgoKU2lnbmVkLW9mZi1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51
eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMgfCAxMSAr
KystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYyBiL2RyaXZl
cnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCmluZGV4IGZiNDVmODY2YjkyMy4uMWY3ZjhkNWMw
YmYxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYworKysgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9wd21fYmwuYwpAQCAtMSwxMyArMSw4IEBACisvLyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAogLyoKLSAqIGxpbnV4L2RyaXZlcnMvdmlkZW8v
YmFja2xpZ2h0L3B3bV9ibC5jCi0gKgotICogc2ltcGxlIFBXTSBiYXNlZCBiYWNrbGlnaHQgY29u
dHJvbCwgYm9hcmQgY29kZSBoYXMgdG8gc2V0dXAKKyAqIFNpbXBsZSBQV00gYmFzZWQgYmFja2xp
Z2h0IGNvbnRyb2wsIGJvYXJkIGNvZGUgaGFzIHRvIHNldHVwCiAgKiAxKSBwaW4gY29uZmlndXJh
dGlvbiBzbyBQV00gd2F2ZWZvcm1zIGNhbiBvdXRwdXQKICAqIDIpIHBsYXRmb3JtX2RhdGEgYmVp
bmcgY29ycmVjdGx5IGNvbmZpZ3VyZWQKLSAqCi0gKiBUaGlzIHByb2dyYW0gaXMgZnJlZSBzb2Z0
d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeQotICogaXQgdW5kZXIg
dGhlIHRlcm1zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSB2ZXJzaW9uIDIgYXMK
LSAqIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgogICovCiAKICNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPgpAQCAtNzA4LDUgKzcwMyw1IEBAIHN0YXRpYyBzdHJ1Y3Qg
cGxhdGZvcm1fZHJpdmVyIHB3bV9iYWNrbGlnaHRfZHJpdmVyID0gewogbW9kdWxlX3BsYXRmb3Jt
X2RyaXZlcihwd21fYmFja2xpZ2h0X2RyaXZlcik7CiAKIE1PRFVMRV9ERVNDUklQVElPTigiUFdN
IGJhc2VkIEJhY2tsaWdodCBEcml2ZXIiKTsKLU1PRFVMRV9MSUNFTlNFKCJHUEwiKTsKK01PRFVM
RV9MSUNFTlNFKCJHUEwgdjIiKTsKIE1PRFVMRV9BTElBUygicGxhdGZvcm06cHdtLWJhY2tsaWdo
dCIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
