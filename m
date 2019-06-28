Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616E159A1B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 14:12:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 332B16E8F8;
	Fri, 28 Jun 2019 12:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7CA6E8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 12:12:39 +0000 (UTC)
Received: from [186.213.242.156] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hgpk3-0005BY-9l; Fri, 28 Jun 2019 12:12:35 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
 (envelope-from <mchehab@bombadil.infradead.org>)
 id 1hgpk0-0004zj-Bx; Fri, 28 Jun 2019 09:12:32 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH 7/9] docs: gpu: add msm-crash-dump.rst to the index.rst file
Date: Fri, 28 Jun 2019 09:12:29 -0300
Message-Id: <e5550abd8da391b539e9deb64b1305fc62fd00f2.1561723736.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1561723736.git.mchehab+samsung@kernel.org>
References: <cover.1561723736.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TeaGt8pI6Vwu62riXQZpDCGAriDc3nIBGdy7UclDHhY=; b=P48mKojoqFFE1MDRkjdbVDRgQU
 EsQ5VFxzLhz9BgMT+T38WG/FqVN1k2+GAgYAPnVtMixUoi7MqfmsCV1lht7wGGJrgtBIB8uvqEcoA
 O1bNc2pWd6gSxp+dHsmyV0LzHSDRPsQySyK1tzFOFxwQEY1CyNEUg8zQFgleg9WHHjvzTzWWFpzop
 DrXbaa8k7wr60EZ4V6AFQ0jB0BqcsYjkYIJ2JsSreT4OH2UMdzo1aN9ajU33eQHNlmNXFNvmwzvG9
 hrpC90S32aWAFQfBs9MjFyWEsnQ4DQABBMK5l1anOEEkre6dKkXySmHlw1+WlyE3XkZj4ucmuBF7v
 +fl4mwRA==;
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
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
