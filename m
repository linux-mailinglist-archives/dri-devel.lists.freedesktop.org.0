Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A5B9FCF6
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 10:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8253899AB;
	Wed, 28 Aug 2019 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10366896EB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 08:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 3DDE6D833F;
 Wed, 28 Aug 2019 09:59:54 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 0PrU-wBeZB85; Wed, 28 Aug 2019 09:59:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 01FBCD833B;
 Wed, 28 Aug 2019 09:59:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AS_XgI9h5Oul; Wed, 28 Aug 2019 09:59:42 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com
 [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id F20B3D8332;
 Wed, 28 Aug 2019 09:59:41 +0200 (CEST)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v4 4/5] dt-bindings: display: armada: Add more compatible
 strings
Date: Wed, 28 Aug 2019 09:59:37 +0200
Message-Id: <20190828075938.318028-5-lkundrak@v3.sk>
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

VGhlcmUncyBhIGdlbmVyaWMgY29tcGF0aWJsZSBzdHJpbmcgYW5kIHRoZSBkcml2ZXIgd2lsbCB3
b3JrIG9uIGEgTU1QMiBhcwp3ZWxsLCB1c2luZyB0aGUgc2FtZSBiaW5kaW5nLgoKU2lnbmVkLW9m
Zi1ieTogTHVib21pciBSaW50ZWwgPGxrdW5kcmFrQHYzLnNrPgpSZXZpZXdlZC1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCi0tLQpDaGFuZ2VzIHNpbmNlIHYzOgotIENvbGxlY3Rl
ZCBSb2IncyBSZXZpZXdlZC1ieSB0YWcKCkNoYW5nZXMgc2luY2UgdjI6Ci0gT3JkZXIgbWFydmVs
bCxhcm1hZGEtbGNkYyBhZnRlciB0aGUgbW9kZWwtc3BlY2lmaWMgc3RyaW5ncy4KCkNoYW5nZXMg
c2luY2UgdjE6Ci0gQWRkZWQgbWFydmVsbCxhcm1hZGEtbGNkYyBjb21wYXRpYmxlIHN0cmluZy4K
CiAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21hcnZlbGwsYXJtYWRhLWxjZGMudHh0
ICAgICAgICB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvbWFydmVsbCxhcm1hZGEtbGNkYy50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tYXJ2ZWxsLGFybWFkYS1sY2RjLnR4dAppbmRleCAyNjA2YThlZmM5
NTY4Li4wZWE0Y2JlNWEzMmVlIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tYXJ2ZWxsLGFybWFkYS1sY2RjLnR4dAorKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tYXJ2ZWxsLGFybWFkYS1sY2RjLnR4dApA
QCAtMyw3ICszLDggQEAgTWFydmVsbCBBcm1hZGEgTENEIGNvbnRyb2xsZXIKIAogUmVxdWlyZWQg
cHJvcGVydGllczoKIAotIC0gY29tcGF0aWJsZTogdmFsdWUgc2hvdWxkIGJlICJtYXJ2ZWxsLGRv
dmUtbGNkIi4KKyAtIGNvbXBhdGlibGU6IHZhbHVlIHNob3VsZCBiZSAibWFydmVsbCxkb3ZlLWxj
ZCIgb3IgIm1hcnZlbGwsbW1wMi1sY2QiLAorICAgZGVwZW5kaW5nIG9uIHRoZSBleGFjdCBTb0Mg
bW9kZWwsIGFsb25nIHdpdGggIm1hcnZlbGwsYXJtYWRhLWxjZGMiCiAgLSByZWc6IGJhc2UgYWRk
cmVzcyBhbmQgc2l6ZSBvZiB0aGUgTENEIGNvbnRyb2xsZXIKICAtIGludGVycnVwdHM6IHNpbmds
ZSBpbnRlcnJ1cHQgbnVtYmVyIGZvciB0aGUgTENEIGNvbnRyb2xsZXIKIAotLSAKMi4yMS4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
