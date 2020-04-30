Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BEF1C0EC7
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C51776EC20;
	Fri,  1 May 2020 07:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B2D6E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 15:33:55 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 62E9176FB2;
 Thu, 30 Apr 2020 15:33:55 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 49CfYb1DNjz3DD5;
 Thu, 30 Apr 2020 15:33:55 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from tails.home (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id DFDEB1A41D;
 Thu, 30 Apr 2020 15:33:53 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, matthew.d.roper@intel.com,
 noralf@tronnes.org, kraxel@redhat.com, tglx@linutronix.de
Subject: [PATCH v2 1/2] drm/client: Dual licence the header in GPL-2 and MIT
Date: Thu, 30 Apr 2020 17:33:46 +0200
Message-Id: <20200430153347.85323-1-manu@FreeBSD.org>
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
Cc: Emmanuel Vadot <manu@FreeBSD.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U291cmNlIGZpbGUgd2FzIGR1YWwgbGljZW5jZWQgYnV0IHRoZSBoZWFkZXIgd2FzIG9taXR0ZWQs
IGZpeCB0aGF0LgpDb250cmlidXRvcnMgZm9yIHRoaXMgZmlsZSBhcmU6CkRhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ck1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRl
bC5jb20+Ck1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4KTm9yYWxmIFRyw7hubmVz
IDxub3JhbGZAdHJvbm5lcy5vcmc+ClRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPgoKQWNrZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpBY2tl
ZC1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4KQWNrZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkFja2VkLWJ5OiBNYXhpbWUgUmlw
YXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4KU2lnbmVkLW9mZi1ieTogRW1tYW51ZWwgVmFkb3QgPG1hbnVARnJl
ZUJTRC5vcmc+Ci0tLQogaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX2NsaWVudC5oIGIvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oCmluZGV4IDc0MDJm
ODUyZDNjNC4uZWIyNTljMjU0N2FmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fY2xpZW50
LmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2NsaWVudC5oCkBAIC0xLDQgKzEsNCBAQAotLyogU1BE
WC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKy8qIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiBHUEwtMi4wIG9yIE1JVCAqLwogCiAjaWZuZGVmIF9EUk1fQ0xJRU5UX0hfCiAjZGVmaW5l
IF9EUk1fQ0xJRU5UX0hfCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
