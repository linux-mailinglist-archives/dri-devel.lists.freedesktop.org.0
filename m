Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1A3211CAA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9166E21E;
	Thu,  2 Jul 2020 07:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914B06E9A7
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
 t=1593629223; bh=olxKvxDhRaCmmrGY7TxJGTOXjcVe01VG/mIzGEUxdxk=;
 h=From:To:Cc:Subject:Date:From;
 b=j1mExsuSSTGrcBm+BUVzeRR5ES3JW/9qJd2AdBBupgtU0/a3Cb3sxFdNrf61HrFwD
 Hhgsy96tJN9enhdH4a1YVNW12ReGaN325WGKbggSOlHwDaYaAAYS/BkO6tGln/oJZ8
 HQZt44UGeByoC7JdevQjvIpY4ACkcFqtNLtPyjPs=
From: Ondrej Jirman <megous@megous.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] MAINTAINERS: Update entry for st7703 driver after the rename
Date: Wed,  1 Jul 2020 20:46:40 +0200
Message-Id: <20200701184640.1674969-1-megous@megous.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ondrej Jirman <megous@megous.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciB3YXMgcmVuYW1lZCwgY2hhbmdlIHRoZSBwYXRoIGluIHRoZSBNQUlOVEFJTkVS
UyBmaWxlLgoKU2lnbmVkLW9mZi1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+
Ci0tLQogTUFJTlRBSU5FUlMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJ
TkVSUwppbmRleCA1ZjE4NmE2NjFhOWIuLmY1MTgzZWFlMDhkZiAxMDA2NDQKLS0tIGEvTUFJTlRB
SU5FUlMKKysrIGIvTUFJTlRBSU5FUlMKQEAgLTU0ODcsMTIgKzU0ODcsMTMgQEAgUzoJTWFpbnRh
aW5lZAogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
cmF5ZGl1bSxybTY3MTkxLnlhbWwKIEY6CWRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yYXlk
aXVtLXJtNjcxOTEuYwogCi1EUk0gRFJJVkVSIEZPUiBST0NLVEVDSCBKSDA1N04wMDkwMCBQQU5F
TFMKK0RSTSBEUklWRVIgRk9SIFNJVFJPTklYIFNUNzcwMyBQQU5FTFMKIE06CUd1aWRvIEfDvG50
aGVyIDxhZ3hAc2lneGNwdS5vcmc+CiBSOglQdXJpc20gS2VybmVsIFRlYW0gPGtlcm5lbEBwdXJp
LnNtPgorUjoJT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CiBTOglNYWludGFpbmVk
Ci1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9yb2Nr
dGVjaCxqaDA1N24wMDkwMC50eHQKLUY6CWRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2Nr
dGVjaC1qaDA1N24wMDkwMC5jCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
ZGlzcGxheS9wYW5lbC9yb2NrdGVjaCxqaDA1N24wMDkwMC55YW1sCitGOglkcml2ZXJzL2dwdS9k
cm0vcGFuZWwvcGFuZWwtc2l0cm9uaXgtc3Q3NzAzLmMKIAogRFJNIERSSVZFUiBGT1IgU0FWQUdF
IFZJREVPIENBUkRTCiBTOglPcnBoYW4gLyBPYnNvbGV0ZQotLSAKMi4yNy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
