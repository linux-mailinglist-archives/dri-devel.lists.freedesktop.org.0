Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AF29FD01
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 146D389CD5;
	Wed, 28 Aug 2019 08:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 395D289725
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id BC4C7D832D;
 Wed, 28 Aug 2019 09:59:57 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id S8cKjMhYL0Ji; Wed, 28 Aug 2019 09:59:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 9A0F4D833A;
 Wed, 28 Aug 2019 09:59:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ih7jdCbCCXrQ; Wed, 28 Aug 2019 09:59:42 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 88E7FD832D;
 Wed, 28 Aug 2019 09:59:41 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 2/5] dt-bindings: display: armada: Rename the binding doc
 file
Date: Wed, 28 Aug 2019 09:59:35 +0200
Message-Id: <20190828075938.318028-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190828075938.318028-1-lkundrak@v3.sk>
References: <20190828075938.318028-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 28 Aug 2019 08:28:09 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lubomir Rintel <lkundrak@v3.sk>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGEgbW9yZSBnZW5lcmljIG5hbWUsIHNpbmNlIGl0IHdpbGwgZG9jdW1lbnQgbW9yZSBjb21w
YXRpYmxlIExDRApjb250cm9sbGVycyB0aGFuIGp1c3QgdGhhdCBvZiBEb3ZlLiBBbHNvLCB0aGVy
ZSdzIG5vIHBvaW50IHB1dHRpbmcgaXQgaW4KYSBzZXBhcmF0ZSBkaXJlY3RvcnkuCgpTaWduZWQt
b2ZmLWJ5OiBMdWJvbWlyIFJpbnRlbCA8bGt1bmRyYWtAdjMuc2s+CgotLS0KQ2hhbmdlcyBzaW5j
ZSB2MToKLSBDaG9vc2UgYSBiZXR0ZXIgbmFtZSB0aGFuIGFybWFkYS9tYXJ2ZWxsLWFybWFkYS1k
cm0udHh0LCBzaW5jZQogIHRoZXJlIHdpbGwgYmUgbm8gZGlzcGxheS1zdWJzeXN0ZW0gbWFzdGVy
IG5vZGUgYW5kIHRodXMgaXQgd2lsbAogIG9ubHkgZG9jdW1lbnQganVzdCB0aGUgTENEQy4KCiAu
Li4ve2FybWFkYS9tYXJ2ZWxsLGRvdmUtbGNkLnR4dCA9PiBtYXJ2ZWxsLGFybWFkYS1sY2RjLnR4
dH0gICAgfCAwCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2Rpc3BsYXkve2FybWFkYS9tYXJ2ZWxsLGRvdmUtbGNkLnR4dCA9PiBtYXJ2ZWxsLGFybWFkYS1s
Y2RjLnR4dH0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXJtYWRhL21hcnZlbGwsZG92ZS1sY2QudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWFydmVsbCxhcm1hZGEtbGNkYy50eHQKc2lt
aWxhcml0eSBpbmRleCAxMDAlCnJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2FybWFkYS9tYXJ2ZWxsLGRvdmUtbGNkLnR4dApyZW5hbWUgdG8gRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWFydmVsbCxhcm1hZGEtbGNk
Yy50eHQKZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKaW5kZXggM2Q4MjRl
Y2Y5NjIyOS4uZDM3OWFjZDRmNjljZSAxMDA2NDQKLS0tIGEvTUFJTlRBSU5FUlMKKysrIGIvTUFJ
TlRBSU5FUlMKQEAgLTk2MjAsNyArOTYyMCw3IEBAIFQ6CWdpdCBnaXQ6Ly9naXQuYXJtbGludXgu
b3JnLnVrL35ybWsvbGludXgtYXJtLmdpdCBkcm0tYXJtYWRhLWRldmVsCiBUOglnaXQgZ2l0Oi8v
Z2l0LmFybWxpbnV4Lm9yZy51ay9+cm1rL2xpbnV4LWFybS5naXQgZHJtLWFybWFkYS1maXhlcwog
RjoJZHJpdmVycy9ncHUvZHJtL2FybWFkYS8KIEY6CWluY2x1ZGUvdWFwaS9kcm0vYXJtYWRhX2Ry
bS5oCi1GOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9hcm1hZGEv
CitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tYXJ2ZWxsLGFy
bWFkYS1sY2RjLnR4dAogRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jlc2Vy
dmVkLW1lbW9yeS9tYXJ2ZWxsLGFybWFkYS1mcmFtZWJ1ZmZlci50eHQKIAogTUFSVkVMTCBBUk1B
REEgMzcwMCBQSFkgRFJJVkVSUwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
