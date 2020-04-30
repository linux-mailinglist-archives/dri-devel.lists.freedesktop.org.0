Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B5D1C0EB1
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41146EC14;
	Fri,  1 May 2020 07:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51C216E920
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 14:55:45 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2472A74D45;
 Thu, 30 Apr 2020 14:55:44 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 49CdjW6TRmz4trR;
 Thu, 30 Apr 2020 14:55:43 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from tails.home (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 9A0C419F4E;
 Thu, 30 Apr 2020 14:55:42 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, matthew.d.roper@intel.com,
 noralf@tronnes.org, kraxel@redhat.com, tglx@linutronix.de
Subject: [RESEND 2/2] drm/format_helper: Dual licence the header in GPL-2 and
 MIT
Date: Thu, 30 Apr 2020 16:55:37 +0200
Message-Id: <20200430145537.31474-1-manu@FreeBSD.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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

U291cmNlIGZpbGUgd2FzIGR1YWwgbGljZW5jZWQgYnV0IHRoZSBoZWFkZXIgd2FzIG9taXR0ZWQs
IGZpeCB0aGF0LgpDb250cmlidXRvcnMgZm9yIHRoaXMgZmlsZSBhcmU6Ck5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgpHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4K
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpBY2tlZC1ieTogR2VyZCBIb2Zm
bWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KU2lnbmVkLW9mZi1ieTogRW1tYW51ZWwgVmFkb3QgPG1hbnVARnJlZUJT
RC5vcmc+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hl
bHBlci5oCmluZGV4IGFjMjIwYWExYTI0NS4uN2M1ZDRmZmIyYWYyIDEwMDY0NAotLS0gYS9pbmNs
dWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRf
aGVscGVyLmgKQEAgLTEsNCArMSw0IEBACi0vKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vci1sYXRlciAqLworLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgb3Ig
TUlUICovCiAvKgogICogQ29weXJpZ2h0IChDKSAyMDE2IE5vcmFsZiBUcsO4bm5lcwogICovCi0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
