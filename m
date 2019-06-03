Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6D33FAF
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC56A89709;
	Tue,  4 Jun 2019 07:14:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7374E89189
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 15:26:25 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH v2 1/2] dt-bindings: display: Add King Display KD035G6-54NT
 panel documentation
Date: Mon,  3 Jun 2019 17:25:54 +0200
Message-Id: <20190603152555.23527-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559575583; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=HE4CQPY/zjM71d5YcrWnITVnnDDo1P+pXVsHmG+Q88g=;
 b=NVRF1jROkqVnmc5j86acG8s6j6Skd1JiciZ3tvJqM4lFS9EEo22F3D4zHJ8NUUz+ESg8/n
 0ZukzBeFUYugLS8cq2KlIOhuIwSGOh7s9XXDBsES2KjEjA2gaw2fik+vmNMme7k2hRjJft
 pXB5W+QLoqeYswOVmuMt/0YnIk2fdXM=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEtEMDM1RzYtNTROVCBpcyBhIDMuNSIgMzIweDI0MCAyNC1iaXQgVEZUIExDRCBwYW5lbC4K
ClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PgotLS0K
Ck5vdGVzOgogICAgdjI6IC0gQWRkIGFuIGFkZHJlc3MgdG8gdGhlIHBhbmVsIG5vZGUKICAgIAkt
IEFkZCBpbmZvcm1hdGlvbiBhYm91dCBTUEkgcHJvcGVydGllcwogICAgCS0gQWRkIGluZm9ybWF0
aW9uIGFib3V0IHRoZSAncG9ydCcgc3ViLW5vZGUKCiAuLi4vcGFuZWwva2luZ2Rpc3BsYXksa2Qw
MzVnNi01NG50LnR4dCAgICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYtNTRu
dC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9wYW5lbC9raW5nZGlzcGxheSxrZDAzNWc2LTU0bnQudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwva2luZ2Rpc3BsYXksa2QwMzVnNi01NG50
LnR4dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLmZhOTU5NjA4MmU0
NAotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2tpbmdkaXNwbGF5LGtkMDM1ZzYtNTRudC50eHQKQEAgLTAsMCArMSw0MiBA
QAorS2luZyBEaXNwbGF5IEtEMDM1RzYtNTROVCAzLjUiICgzMjB4MjQwIHBpeGVscykgMjQtYml0
IFRGVCBMQ0QgcGFuZWwKKworUmVxdWlyZWQgcHJvcGVydGllczoKKy0gY29tcGF0aWJsZTogc2hv
dWxkIGJlICJraW5nZGlzcGxheSxrZDAzNWc2LTU0bnQiCistIHBvd2VyLXN1cHBseTogU2VlIHBh
bmVsLWNvbW1vbi50eHQKKy0gcmVzZXQtZ3Bpb3M6IFNlZSBwYW5lbC1jb21tb24udHh0CisKK09w
dGlvbmFsIHByb3BlcnRpZXM6CistIGJhY2tsaWdodDogc2VlIHBhbmVsLWNvbW1vbi50eHQKKwor
VGhlIGdlbmVyaWMgYmluZGluZ3MgZm9yIHRoZSBTUEkgc2xhdmVzIGRvY3VtZW50ZWQgaW4gWzFd
IGFsc28gYXBwbHkuCisKK1RoZSBkZXZpY2Ugbm9kZSBjYW4gY29udGFpbiBvbmUgJ3BvcnQnIGNo
aWxkIG5vZGUgd2l0aCBvbmUgY2hpbGQKKydlbmRwb2ludCcgbm9kZSwgYWNjb3JkaW5nIHRvIHRo
ZSBiaW5kaW5ncyBkZWZpbmVkIGluIFsyXS4gVGhpcworbm9kZSBzaG91bGQgZGVzY3JpYmUgcGFu
ZWwncyB2aWRlbyBidXMuCisKK1sxXTogRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3NwaS9zcGktYnVzLnR4dAorWzJdOiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3JhcGgudHh0CisKK0V4YW1wbGU6CisKKyZzcGkgeworCXBhbmVsQDAgeworCQljb21wYXRpYmxl
ID0gImtpbmdkaXNwbGF5LGtkMDM1ZzYtNTRudCI7CisJCXJlZyA9IDwwPjsKKworCQlzcGktbWF4
LWZyZXF1ZW5jeSA9IDwzMTI1MDAwPjsKKwkJc3BpLTN3aXJlOworCQlzcGktY3MtaGlnaDsKKwor
CQlyZXNldC1ncGlvcyA9IDwmZ3BlIDIgR1BJT19BQ1RJVkVfTE9XPjsKKworCQliYWNrbGlnaHQg
PSA8JmJhY2tsaWdodD47CisJCXBvd2VyLXN1cHBseSA9IDwmbGRvNj47CisKKwkJcG9ydCB7CisJ
CQlwYW5lbF9pbnB1dDogZW5kcG9pbnQgeworCQkJCXJlbW90ZS1lbmRwb2ludCA9IDwmcGFuZWxf
b3V0cHV0PjsKKwkJCX07CisJCX07CisJfTsKK307Ci0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUx
OAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
