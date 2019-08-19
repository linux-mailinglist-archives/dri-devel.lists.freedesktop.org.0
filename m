Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8ED94E9E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 21:58:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD446E286;
	Mon, 19 Aug 2019 19:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7706E286
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 19:57:57 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from haswell.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 18193891-1500050 
 for multiple; Mon, 19 Aug 2019 20:57:42 +0100
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Use %zu for printing sizeof
Date: Mon, 19 Aug 2019 20:57:40 +0100
Message-Id: <20190819195740.27608-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
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
Cc: kbuild-all@01.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSAlenUgZm9ybWF0IHNwZWNpZmllciBmb3IgYSBzaXplX3QgcmV0dXJuZWQgYnkgc2l6
ZW8uCgpSZXBvcnRlZC1ieToga2J1aWxkLWFsbEAwMS5vcmcKU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3N0
LWRtYS1mZW5jZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jIGIv
ZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jCmluZGV4IDNkNjk0MDU5NTJhYS4uNmZiYWU2
YmY2NTc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvc3QtZG1hLWZlbmNlLmMKKysrIGIv
ZHJpdmVycy9kbWEtYnVmL3N0LWRtYS1mZW5jZS5jCkBAIC01NTcsNyArNTU3LDcgQEAgaW50IGRt
YV9mZW5jZSh2b2lkKQogCX07CiAJaW50IHJldDsKIAotCXByX2luZm8oInNpemVvZihkbWFfZmVu
Y2UpPSVsdVxuIiwgc2l6ZW9mKHN0cnVjdCBkbWFfZmVuY2UpKTsKKwlwcl9pbmZvKCJzaXplb2Yo
ZG1hX2ZlbmNlKT0lenVcbiIsIHNpemVvZihzdHJ1Y3QgZG1hX2ZlbmNlKSk7CiAKIAlzbGFiX2Zl
bmNlcyA9IEtNRU1fQ0FDSEUobW9ja19mZW5jZSwKIAkJCQkgU0xBQl9UWVBFU0FGRV9CWV9SQ1Ug
fAotLSAKMi4yMy4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
