Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CBD160CD8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:21:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA94D6E7E2;
	Mon, 17 Feb 2020 08:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C026D6E21D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:09:35 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 3BD8497832;
 Sat, 15 Feb 2020 18:09:35 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 48KdYq05H1z4WyC;
 Sat, 15 Feb 2020 18:09:35 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from skull.home.blih.net (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 95E5D197EF;
 Sat, 15 Feb 2020 18:09:33 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@intel.com, efremov@linux.com,
 tzimmermann@suse.de, noralf@tronnes.org, sam@ravnborg.org,
 chris@chris-wilson.co.uk, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/format_helper: Dual licence the file in GPL 2 and
 MIT
Date: Sat, 15 Feb 2020 19:09:11 +0100
Message-Id: <20200215180911.18299-3-manu@FreeBSD.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200215180911.18299-1-manu@FreeBSD.org>
References: <20200215180911.18299-1-manu@FreeBSD.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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
Cc: Emmanuel Vadot <manu@FreeBSD.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1tYW51ZWwgVmFkb3QgPG1hbnVARnJlZUJTRC5Pcmc+CgpDb250cmlidXRvcnMgZm9y
IHRoaXMgZmlsZSBhcmUgOgpHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KTWF4aW1l
IFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9u
bmVzLm9yZz4KClNpZ25lZC1vZmYtYnk6IEVtbWFudWVsIFZhZG90IDxtYW51QEZyZWVCU0Qub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zv
cm1hdF9oZWxwZXIuYwppbmRleCAwODk3Y2I5YWVhZmYuLjNiODE4ZjJiMjM5MiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9mb3JtYXRfaGVscGVyLmMKQEAgLTEsNCArMSw0IEBACi0vKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCAqLworLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAgb3IgTUlUCiAvKgogICogQ29weXJpZ2h0IChDKSAyMDE2IE5vcmFsZiBUcsO4bm5lcwogICoK
LS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
