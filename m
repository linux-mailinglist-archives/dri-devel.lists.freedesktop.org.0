Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB5A160D0A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5530B6E82F;
	Mon, 17 Feb 2020 08:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED796E21A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:09:33 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 289109782C;
 Sat, 15 Feb 2020 18:09:33 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 48KdYm6bFrz4Wy6;
 Sat, 15 Feb 2020 18:09:32 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from skull.home.blih.net (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 7FA00197EE;
 Sat, 15 Feb 2020 18:09:31 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@intel.com, efremov@linux.com,
 tzimmermann@suse.de, noralf@tronnes.org, sam@ravnborg.org,
 chris@chris-wilson.co.uk, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] drm/client: Dual licence the file in GPL-2 and MIT
Date: Sat, 15 Feb 2020 19:09:10 +0100
Message-Id: <20200215180911.18299-2-manu@FreeBSD.org>
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
IHRoaXMgZmlsZSBhcmUgOgpDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
RGVuaXMgRWZyZW1vdiA8ZWZyZW1vdkBsaW51eC5jb20+CkphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+Ck1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KTm9yYWxmIFRy
w7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+ClNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+CgpTaWduZWQtb2ZmLWJ5
OiBFbW1hbnVlbCBWYWRvdCA8bWFudUBGcmVlQlNELm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2NsaWVudC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKaW5kZXggYjAzMWI0NWFhOGVmLi42YjBjNmVmOGI5
YjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnQuYwpAQCAtMSw0ICsxLDQgQEAKLS8vIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBHUEwtMi4wCisvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCBv
ciBNSVQKIC8qCiAgKiBDb3B5cmlnaHQgMjAxOCBOb3JhbGYgVHLDuG5uZXMKICAqLwotLSAKMi4y
NS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
