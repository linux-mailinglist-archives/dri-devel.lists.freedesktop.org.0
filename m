Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 441ED160D04
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618906E8BB;
	Mon, 17 Feb 2020 08:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6816E21A
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2020 18:09:32 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mx1.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id B439C97828;
 Sat, 15 Feb 2020 18:09:30 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org",
 Issuer "Let's Encrypt Authority X3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 48KdYk3cYXz4Wy4;
 Sat, 15 Feb 2020 18:09:30 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
Received: from skull.home.blih.net (lfbn-idf2-1-900-181.w86-238.abo.wanadoo.fr
 [86.238.131.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate) (Authenticated sender: manu)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 2773B197ED;
 Sat, 15 Feb 2020 18:09:29 +0000 (UTC)
 (envelope-from manu@FreeBSD.org)
From: Emmanuel Vadot <manu@FreeBSD.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@intel.com, efremov@linux.com,
 tzimmermann@suse.de, noralf@tronnes.org, sam@ravnborg.org,
 chris@chris-wilson.co.uk, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] Dual licence some files in GPL-2.0 and MIT
Date: Sat, 15 Feb 2020 19:09:09 +0100
Message-Id: <20200215180911.18299-1-manu@FreeBSD.org>
X-Mailer: git-send-email 2.25.0
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

SGVsbG8gYWxsLAoKV2UgaGFkIGEgZGlzY3Vzc2lvbiBhIHdoaWxlIGJhY2sgd2l0aCBOb3JhbGYg
d2hlcmUgaGUgc2FpZCB0aGF0IGhlIHdvdWxkbid0Cm1pbmQgZHVhbCBsaWNlbmNlIGhpcyB3b3Jr
IHVuZGVyIEdQTC0yIGFuZCBNSVQuClRob3NlIGZpbGVzIGFyZSBhIHByb2JsZW0gd2l0aCBCU0Rz
IGFzIHdlIGNhbm5vdCBpbmNsdWRlIHRoZW0uCkZvciBkcm1fY2xpZW50LmMgdGhlIG1haW4gY29u
dHJpYnV0b3JzIGFyZSBOb3JhbGYgVHLDuG5uZXMgYW5kIFRob21hcwpaaW1tZXJtYW5uLCB0aGUg
b3RoZXIgY29tbWl0cyBhcmUganVzdCBjYXRjaCB1cHMgZnJvbSBjaGFuZ2VzIGVsc2V3aGVyZQoo
cmV0dXJuIHZhbHVlcywgc3RydWN0IG1lbWJlciBuYW1lcywgZnVuY3Rpb24gcmVuYW1lcyBldGMg
Li4uKS4KRm9yIGRybV9mb3JtYXRfaGVscGVyIHRoZSBtYWluIGNvbnRyaWJ1dG9ycyBhcmUgTm9y
YWxmIFRyw7hubmVzIGFuZApHZXJkIEhvZmZtYW5uLiBTYW1lIGNvbW1lbnQgYXMgZm9yIGRybV9j
bGllbnQuYyBmb3IgdGhlIG90aGVyIGNvbW1pdHMuCgpFbW1hbnVlbCBWYWRvdCAoMik6CiAgZHJt
L2NsaWVudDogRHVhbCBsaWNlbmNlIHRoZSBmaWxlIGluIEdQTC0yIGFuZCBNSVQKICBkcm0vZm9y
bWF0X2hlbHBlcjogRHVhbCBsaWNlbmNlIHRoZSBmaWxlIGluIEdQTCAyIGFuZCBNSVQKCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jICAgICAgICB8IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZm9ybWF0X2hlbHBlci5jIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
