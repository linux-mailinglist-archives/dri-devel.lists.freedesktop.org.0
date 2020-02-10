Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A939158A57
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 08:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190A66EDBB;
	Tue, 11 Feb 2020 07:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 606 seconds by postgrey-1.36 at gabe;
 Mon, 10 Feb 2020 15:46:02 UTC
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253866ECA3
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2020 15:46:02 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id AF39379FFC;
 Mon, 10 Feb 2020 15:35:58 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 48GVNt3Wgvz4c85;
 Mon, 10 Feb 2020 15:35:58 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from skull.home.blih.net (lfbn-idf2-1-1164-130.w90-92.abo.wanadoo.fr
 [90.92.223.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 58EF722AF;
 Mon, 10 Feb 2020 15:35:57 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, tzimmermann@suse.de, kraxel@redhat.com
Subject: [PATCH 1/2] drm/client: Dual licence the file in GPL-2 and MIT
Date: Mon, 10 Feb 2020 16:35:43 +0100
Message-Id: <20200210153544.24750-2-manu@FreeBSD.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210153544.24750-1-manu@FreeBSD.org>
References: <20200210153544.24750-1-manu@FreeBSD.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 11 Feb 2020 07:26:04 +0000
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
Cc: Emmanuel Vadot <manu@FreeBSD.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1tYW51ZWwgVmFkb3QgPG1hbnVARnJlZUJTRC5Pcmc+CgpDaGFuZ2UgdGhlIGxpY2Vu
Y2UgdG8gYSBkdWFsIG9uZSB3aXRoIE1JVCBzbyBCU0RzIGNvdWxkIHVzZSB0aGlzIGZpbGUuCgpT
aWduZWQtb2ZmLWJ5OiBFbW1hbnVlbCBWYWRvdCA8bWFudUBGcmVlQlNELm9yZz4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9j
bGllbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKaW5kZXggYjAzMWI0NWFhOGVm
Li42YjBjNmVmOGI5YjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYwpAQCAtMSw0ICsxLDQgQEAKLS8vIFNQ
RFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMCBvciBNSVQKIC8qCiAgKiBDb3B5cmlnaHQgMjAxOCBOb3JhbGYgVHLDuG5uZXMK
ICAqLwotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
