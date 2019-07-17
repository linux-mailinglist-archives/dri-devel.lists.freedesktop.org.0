Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF326BB03
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 13:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE806E10E;
	Wed, 17 Jul 2019 11:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 319D46E10E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 11:06:26 +0000 (UTC)
Received: from [191.33.154.161] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hnhlP-0005Q3-Mh; Wed, 17 Jul 2019 11:06:23 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hnhlN-0003Ce-PJ; Wed, 17 Jul 2019 08:06:21 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: 
Subject: [PATCH 2/2] docs: gpu: add msm-crash-dump.rst to the index.rst file
Date: Wed, 17 Jul 2019 08:06:20 -0300
Message-Id: <4d4868a11449a1a34f38da48f527c051fc00e1a9.1563361575.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <7f18c2e0b5e39e6b7eb55ddeb043b8b260b49f2d.1563361575.git.mchehab+samsung@kernel.org>
References: <7f18c2e0b5e39e6b7eb55ddeb043b8b260b49f2d.1563361575.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TeaGt8pI6Vwu62riXQZpDCGAriDc3nIBGdy7UclDHhY=; b=FeMM/bySi/3Y6cSmJk5saNZbaU
 GG3cdUvXOnJHZWBAHQhc+/KdyjiNXtSqVsQ5SZ/bR4TmoQx/mf3E5U+8HIGgYQjcgADgNI++NKFhp
 lmOCgTVlKj8ExD94fq5YvqDF4II1KNkFaPFXD+ZvRaUojFcsWwqWyLQeHTFck6iTMhZjr3NjrLBMD
 /RUlAWOW40MeRx8ve5+evfiMOCGXyAtyS1IHZC+4VJIaHQikG5PgGuJ2M7Uko9DydNypN3sgmIEIc
 3uadI/5oT+geRYMxp0DHTbIrCbIn4fAQ2z8ljf13lWZCJCuS4xd6c+t+/M9KtPcSixpQVwnAOR4yk
 TjzuBbUg==;
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
Cc: Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmaWxlIGlzIGN1cnJlbnRseSBvcnBoYW5lZC4KClNpZ25lZC1vZmYtYnk6IE1hdXJvIENh
cnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+Ci0tLQogRG9jdW1lbnRh
dGlvbi9ncHUvZHJpdmVycy5yc3QgICAgICAgIHwgMSArCiBEb2N1bWVudGF0aW9uL2dwdS9tc20t
Y3Jhc2gtZHVtcC5yc3QgfCAyIC0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0
IGIvRG9jdW1lbnRhdGlvbi9ncHUvZHJpdmVycy5yc3QKaW5kZXggNGJmYjcwNjhlOWY3Li42Yzg4
YzU3YjkwY2YgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0CisrKyBi
L0RvY3VtZW50YXRpb24vZ3B1L2RyaXZlcnMucnN0CkBAIC0yMCw2ICsyMCw3IEBAIEdQVSBEcml2
ZXIgRG9jdW1lbnRhdGlvbgogICAgeGVuLWZyb250CiAgICBhZmJjCiAgICBrb21lZGEta21zCisg
ICBtc20tY3Jhc2gtZHVtcAogCiAuLiBvbmx5OjogIHN1YnByb2plY3QgYW5kIGh0bWwKIApkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9ncHUvbXNtLWNyYXNoLWR1bXAucnN0IGIvRG9jdW1lbnRh
dGlvbi9ncHUvbXNtLWNyYXNoLWR1bXAucnN0CmluZGV4IDI0MGVmMjAwZjc2Yy4uNzU3Y2QyNTdl
MGQ4IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS9tc20tY3Jhc2gtZHVtcC5yc3QKKysr
IGIvRG9jdW1lbnRhdGlvbi9ncHUvbXNtLWNyYXNoLWR1bXAucnN0CkBAIC0xLDUgKzEsMyBAQAot
Om9ycGhhbjoKLQogPT09PT09PT09PT09PT09PT09PT09CiBNU00gQ3Jhc2ggRHVtcCBGb3JtYXQK
ID09PT09PT09PT09PT09PT09PT09PQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
