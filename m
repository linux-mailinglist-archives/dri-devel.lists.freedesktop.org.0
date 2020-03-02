Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885961763A5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 20:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60A006E81A;
	Mon,  2 Mar 2020 19:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A97C6E7EA;
 Mon,  2 Mar 2020 19:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 26E61FB06;
 Mon,  2 Mar 2020 20:13:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5R7glgRisUUl; Mon,  2 Mar 2020 20:13:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 930F04048D; Mon,  2 Mar 2020 20:13:36 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] drm/etnaviv: Fix typo in comment
Date: Mon,  2 Mar 2020 20:13:32 +0100
Message-Id: <a2f36aa20e749316d41303ddcabef064b035f99b.1583176306.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1583176306.git.agx@sigxcpu.org>
References: <cover.1583176306.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlICdpcycgaW5zdGVhZCBvZiAnaXQnIHNvIGl0IGJlY29tZXMgYSB2YWxpZCBzZW50ZW5jZSBh
bmQKc3BlbGwgJ3Jlc2V0dGluZycgY29ycmVjdGx5LgoKU2lnbmVkLW9mZi1ieTogR3VpZG8gR8O8
bnRoZXIgPGFneEBzaWd4Y3B1Lm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dwdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUu
YyBiL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZ3B1LmMKaW5kZXggODBiOTlhY2Vh
MWM0Li44NzNkOTEwMzE2NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0
bmF2aXZfZ3B1LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9ncHUuYwpA
QCAtNTA2LDcgKzUwNiw3IEBAIHN0YXRpYyBpbnQgZXRuYXZpdl9od19yZXNldChzdHJ1Y3QgZXRu
YXZpdl9ncHUgKmdwdSkKIAkJLyogcmVhZCBpZGxlIHJlZ2lzdGVyLiAqLwogCQlpZGxlID0gZ3B1
X3JlYWQoZ3B1LCBWSVZTX0hJX0lETEVfU1RBVEUpOwogCi0JCS8qIHRyeSByZXNldGluZyBhZ2Fp
biBpZiBGRSBpdCBub3QgaWRsZSAqLworCQkvKiB0cnkgcmVzZXR0aW5nIGFnYWluIGlmIEZFIGlz
IG5vdCBpZGxlICovCiAJCWlmICgoaWRsZSAmIFZJVlNfSElfSURMRV9TVEFURV9GRSkgPT0gMCkg
ewogCQkJZGV2X2RiZyhncHUtPmRldiwgIkZFIGlzIG5vdCBpZGxlXG4iKTsKIAkJCWNvbnRpbnVl
OwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
