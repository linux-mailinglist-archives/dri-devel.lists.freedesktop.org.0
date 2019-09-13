Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CF1B2856
	for <lists+dri-devel@lfdr.de>; Sat, 14 Sep 2019 00:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A535E6F482;
	Fri, 13 Sep 2019 22:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58EEB6F482
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 22:27:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D2B3F30821C1;
 Fri, 13 Sep 2019 22:27:11 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE57D60C57;
 Fri, 13 Sep 2019 22:27:08 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/encoder: Various doc fixes
Date: Fri, 13 Sep 2019 18:27:00 -0400
Message-Id: <20190913222704.8241-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 13 Sep 2019 22:27:11 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U29tZSByYW5kb20gaXNzdWVzIHdpdGggZG9jdW1lbnRhdGlvbiB0aGF0IEkgbm90aWNlZCB3aGls
ZSB3b3JraW5nIG9uCm5vdXZlYXUgdGhlIG90aGVyIGRheS4gVGhlcmUgYXJlIG5vIGZ1bmN0aW9u
YWwgY2hhbmdlcyBpbiB0aGlzIHNlcmllcy4KCkx5dWRlIFBhdWwgKDMpOgogIGRybS9lbmNvZGVy
OiBGaXggcG9zc2libGVfY2xvbmVzIGRvY3VtZW50YXRpb24KICBkcm0vZW5jb2RlcjogRml4IHBv
c3NpYmxlX2NydGNzIGRvY3VtZW50YXRpb24KICBkcm0vZW5jb2RlcjogRG9uJ3QgcmFpc2Ugdm9p
Y2UgaW4gZHJtX2VuY29kZXJfbWFzaygpIGRvY3VtZW50YXRpb24KCiBpbmNsdWRlL2RybS9kcm1f
ZW5jb2Rlci5oIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMg
ZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
