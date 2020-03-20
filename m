Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3E18C877
	for <lists+dri-devel@lfdr.de>; Fri, 20 Mar 2020 09:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E326EADF;
	Fri, 20 Mar 2020 08:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF576E0FE
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Mar 2020 02:21:33 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 132707F6EA;
 Fri, 20 Mar 2020 02:21:32 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 48k6wC0Yktz45mf;
 Fri, 20 Mar 2020 02:21:31 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from tails.my.domain (om126255013092.24.openmobile.ne.jp
 [126.255.13.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 3ECF81DCC5;
 Fri, 20 Mar 2020 02:21:28 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch, matthew.d.roper@intel.com,
 noralf@tronnes.org, kraxel@redhat.com, tglx@linutronix.de
Subject: [PATCH 2/2] drm/format_helper: Dual licence the header in GPL-2 and
 MIT
Date: Fri, 20 Mar 2020 03:21:14 +0100
Message-Id: <20200320022114.2234-2-manu@FreeBSD.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200320022114.2234-1-manu@FreeBSD.org>
References: <20200320022114.2234-1-manu@FreeBSD.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 20 Mar 2020 08:01:24 +0000
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
VGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CgpTaWduZWQtb2ZmLWJ5OiBFbW1h
bnVlbCBWYWRvdCA8bWFudUBGcmVlQlNELm9yZz4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZm9ybWF0
X2hlbHBlci5oIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCBiL2lu
Y2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgKaW5kZXggYWMyMjBhYTFhMjQ1Li43YzVkNGZm
YjJhZjIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgKKysrIGIv
aW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaApAQCAtMSw0ICsxLDQgQEAKLS8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9yLWxhdGVyICovCisvKiBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMCBvciBNSVQgKi8KIC8qCiAgKiBDb3B5cmlnaHQgKEMpIDIwMTYg
Tm9yYWxmIFRyw7hubmVzCiAgKi8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
