Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7532DB950
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 03:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CEE89BD2;
	Wed, 16 Dec 2020 02:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D26189BB3
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 02:44:16 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF5741371;
 Wed, 16 Dec 2020 03:44:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608086653;
 bh=tB3S22dez7vW9gtmI2AtIWl/SYGKyxJkX2593KsYQzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fA3AR5yCUxv9J+mXN4DC7i4VRjx1jXx1NNOYw78TY9gjORz0v+P3kpXT8FvtSGzZf
 Hg5LZ6LUibRtxlHK7St5BjSyCsgFY4pXQYTPZ79TDxlwJbZTDu4Q0nOqEwNW/WZ8q3
 o0KJzAmEPB63Ue59ap73Acu7DAovltsR2H6f05zc=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/10] drm: uapi: vmware: Use SPDX in DRM drivers uAPI
 headers
Date: Wed, 16 Dec 2020 04:43:57 +0200
Message-Id: <20201216024359.12995-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20201216024359.12995-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Roland Scheidegger <sroland@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFZNd2FyZSBEUk0gZHJpdmVyIHVBUEkgaGVhZGVyIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSBN
SVQgbGljZW5zZSwgYW5kCmNhcnJpZXMgYSBjb3B5IG9mIHRoZSBsaWNlbnNlIHdpdGggc2xpZ2h0
IHZhcmlhdGlvbnMuIFJlcGxhY2UgaXQgd2l0aCBhbgpTUERYIGhlYWRlci4KClNpZ25lZC1vZmYt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPgpSZXZpZXdlZC1ieTogUm9sYW5kIFNjaGVpZGVnZ2VyIDxzcm9sYW5kQHZtd2FyZS5j
b20+Ci0tLQogaW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmggfCAyMSArLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMjAgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmggYi9pbmNsdWRlL3Vh
cGkvZHJtL3Ztd2dmeF9kcm0uaAppbmRleCAwMmU5MTc1MDc0NzkuLjcyOGU0MzJmMDlhMSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS92bXdnZnhfZHJtLmgKKysrIGIvaW5jbHVkZS91YXBp
L2RybS92bXdnZnhfZHJtLmgKQEAgLTEsMjggKzEsOSBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IE1JVCAqLwogLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqCiAgKgogICogQ29weXJpZ2h0IMKpIDIw
MDktMjAxNSBWTXdhcmUsIEluYy4sIFBhbG8gQWx0bywgQ0EuLCBVU0EKICAqIEFsbCBSaWdodHMg
UmVzZXJ2ZWQuCiAgKgotICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBj
aGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEKLSAqIGNvcHkgb2YgdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUKLSAqICJTb2Z0d2FyZSIp
LCB0byBkZWFsIGluIHRoZSBTb2Z0d2FyZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcK
LSAqIHdpdGhvdXQgbGltaXRhdGlvbiB0aGUgcmlnaHRzIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBt
ZXJnZSwgcHVibGlzaCwKLSAqIGRpc3RyaWJ1dGUsIHN1YiBsaWNlbnNlLCBhbmQvb3Igc2VsbCBj
b3BpZXMgb2YgdGhlIFNvZnR3YXJlLCBhbmQgdG8KLSAqIHBlcm1pdCBwZXJzb25zIHRvIHdob20g
dGhlIFNvZnR3YXJlIGlzIGZ1cm5pc2hlZCB0byBkbyBzbywgc3ViamVjdCB0bwotICogdGhlIGZv
bGxvd2luZyBjb25kaXRpb25zOgotICoKLSAqIFRoZSBhYm92ZSBjb3B5cmlnaHQgbm90aWNlIGFu
ZCB0aGlzIHBlcm1pc3Npb24gbm90aWNlIChpbmNsdWRpbmcgdGhlCi0gKiBuZXh0IHBhcmFncmFw
aCkgc2hhbGwgYmUgaW5jbHVkZWQgaW4gYWxsIGNvcGllcyBvciBzdWJzdGFudGlhbCBwb3J0aW9u
cwotICogb2YgdGhlIFNvZnR3YXJlLgotICoKLSAqIFRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCAi
QVMgSVMiLCBXSVRIT1VUIFdBUlJBTlRZIE9GIEFOWSBLSU5ELCBFWFBSRVNTIE9SCi0gKiBJTVBM
SUVELCBJTkNMVURJTkcgQlVUIE5PVCBMSU1JVEVEIFRPIFRIRSBXQVJSQU5USUVTIE9GIE1FUkNI
QU5UQUJJTElUWSwKLSAqIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NFIEFORCBOT04t
SU5GUklOR0VNRU5ULiBJTiBOTyBFVkVOVCBTSEFMTAotICogVEhFIENPUFlSSUdIVCBIT0xERVJT
LCBBVVRIT1JTIEFORC9PUiBJVFMgU1VQUExJRVJTIEJFIExJQUJMRSBGT1IgQU5ZIENMQUlNLAot
ICogREFNQUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENP
TlRSQUNULCBUT1JUIE9SCi0gKiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElO
IENPTk5FQ1RJT04gV0lUSCBUSEUgU09GVFdBUkUgT1IgVEhFCi0gKiBVU0UgT1IgT1RIRVIgREVB
TElOR1MgSU4gVEhFIFNPRlRXQVJFLgotICoKICAqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KIAogI2lmbmRl
ZiBfX1ZNV0dGWF9EUk1fSF9fCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
