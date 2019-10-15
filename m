Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB46D899F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4977D6E8DC;
	Wed, 16 Oct 2019 07:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E988F6E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 19:18:58 +0000 (UTC)
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
 by Galois.linutronix.de with esmtp (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1iKSLD-00067i-7g; Tue, 15 Oct 2019 21:18:43 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 28/34] drm/i810: Refer to `PREEMPTION' in comment
Date: Tue, 15 Oct 2019 21:18:15 +0200
Message-Id: <20191015191821.11479-29-bigeasy@linutronix.de>
In-Reply-To: <20191015191821.11479-1-bigeasy@linutronix.de>
References: <20191015191821.11479-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
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
Cc: David Airlie <airlied@linux.ie>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 dri-devel@lists.freedesktop.org, tglx@linutronix.de,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRlcGVuZGVuY3kgaGFzIGJlZW4gY2hhbmdlZCBmcm9tIGBQUkVFTVBUJyB0byBgUFJFRU1Q
VElPTicuIFJlZmxlY3QKdGhpcyBjaGFuZ2UgaW4gdGhlIGNvbW1lbnQuCgpVc2UgYFBSRUVNUFRJ
T04nIGluIHRoZSBjb21tZW50LgoKQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5v
cmc+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWly
bGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogU2ViYXN0aWFuIEFu
ZHJ6ZWogU2lld2lvciA8YmlnZWFzeUBsaW51dHJvbml4LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9LY29uZmlnIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL0tjb25maWcgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZwppbmRleCBlNjdjMTk0YzJhY2FkLi41ZjZkY2JiZWIwYzFiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZwpAQCAtMzk3LDcgKzM5Nyw3IEBAIGNvbmZpZyBEUk1fUjEyOAogCiBjb25maWcgRFJNX0k4MTAK
IAl0cmlzdGF0ZSAiSW50ZWwgSTgxMCIKLQkjICFQUkVFTVBUIGJlY2F1c2Ugb2YgbWlzc2luZyBp
b2N0bCBsb2NraW5nCisJIyAhUFJFRU1QVElPTiBiZWNhdXNlIG9mIG1pc3NpbmcgaW9jdGwgbG9j
a2luZwogCWRlcGVuZHMgb24gRFJNICYmIEFHUCAmJiBBR1BfSU5URUwgJiYgKCFQUkVFTVBUSU9O
IHx8IEJST0tFTikKIAloZWxwCiAJICBDaG9vc2UgdGhpcyBvcHRpb24gaWYgeW91IGhhdmUgYW4g
SW50ZWwgSTgxMCBncmFwaGljcyBjYXJkLiAgSWYgTSBpcwotLSAKMi4yMy4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
